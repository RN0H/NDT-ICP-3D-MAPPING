#!/usr/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 

import rospy
import numpy as np
import ros_numpy
import sensor_msgs
from sensor_msgs.msg import PointCloud2 as pcl2, Imu
from sklearn.neighbors import NearestNeighbors
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from nav_msgs.msg import Odometry
from collections import defaultdict 
from myquad.msg import F64
from math import asin, acos, sin ,cos, degrees
import math
class NDT:

    def __init__(self, A, B, cellsize ,population, iterations, tolerance , odometry):
        self.A = A              #A = [[x, y, z], ...]
        self.B = B[::40]              #B = [[x, y, z], ...]
        self.N = iterations     #Number of runs
        self.E = tolerance      #feasible score
        self.C = max(cellsize,1)       #grid cell size
        self.P = population
                             #odometry
        self.T = odometry
        self.hashmap_A = defaultdict(list)

    def Distribute(self):
        '''
        Set cell size  

        Initializes hashmap A

        Implement a hash_map A  with keys as cell number        ###~~~~ TBD
        such that it contains at least 3 PointClouds


        '''
    
        for x, y, z in self.A:
            self.hashmap_A["{}{}".format(int(math.floor((x-self.C)/self.C)), int(math.floor((y-self.C)/self.C)))].append([x,y])
       
        xmean,ymean,sx,sy= 0,0,[],[]  
       
        '''

        Use the hash_map A and calculate mean and covariance within each cell
        and replace PointCloud values with it.

         for each cell in the hash_map A:

            a) Find mean(mu) of the PointClouds in it.

            b) Find the covariance(sigma) of the PointClouds in it.

            c) Find its  A[cell number] = (mu, sigma)

        '''
        self.grids = defaultdict(lambda :False)
        for k,v in self.hashmap_A.items():
            if len(v)>=self.P:

                for i in v:
                    sx.append(i[0])
                    sy.append(i[1])
                l = len(v)
       
                xmean = np.mean(sx)
                ymean = np.mean(sy)
                xsigma = (sx-xmean).dot(sx-xmean)/l + 1e-7
                ysigma = (sy-ymean).dot(sy-ymean)/l + 1e-7
                self.grids[k] = ([[xmean, ymean] ,
                                 [[1/xsigma,1/ysigma]]])
                sx = []
                sy = []
        
        return self


    def Pdf(self, u, s, x):
      

        self.invs = np.multiply(np.array(s),np.eye(2))
       
        self.q_invs = -(x - u).dot(self.invs)
        #print((x-u))
        self.q_invs_qt =   self.q_invs.dot((x - u).T)
       
        self.summand = np.exp(self.q_invs_qt/2)
        return self

    def Jacobian(self, x, y):
    
        self.j = np.array([[1,0, -x*self.si-y*self.co],
                           [0,1,  x*self.co-y*self.si]])  
        #print(self.q_invs.shape)
        self.q_invs_j =  self.q_invs.dot(self.j)
        #print(self.q_invs_j.shape)
        self.J = -self.q_invs_j.dot(self.summand)

        return self

    def Hessian(self, x, y):
       
        o = np.array([[0.0],[0.0]])
        dj = np.array([[-x*self.co + y*self.si], [-x*self.si - y*self.co]])
        h = np.array([[  o, o, o ],
                      [  o, o, o ],
                      [  o, o, dj ]])
       # h = np.array([[-x*self.co + y*self.si], [-x*self.si - y*self.co]])

        self.H =np.eye(3)*1e-2-self.summand*(self.q_invs_j.dot(self.q_invs_j) + self.q_invs.dot(h) - self.j.T.dot(self.invs).dot(self.j))
       
       
        #print((self.j.T.dot(self.invs).dot(self.j)).shape, 'asd')

        #print(self.q_invs.dot(h).shape)
        #print("----")
        return self

       

    def transform(self, tx, ty, m, xyz):
        '''

        T = |R t|.|x y z 1|.T
            |0 1|

        '''
        self.si = np.sin(m)
        self.co = np.cos(m)
        T = np.array([[self.co, -self.si,  tx ],
                      [self.si,  self.co,  ty ],      #input transform
                      [0.0    ,   0.0   ,   1]])
        self.xyz = np.dot(T,xyz.T)
        return self


    def Score(self):
       
        t = []

        grids = self.Distribute().grids

        for _ in range(self.N):
            '''
            Set initial score as 0 for next iteration
            Transform the scan according to inital/previous estimate
            '''
            score = 0
            self.B= self.transform(self.T[0], self.T[1], self.T[2], self.B).xyz.T
           
            '''
            Iterate over the PointClouds
            NOTE: If the number of PointClouds vary beyond 1000;
                  utilization of numpy for dealing with massive overheads
                  is prudent for low execution
            '''

            for x,y,z in self.B:
                #start = timeit.default_timer()

                '''
                Check which cell does the PointCloud lie in
                '''

                key_frame = "{}{}".format(int(math.floor((x-self.C)/self.C)), int(math.floor((y-self.C)/self.C)))
                   
                if key_frame in grids:
                    '''
                    1] Extract the mean and covarianve found in the key
                   
                    2]calculate the summand and add it to the score and check

                    3] calculate JH^-1... J = Jacobian Matrix; H = Hessian Matrix

                    '''
                    u, s = grids[key_frame]

                    s = self.Pdf(u, s, np.array([x,y])).summand

                    score+= s
                    
                    
                    t.append(self.Jacobian(x,y).J.dot(np.linalg.inv(self.Hessian(x,y).H)))
                #print("pclloop-------------{}ms".format(1e3*(timeit.default_timer()-start)))
            if score > self.E:
                '''
                If feasible return the transformation matrix
                '''
                return self.T
            else:
                '''
                If not calculate the mean value of the JH-1 list
                and subtract it with the transformation parameter
               
                pk+1 = pk - JH^-1
                '''
                
                self.T-= sum(np.mean(i, axis = 0) for i in t)/max(len(t),1)
                t = []
        return self.T

def best_fit_transform(A, B):
    '''
    Calculates the least-squares best-fit transform that maps corresponding points A to B in m spatial dimensions
    Input:
      A: Nxm numpy array of corresponding points
      B: Nxm numpy array of corresponding points
    Returns:
      T: (m+1)x(m+1) homogeneous transformation matrix that maps A on to B
      R: mxm rotation matrix
      t: mx1 translation vector
    '''

    assert A.shape == B.shape

    # get number of dimensions
    m = A.shape[1]

    # translate points to their centroids
    centroid_A = np.mean(A, axis=0)
    centroid_B = np.mean(B, axis=0)
    AA = A - centroid_A
    BB = B - centroid_B

    # rotation matrix
    H = np.dot(AA.T, BB)
    U, S, Vt = np.linalg.svd(H)
    R = np.dot(Vt.T, U.T)

    # special reflection case
    if np.linalg.det(R) < 0:
       Vt[m-1,:] *= -1
       R = np.dot(Vt.T, U.T)

    # translation
    t = centroid_B.T - np.dot(R,centroid_A.T)

    # homogeneous transformation
    T = np.identity(m+1)
    T[:m, :m] = R
    T[:m, m] = t

    return T, R, t


def nearest_neighbor(src, dst):
    '''
    Find the nearest (Euclidean) neighbor in dst for each point in src
    Input:
        src: Nxm array of points
        dst: Nxm array of points
    Output:
        distances: Euclidean distances of the nearest neighbor
        indices: dst indices of the nearest neighbor
    '''

    assert src.shape == dst.shape

    neigh = NearestNeighbors(n_neighbors=1)
    neigh.fit(dst)
    distances, indices = neigh.kneighbors(src, return_distance=True)
    return distances.ravel(), indices.ravel()




def icp(A, B, init_pose=None, max_iterations=20, tolerance=0.001):
    '''
    The Iterative Closest Point method: finds best-fit transform that maps points A on to points B
    Input:
        A: Nxm numpy array of source mD points
        B: Nxm numpy array of destination mD point
        init_pose: (m+1)x(m+1) homogeneous transformation
        max_iterations: exit algorithm after max_iterations
        tolerance: convergence criteria
    Output:
        T: final homogeneous transformation that maps A on to B
        distances: Euclidean distances (errors) of the nearest neighbor
        i: number of iterations to converge
    '''
    
    a = A.shape
    b = B.shape
    if a!=b:
        if a[0]>b[0]:
            A = A[:b[0],:]
        else:
            B = B[:a[0],:]


    if init_pose is not None:
        tx, ty, m = init_pose
       
        R = np.array([[cos(m), -sin(m),   0. ],
                      [sin(m),  cos(m),   0. ],      #input transform
                      [0.0    ,   0.0   , 1.]])
        t = np.array([[tx], [ty], [0]])
       
        A = (np.dot(R,A.T) + t).T
       
    #A = A[::2]
    #B = B[::2]
    # get number of dimensions
    m = A.shape[1]
     # apply the initial pose estimation
   

    # make points homogeneous, copy them to maintain the originals
    src = np.ones((m+1,A.shape[0]))
    dst = np.ones((m+1,B.shape[0]))
    src[:m,:] = np.copy(A.T)
    dst[:m,:] = np.copy(B.T)



   
    prev_error = 0

    for i in range(max_iterations):
        # find the nearest neighbors between the current source and destination points
        #start = timeit.default_timer()
        distances, indices = nearest_neighbor(src[:m,:].T, dst[:m,:].T)


        # compute the transformation between the current source and nearest destination points
        T,_,_ = best_fit_transform(src[:m,:].T, dst[:m,indices].T)
       
        # update the current source
        src = np.dot(T, src)

        # check error
        mean_error = np.mean(distances)
       
        #print("KDTree-------------{}ms".format(1e3*(timeit.default_timer()-start)))
        if np.abs(prev_error - mean_error) < tolerance:break
           
        prev_error = mean_error

    # calculate final transformation
    T,_,_ = best_fit_transform(A, src[:m,:].T)
    T[:3,:3]+=R
    return T, distances, i




l = []

pub_odom = rospy.Publisher("odom",Odometry, queue_size = 1)
data = Odometry()
data.child_frame_id = "base_link"
r = 0.0
p = 0.0
pitch = 0.0

pitch_cont = []

theta = 0.0
x = 0.0
y = 0.0
m = 0.0

cov =  np.eye(6).reshape(36)
pub_icp = rospy.Publisher("ndt_icp_yaw",F64, queue_size = 1)
pub_icp_tx = rospy.Publisher("ndt_icp_pitch",F64, queue_size = 1)
pub_icp_ty = rospy.Publisher("ndt_icp_roll",F64, queue_size = 1)
def callback(msg):
        global m, theta, x, y
        l.append(ros_numpy.point_cloud2.pointcloud2_to_xyz_array(msg))
        if len(l) == 2:
                i = icp(l[0],l[1], np.array([x, y, theta/1.14]))

                x = i[0][0][-1]
                y = i[0][1][-1]
                theta = asin(i[0][1][0])
                
                p =  acos(1/ (1+abs(x/10)))
                r  = acos(1/ (1+abs(y/10)))

                if len(pitch_cont) >= 2:
                    a = pitch_cont.pop(-2)
                    if a<pitch_cont[-1]:
                        m+=p
                    elif a>pitch_cont[-1]:
                        m-=p
                    elif -1e-5<abs(a-pitch_cont[-1])<1e-5:
                        m+=0.0
                l.pop(0)
                pub_icp.publish(degrees(theta))   
                pub_icp_tx.publish(15+ degrees(m/10))
                pub_icp_ty.publish(degrees(y))


def callback2(msg):
        global pitch,theta,  data, r, p
        roll, pitch, yaw = euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z ,msg.orientation.w] )
        pitch_cont.append(pitch)
        q = quaternion_from_euler(roll, pitch, yaw+theta)
        data.header.stamp = rospy.Time.now()
        data.pose.pose.orientation.x = q[0]
        data.pose.pose.orientation.y = q[1]
        data.pose.pose.orientation.z = q[2]
        data.pose.pose.orientation.w = q[3]

        data.pose.covariance = cov
        data.twist.covariance = cov

        pub_odom.publish(data)
        





#ros_numpy.point_cloud2.pointcloud2_to_xyz_array(geom)
if __name__ == "__main__":
    f = 1
    try:
        if f:
            rospy.init_node("icp")
            rospy.Subscriber("pcl2",pcl2,callback)
            rospy.Subscriber("imu_data",Imu,callback2)
            rospy.spin()
        else: pass
    except rospy.ROSInterruptException:
              pass


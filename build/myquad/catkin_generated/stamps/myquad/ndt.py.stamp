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
from math import asin, sin ,cos, degrees
import math

# class NDT:

#     def __init__(self, A, B, cellsize ,population, iterations, tolerance , odometry):
#         self.A = A              #A = [[x, y, z], ...]
#         self.B = B[::25]              #B = [[x, y, z], ...]
#         self.N = iterations     #Number of runs
#         self.E = tolerance      #feasible score
#         self.C = max(cellsize,1)       #grid cell size
#         self.P = population
#         self.T = odometry  #odometry

#         self.hashmap_A = defaultdict(list)

#     def Distribute(self):
#         '''
#         Set cell size  

#         Initializes hashmap A

#         Implement a hash_map A  with keys as cell number        ###~~~~ TBD
#         such that it contains at least 3 PointClouds


#         '''
#         for x, y, z in self.A:

#             self.hashmap_A["{},{}".format(int(math.floor((x-self.C)/self.C)),int(math.floor((y-self.C)/self.C)))].append([x,y])
#         xmean,ymean,sx,sy= 0,0,[],[]
        
       
#         '''

#         Use the hash_map A and calculate mean and covariance within each cell
#         and replace PointCloud values with it.

#          for each cell in the hash_map A:

#             a) Find mean(mu) of the PointClouds in it.

#             b) Find the covariance(sigma) of the PointClouds in it.

#             c) Find its  A[cell number] = (mu, sigma)

#         '''
#         self.grids = defaultdict(lambda :False)
#         for k,v in self.hashmap_A.items():
#             if len(v)>=self.P:
                
#                 for i in v:
#                     sx.append(i[0])
#                     sy.append(i[1])
 
#                 sx = np.array(sx)
#                 sy = np.array(sy)
#                 xmean = np.mean(sx)
#                 ymean = np.mean(sy)
#                 xsigma = (sx-xmean).dot(sx-xmean)/sx.size + 1e-7
#                 ysigma = (sy-ymean).dot(sy-ymean)/sy.size + 1e-7
#                 self.grids[k] = [[xmean, ymean, 0.] ,
#                                  [1/xsigma, 1/ysigma, 0.]]
#                 sx = []
#                 sy = []

#         return self


#     def Pdf(self, mean, invcov, xy):

#         self.invs  =  invcov*np.eye(3)

#         self.diff = xy - mean                                 #(N,3)

#         self.q_invs = -(self.diff).dot(self.invs)      #(N,3)

#         # self.q_invs_qt =   np.sum(np.multiply(self.q_invs, self.diff), axis = 1)    #(N,)
       
#         # self.summand = np.sum(np.exp(self.q_invs_qt/2))  #()
#         self.q_invs_qt =   np.multiply(self.q_invs, self.diff)   #(N,)
   
#         self.summand = np.sum(np.sum(np.exp(self.q_invs_qt/2), axis = 0))
#         return self

#     def transform(self, tx, ty, m, xyz):

#         self.si = np.sin(m)
#         self.co = np.cos(m)
#         R = np.array([[self.co, -self.si,   0. ],
#                       [self.si,  self.co,   0. ],      #input transform
#                       [0.0    ,   0.0   ,   1.]])
#         t = np.array([[tx], [ty], [0]])
       
#         self.xyz = np.dot(R,xyz.T) + t
#         return self


#     def Jacobian(self, xy):

#         Rs = np.array([[-self.si, -self.co,   0. ],
#                        [self.co,  -self.si,   0. ],      #input transform
#                        [0.0    ,    0.0   ,   1.]])
       
#         self.rs = np.dot(Rs, xy.T).T                                       #(3,N)=>(N,3)

#         self.j = np.array([[[1., 0., i[0]],[0., 1., i[1]] ,[0., 0., 0.]] for i in self.rs])#(N, 3,3)
       
#         self.q_invs_j = np.array(list(map(lambda i: i[0].dot(i[1]), zip(self.q_invs, self.j)))) #(N,3)
       

#         self.J = -self.q_invs_j.dot(self.summand) #(N,3)

#         return self

#     def Hessian(self, xy):
       
#         Rss = np.array([[-self.co,   self.si,   0. ],
#                         [-self.si,  -self.co,   0. ],      #input transform
#                         [0.0    ,    0.0   ,    1.]])

#         self.rss = np.dot(Rss, xy.T).T  #(3,N) =>(N,3)
#         h = np.array([[[i[0]],[i[1]], [0.]] for i in self.rss])  #(N, 3,1)
       
#         q_inv_ssq = np.sum(np.multiply(self.q_invs_j, self.q_invs_j),axis = 1)  #(N,)
   
#         q_inv_h = np.array([a.dot(b) for a,b in zip(self.q_invs, h)])

#         jt_inv_j =  np.array([i.T.dot(self.invs).dot(i) for i in self.j])
     
#         self.H =np.eye(3)*1e-7 -self.summand*(np.array([8*a+b-8*c for a,b,c in zip(q_inv_ssq, q_inv_h, jt_inv_j)])) #(N,3,3)

#         return self

       
#     def Score(self):
       
#         t = []

  
#         grids = self.Distribute().grids

#         for _ in range(self.N):
            
#             score = 0.0
           
#             self.B= self.transform(self.T[0], self.T[1], self.T[2], self.B).xyz.T


#             self.D = {}

#             for key, xy in  map(lambda i:(b','.join(i[0][:-1]),i[1].tolist()),\
#                 zip(np.int8(np.floor((self.B-self.C)/self.C)).astype("|S10"),self.B)):
#                     if grids[key]:
#                         self.D[key] = grids[key]
#                         self.D[key].append(xy)

            
#             x = []     
#             for k in self.D:
#                 d = self.D[k] = np.array(self.D[k])
#                 score+= self.Pdf(d[0], d[1], d[2:]).summand
#                 x.append(np.mean(list(map(lambda i:i[0].dot(i[1]), zip(self.Jacobian(d[2:]).J,np.linalg.inv(self.Hessian(d[2:]).H)))), axis = 0))
           
#             self.T-= np.mean(x,axis = 0)


#             if score > self.E:

#                 return self.T

            

#         return self.T

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

#def __init__(self, A, B, cellsize ,population, iterations, tolerance , tx, ty, m):
l = []
flag = 0
#pub_odom = rospy.Publisher("odom",Odometry, queue_size = 1)
#data = Odometry()
#data.child_frame_id = "base_link"
theta  = 0.0
t = 0.0
#cov =  np.eye(6).reshape(36)
pub_ndt = rospy.Publisher("ndt_topic",F64, queue_size = 1)
def callback(msg):
        global theta, flag, t
     
        l.append(ros_numpy.point_cloud2.pointcloud2_to_xyz_array(msg))
        if len(l) == 2:
                theta= NDT(l[0], l[1], 2.5, 10, 2 , 100, np.array([0.0, 0.0, t])).Score()[-1]
                t-=theta
                l.pop(0)
                #t = min(max(t,-0.035),0.45)  
                pub_ndt.publish(64.3 + degrees(t))
                flag = 1


# def callback2(msg):
#         global theta, flag, data


#         roll, pitch, yaw = euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z ,msg.orientation.w] )
#         q = quaternion_from_euler(roll, theta, yaw)

#         data.header.stamp = rospy.Time.now()
#         data.pose.pose.orientation.x = q[0]
#         data.pose.pose.orientation.y = q[1]
#         data.pose.pose.orientation.z = q[2]
#         data.pose.pose.orientation.w = q[3]

#         data.pose.covariance = cov
#         data.twist.covariance = cov

#         pub_odom.publish(data)





#ros_numpy.point_cloud2.pointcloud2_to_xyz_array(geom)
if __name__ == "__main__":
    f = 0
    try:
        if f:
            rospy.init_node("ndt")
            rospy.Subscriber("pcl2",pcl2,callback)
            #rospy.Subscriber("imu_data",Imu,callback2)
            rospy.spin()
        else: 
            pass
    except rospy.ROSInterruptException:
              pass


#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#broadcaster

import rospy
import time
import tf2_ros
import geometry_msgs.msg
from sensor_msgs.msg import Imu
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from myquad.msg import F64
from math import sin, cos

class laser_publisher:
    def __init__ (self):
            self.delta = 0.0
            rospy.init_node('imu_tf_node')
            self.flag = False
            self.rollicp = 0.0
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            #self.pub = rospy.Publisher("BunchOfPoses",mymsg, queue_size = 1)
            self.pub_imu = rospy.Publisher("imu_data",Imu,queue_size = 1)
            self.sub = rospy.Subscriber("/mavros/imu/data", Imu, self.sample)
            

    def sample(self,data):
                    self.tf_msg.header.stamp = rospy.Time.now()
                    self.delta = time.time()
                    self.tf_msg.header.frame_id = "imu_frame"
                    self.tf_msg.child_frame_id = "laser"
                    self.tf_msg.transform.translation.x = 0.0  #set to relative position
                    self.tf_msg.transform.translation.y = 0.0  #set to relative position
                    self.tf_msg.transform.translation.z = 0.0  #set to relative position
                    (r, p ,y) = euler_from_quaternion([data.orientation.x, data.orientation.y, data.orientation.z, data.orientation.w])
                    
                    #print("0 {},{}".format(y,rospy.Time.now()))
                    
                    self.pub_imu.publish(data)
                    self.tf_msg.transform.rotation.x = data.orientation.x
                    self.tf_msg.transform.rotation.y = data.orientation.y
                    self.tf_msg.transform.rotation.z = data.orientation.z
                    self.tf_msg.transform.rotation.w = data.orientation.w
                    self.tf_br.sendTransform(self.tf_msg)


                   

if __name__ =="__main__":
   try:
      laser_publisher()
      rospy.spin()
   except rospy.ROSInterruptException:
      pass


# self.ax = data.linear_acceleration.x + 9.81*sin(pitch)
# self.ay = data.linear_acceleration.y - 9.81*cos(pitch)*sin(roll)
# self.az = data.linear_acceleration.z - 9.81*cos(roll)*cos(pitch)
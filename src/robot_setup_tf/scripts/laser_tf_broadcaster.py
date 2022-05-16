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
from math import sin, cos,degrees

class laser_publisher:
    def __init__ (self):
            self.delta = 0.0
            rospy.init_node('ndt_icp_tf_node')
            self.flag = False
            self.rollicp = 0.0
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            self.sub = rospy.Subscriber("ndt_icp_topic", F64, self.sample)
            self.theta = 0


    def sample(self,data):
                    self.tf_msg.header.stamp = rospy.Time.now()
                    self.delta = time.time()
                    self.tf_msg.header.frame_id = "icp_frame"
                    self.tf_msg.child_frame_id = "laser"
                    self.tf_msg.transform.translation.x = 0.0  #set to relative position
                    self.tf_msg.transform.translation.y = 0.0  #set to relative position
                    self.tf_msg.transform.translation.z = 0.0  #set to relative position
                    #(self.roll, self.pitch, self.yaw) = euler_from_quaternion([data.orientation.x, data.orientation.y, data.orientation.z, data.orientation.w])        
                    
                    self.theta+=data.angle
                    q = quaternion_from_euler(0,0,self.theta)
                    #print("1 {},{}".format(self.theta, rospy.Time.now()))
                    
                    self.tf_msg.transform.rotation.x = q[0]#data.orientation.x
                    self.tf_msg.transform.rotation.y = q[1]#data.orientation.y
                    self.tf_msg.transform.rotation.z = q[2]#data.orientation.z
                    self.tf_msg.transform.rotation.w = q[3]#data.orientation.w
                    self.tf_br.sendTransform(self.tf_msg)


                   

if __name__ =="__main__":
   f = 1
   try:
      if f:
         laser_publisher()
         rospy.spin()
      else:
         pass
   except rospy.ROSInterruptException:
      pass
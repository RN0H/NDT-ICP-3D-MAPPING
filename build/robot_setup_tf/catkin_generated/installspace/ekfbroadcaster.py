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
from nav_msgs.msg import Odometry
from math import sin, cos

class Odom_combined:
    def __init__ (self):
            self.delta = 0.0
            rospy.init_node('ekf_broad')
            self.flag = False
            self.rollicp = 0.0
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            self.sub = rospy.Subscriber("odom", Odometry, self.sample)

    def sample(self,data):
                    self.tf_msg.header.stamp = rospy.Time.now()
                    
                    self.tf_msg.header.frame_id = "base_foot_print"
                    self.tf_msg.child_frame_id = "base_link"
                    self.tf_msg.transform.translation.x = 0.0  #set to relative position
                    self.tf_msg.transform.translation.y = 0.0  #set to relative position
                    self.tf_msg.transform.translation.z = 0.0  #set to relative position
            
                    self.tf_msg.transform.rotation.x = data.pose.pose.orientation.x
                    self.tf_msg.transform.rotation.y = data.pose.pose.orientation.y
                    self.tf_msg.transform.rotation.z = data.pose.pose.orientation.z
                    self.tf_msg.transform.rotation.w = data.pose.pose.orientation.w
                    self.tf_br.sendTransform(self.tf_msg)


if __name__ =="__main__":
   f = 0
   try:
      if f:
        Odom_combined()
        rospy.spin()
      else: pass
   except rospy.ROSInterruptException:
      pass
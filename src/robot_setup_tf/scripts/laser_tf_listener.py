#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#listener


import rospy
import tf2_ros
import geometry_msgs.msg
from math import sin,cos
from myquad.msg import mymsg


class Dynamic_tf_broadcaster:
   
      def __init__ (self):
         self.tf_msg = geometry_msgs.msg.TransformStamped()
         rospy.init_node('icp_tf_listener_node')
         self.Buffer = tf2_ros.Buffer()
         self.listener = tf2_ros.TransformListener(self.Buffer)
         self.rate = rospy.Rate(50)

      def sample(self):
          while not rospy.is_shutdown():
               try:
                    self.Buffer.lookup_transform("icp_frame", "laser", rospy.Time())
               except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                     pass
               self.rate.sleep()
      

if __name__ =="__main__":
   f = 0
   try:
      if f:
         Dynamic_tf_broadcaster().sample()
      else:
         pass
   except rospy.ROSInterruptException:
      pass


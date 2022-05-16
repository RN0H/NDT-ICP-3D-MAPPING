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
         self.tf_pub = rospy.Publisher("BunchOfPoses", mymsg, queue_size = 1)
         self.tf_msgpub = mymsg()
         rospy.init_node('laser_tf_listner')
         self.Buffer = tf2_ros.Buffer()
         self.listener = tf2_ros.TransformListener(self.Buffer)
         self.rate = rospy.Rate(50)

      def sample(self):
          while not rospy.is_shutdown():
               try:
                    msg = self.Buffer.lookup_transform("imu_frame", "laser", rospy.Time())
                    self.tf_msgpub.x = msg.transform.translation.x
                    self.tf_msgpub.y = msg.transform.translation.y
                    self.tf_msgpub.z = msg.transform.translation.z
                   
                    self.tf_msgpub.q0 = msg.transform.rotation.x
                    self.tf_msgpub.q1 = msg.transform.rotation.y
                    self.tf_msgpub.q2 = msg.transform.rotation.z
                    self.tf_msgpub.q3 = msg.transform.rotation.w
                    self.tf_pub.publish(self.tf_msgpub)
               except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                     pass
               self.rate.sleep()
      

if __name__ =="__main__":
   try:
      Dynamic_tf_broadcaster().sample()
   except rospy.ROSInterruptException:
      pass


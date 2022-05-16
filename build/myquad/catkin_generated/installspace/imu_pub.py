#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#HEAD PUBLISHER



import rospy
from myquad.msg import mymsg
import math
from math import sin,cos

class Imu_publisher:
	def __init__ (self):
		rospy.init_node("imu_node")
 		self.pub = rospy.Publisher("imu",mymsg , queue_size =4)
 		self.entropy = 0
 		self.pos = mymsg()
 		self.rate = rospy.Rate(50)

 	def sample(self):
 		 while not rospy.is_shutdown():
 		 	
	 		 	self.pos.x =  0.0
	 		 	self.pos.y = 0.0
	 		 	self.pos.z = 3*sin(math.radians(self.entropy))
	 		 	self.pos.roll = 0.0
			 	self.pos.yaw = 0.0
			 	self.pos.pitch = 0.0
	 		 	self.entropy+=2
	 		 	self.pub.publish(self.pos)
	 		 	self.rate.sleep()

if __name__ == "__main__":
   try:
      Imu_publisher().sample()
   except rospy.ROSInterruptException:
      pass
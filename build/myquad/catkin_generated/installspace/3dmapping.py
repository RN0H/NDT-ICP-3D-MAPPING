#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder

import rospy
from nav_msgs.msg import OccupancyGrid
from sensor_msgs.msg import LaserScan, PointCloud2 as pcl2
from math import exp
from myquad.msg import mymsg

class Maps:
	def __init__ (self):
		rospy.init_node('mymapps')
		self.grid_msg = OccupancyGrid()
		self.grid_msg.header.frame_id = 'occupancy'
		self.grid_msg.header.stamp = rospy.Time.now()
		self.grid_msg.info.resolution = 0.05
		self.grid_msg.info.width =50 #int(self.map_size_x / self.map_resolution)
		self.grid_msg.info.height = 100 #int(self.map_size_y / self.map_resolution)
		
		self.map = [[0.5 for j in range(self.grid_msg.info.)]\
		                  for i in range(self.grid_msg.info.width)]

		self.grid_msg.info.origin.position.x = 0
		self.grid_msg.info.origin.position.y = 0
		self.grid_msg.info.origin.position.z = 0

		self.grid_msg.info.map_load_time = rospy.Time.now()
		self.grid_pub       =   rospy.Publisher("mymap",OccupancyGrid,queue_size = 2)
		self.flag = False
		self.grid_laser_sub =   rospy.Subscriber("scan",LaserScan, self.pointcld)
		self.grid_poses_sub =   rospy.Subscriber("BunchOfPoses",mymsg , self.poses)

	def inverse_sensor_model():
		pass

	def log_odds(self):
		pass



	def pointcld(self,msg):
		self.grid_msg.data = msg.ranges
		self.flag = True


	def poses(self,data):
		if self.flag:
			self.grid_msg.header.stamp = rospy.Time.now()
			self.grid_msg.info.origin.orientation.x  = data.q0
			self.grid_msg.info.origin.orientation.y  = data.q1
			self.grid_msg.info.origin.orientation.z  = data.q2
			self.grid_msg.info.origin.orientation.w  = data.q3
			self.flag = False
			self.grid_pub.publish(self.grid_msg)


if __name__ =="__main__":
   try:
     Maps()
     rospy.spin()
   except rospy.ROSInterruptException:
      pass
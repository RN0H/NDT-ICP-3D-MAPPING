#!/home/emsg/projects/3py/bin/python3

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
import rospy
import ros_numpy
import sensor_msgs
from sensor_msgs.msg import LaserScan, PointCloud2 as pcl2#, PointCloud as pcl
from laser_geometry import LaserProjection


class laser2pcl:
	def __init__(self):
		self.laserproj = LaserProjection()
		self.pub = rospy.Publisher("pcl2", pcl2, queue_size = 1)
		self.sub_laser = rospy.Subscriber("scan", LaserScan, self.convert)
		#self.rate = rospy.Rate(10)
	


	def convert(self, msg):
		geom = self.laserproj.projectLaser(msg)
		self.pub.publish(geom)
		#self.rate.sleep()




if __name__ == "__main__":
	try:
		rospy.init_node("lasert2pcl")
		laser2pcl()
		rospy.spin()
	except rospy.ROSInterruptException:
      	      pass
#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder

import rospy
import geometry_msgs
from geometry_msgs.msg import PoseWithCovarianceStamped as pcs
from tf.transformations import euler_from_quaternion
from myquad.msg import F64


class Ekf:

	def __init__(self):

		self.node = rospy.init_node("EKF_sub")
		self.msg = pcs()
		self.msg_pub = rospy.Publisher("ekf_angle", F64, queue_size = 1)
		rospy.Subscriber("robot_pose_ekf/odom_combined", pcs, self.GetData)


	def GetData(self, data):

		(r, p ,y) = euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])
		#print("2 {},{}".format(y, rospy.Time.now()))


if __name__ == "__main__":
	try:
		pass
		# Ekf()
		# rospy.spin()
	except rospy.ROSInterruptException:
      	      pass



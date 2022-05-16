#!/home/emsg/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 



import rospy
from std_msgs.msg import Header 
import numpy as np
import random
from random import choices
import time

class pubs:
		def __init__(self):
			self.pub = rospy.Publisher("chat", Header, queue_size = 10)	# topic_name = chat
			rospy.init_node('talker', anonymous = True)				# node_name  = talker
			self.msg = Header()
			self.theta = 0.0
			self.rate = rospy.Rate(2)

		def talk(self):
			while not rospy.is_shutdown():
			   self.theta = time.time()
			   self.msg.stamp = rospy.Time.now()
			   # self.msg.name = random.choice([i  for i in "abcdefghijklmnopqrstuvwxyz"]);
			   # self.msg.age, self.msg.weight = random.randint(1,110), random.randint(1,200)*1.01
			   # self.msg.header.stamp = rospy.Time.now()
			   # self.msg.array.append(random.randint(1,10))
			   #rospy.loginfo(self.msg)
			   #self.pub.publish(self.msg);
			   rospy.loginfo(str(time.time() - self.theta))
			   self.rate.sleep()

if __name__ == "__main__":
	try:
		pubs().talk();
	except rospy.ROSInterruptException:
		pass



#!/home/emsg/projects/3py/bin/python


#!usr/bin/env 
#in order to make a script executable use **chmod +x file.py**  

#(a+x,u+x,g+x,o+x; a,u,g,o = all, user, group, others respectively) make sure to have the same umask; else use chmod a+x file.py

import numpy as np
import rospy
from std_msgs.msg import String

def talker():
        pub = rospy.Publisher('chatter', String, queue_size=10)
        rospy.init_node('talker', anonymous=True)
        rate = rospy.Rate(10) # 10hz
        while not rospy.is_shutdown():
             hello_str = "hello world %s" % rospy.get_time()
             rospy.loginfo(hello_str)
             pub.publish(hello_str)
             rate.sleep()
   
if __name__ == '__main__':
         try:
             talker()
         except rospy.ROSInterruptException:
             pass

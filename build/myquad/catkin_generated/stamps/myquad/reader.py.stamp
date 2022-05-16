#!/home/emsg/projects/3py/bin/python



import rospy
from sensor_msgs.msg import LaserScan as LS
from std_msgs.msg import String
import time

def getdata(msg):
    print(msg.ranges[0])
 

def read():
    
    rospy.init_node("reader",anonymous=True)        #node initialization
    rospy.Subscriber("scan", LS, getdata)      #subscribe to topic urg scan
    rospy.spin()

if __name__ == "__main__":
    try:
        read()
    except rospy.ROSInternalException:
         pass

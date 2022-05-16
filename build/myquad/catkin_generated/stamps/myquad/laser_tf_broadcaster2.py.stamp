#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#fake broadcaster

import numpy as np
import rospy
import time
import tf2_ros
import geometry_msgs.msg
from myquad.msg import mymsg
from sensor_msgs.msg import Imu
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from math import sin,cos,degrees

class laser_publisher2:
    def __init__ (self):
            for i in {'ax','ay','az',}:
                setattr(self,i,0)
            rospy.init_node('laser_scan_broadcaster')
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            self.tf_msg.header.frame_id = "imu_frame"
            self.tf_msg.child_frame_id = "scan"
            self.tf_msg.transform.translation.x = 0.0
            self.tf_msg.transform.translation.y = 0.0
            self.tf_msg.transform.translation.z = 0.0
            self.tf_pub = rospy.Publisher("poses",mymsg,queue_size = 2)
            self.data = mymsg()
            self.data.x = self.data.y = self.data.z = 0.0
            self.sub = rospy.Subscriber("/mavros/imu/data", Imu, self.sample)
            
    

    def sample(self,data):
                    
                    (self.data.roll, self.data.pitch, self.data.yaw) = euler_from_quaternion([data.orientation.x, data.orientation.y, data.orientation.z, data.orientation.w])
                    self.tf_msg.header.stamp = rospy.Time.now()

                    self.time_now = time.time()
                    # self.ax = data.linear_acceleration.x + 9.81*sin(pitch)
                    # self.ay = data.linear_acceleration.y - 9.81*cos(pitch)*sin(roll)
                    # self.az = data.linear_acceleration.z - 9.81*cos(roll)*cos(pitch)

                    # if (abs(self.ax) + abs(self.ay) + abs(self.az))>=5:
                    #     self.tf_msg.transform.translation.x=  1e9*self.ax*(time.time()-self.time_now)**2
                    #     self.tf_msg.transform.translation.y=  1e9*self.ay*(time.time()-self.time_now)**2
                    #     self.tf_msg.transform.translation.z=  1e9*self.az*(time.time()-self.time_now)**2

                    self.tf_msg.transform.rotation.x = data.orientation.x #broadcast quat y as rx
                    self.tf_msg.transform.rotation.y = data.orientation.y #broadcast quat x as ry
                    self.tf_msg.transform.rotation.z = data.orientation.z
                    self.tf_msg.transform.rotation.w = data.orientation.w
                    self.tf_pub.publish(self.data)
                    self.tf_br.sendTransform(self.tf_msg)


if __name__ =="__main__":
   try:
      laser_publisher2()
      rospy.spin()
   except rospy.ROSInterruptException:
      pass
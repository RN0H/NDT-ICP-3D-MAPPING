#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#broadcaster

import rospy
import time
import tf2_ros
import geometry_msgs.msg
from sensor_msgs.msg import Imu
from tf.transformations import quaternion_from_euler, euler_from_quaternion

class map_publisher:
    def __init__ (self):
            self.delta = 0.0
            rospy.init_node('map_publisher')
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            self.sub = rospy.Subscriber("/mavros/imu/data", Imu, self.sample)
    

    def sample(self,data):
                    self.tf_msg.header.stamp = rospy.Time.now()
                    self.delta = time.time()
                    self.tf_msg.header.frame_id = "map"
                    self.tf_msg.child_frame_id = "imu_frame"
                    self.tf_msg.transform.translation.x = 0.0
                    self.tf_msg.transform.translation.y = 0.0
                    self.tf_msg.transform.translation.z = 0.0
                    q              =    quaternion_from_euler(0, 0, 0)
                    self.tf_msg.transform.rotation.x = q[0]#data.orientation.x
                    self.tf_msg.transform.rotation.y = q[1]#data.orientation.y
                    self.tf_msg.transform.rotation.z = q[2]#data.orientation.z
                    self.tf_msg.transform.rotation.w = q[3]#data.orientation.w
                    self.tf_br.sendTransform(self.tf_msg)

                   

if __name__ =="__main__":
   try:
      pass
      #map_publisher()
      #rospy.spin()
   except rospy.ROSInterruptException:
      pass
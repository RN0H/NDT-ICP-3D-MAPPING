#!/home/emsg/projects/3py/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder
#broadcaster

from pathlib import Path
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point

def groundtruth(path):
		while not rospy.is_shutdown():
			d = Path(r"{}".format(path))
			with open(d,'r') as d:
				d = d.readlines()
				d = ''.join(d).split()
				x = list(map(float, d[0::2]))
				y = list(map(float, d[1::2]))
				z = len(x)*[0]
			marker = Marker()
			marker.header.frame_id = "laser"
			marker.type = marker.LINE_STRIP
			marker.action = marker.ADD


			# marker scale
			marker.scale.x = 0.03
			marker.scale.y = 0.03
			marker.scale.z = 0.03

			# marker color
			marker.color.a = 1.0
			marker.color.r = 1.0
			marker.color.g = 0.0
			marker.color.b = 0.0

			# marker orientaiton
			marker.pose.orientation.x = 0.0
			marker.pose.orientation.y = 0.0
			marker.pose.orientation.z = 0.0
			marker.pose.orientation.w = 1.0

			# marker position
			marker.pose.position.x = 0.0
			marker.pose.position.y = 0.0
			marker.pose.position.z = 0.0

			# marker line points
			marker.points = []

			for _x,_y,_z in zip(x,y,z):
				xyz = Point()
				xyz.x = _x
				xyz.y = _y
				xyz.z = _z
				marker.points.append(xyz)
			pub.publish(marker)

			rospy.sleep(0.5)




if __name__ == "__main__":
   try:
        path = "/home/emsg/ws_2/src/myquad/txts/gnd.txt"
        rospy.init_node("groundtruth")
        pub = rospy.Publisher("ground_line",Marker, queue_size=1)
        groundtruth(path)
   except rospy.ROSInterruptException:
      pass
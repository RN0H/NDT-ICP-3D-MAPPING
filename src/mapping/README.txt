
#edits in CmakeLists.txt

find_package(catkin REQUIRED COMPONENTS
  rospy
  roscpp
  std_msgs
  message_generation	<=
)



add_message_files(
   FILES
   mymsg.msg		<=
 )


generate_messages(		#uncomment
   DEPENDENCIES
   std_msgs		
 )

#edits in xml

<build_depend>message_generation</build_depend>	 #add these
<exec_depend>message_runtime</exec_depend>



 

roslaunch mavros px4.launch
rosrun mavros mavsys rate --all 35 
rosrun urg_node urg_node _ip_address:=192.168.0.10
roslaunch myquad laser.launch

<node type="rviz" name="rviz" pkg="rviz" args="-d myquad/rviz/config_file.rviz" />



#------------MAVROS----------

sudo apt-get install ros-melodic-mavros ros-melodic-mavros-extras

sudo chmod 666 /dev/ttyUSB0

Then run

ls -l /dev/ttyUSB0

The result is

crw-rw-rw- 1 root dialout 188, 0 Nov  2 21:32 /dev/ttyUSB0

sudo usermod -a -G dialout $USER

roslaunch mavros px4.launch
rosrun mavros mavsys rate --all 50 
#--------------------------

#-----------Sublime Venv--------

build for venv

{
    "cmd": ["/home/emsg/projects/3py/bin/python3", "$file"],
    "file_regex": "^[ ]File \"(...?)\", line ([0-9]*)",
    "selector": "source.python"
}

#----------------------------

#-------------ROUTE--------------
sudo route add -host 192.168.0.20 dev enp2s0    # PC IP
sudo route add -host 192.168.0.7 dev enp2s0     # remote device IP 

sudo route add -host 192.168.0.30 dev enp3s0    # PC IP
sudo route add -host 192.168.0.10 dev enp3s0    # remote device IP 

RUN ./$FILE.sh

#--------------------------------
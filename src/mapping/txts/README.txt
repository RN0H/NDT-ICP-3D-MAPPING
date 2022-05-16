THIS IS THE INSTALLATION PROCESS FOR ROS

1) In order to accept pkgs from ROS, setup sources.list

2) set the GPG (GNU Privacy Guard) key for ROS 

3) sudo apt update
   sudo apt install ros-$(version)-desktop-full

4) gedit .bashrc 
   copy source /opt/ros/$(version)/setup.bash
   so that the source for ros can be accessed everytime when a terminal is opened!.

5) Install Python dependencies and initialize rosdep and update it!.

CREATING ROS WORKSPACE

1)Open Terminal (Ctrl + Alt +  t)

2) mkdir ~/catkin_ws/src
   cd catkin_ws
   catkin_make 	 	(Compiles and builds necessary files)
   
   catkin_make---- Build
		|- Devel
		|- src

   cd src
   catkin_create_pkg $(File_name) $(dependencies)   ##dependencies such as roscpp,rospy,std_msgs
  
3)cd $(file)
  mkdir scripts ( for python scripts)

4) cd scripts/touch file.py

5) #add a shebang to the file eg:- #!~/usr/bin/python env
    
   when this file is made executable, shebang will allocate the interpreter in what environment

6) chmod +x file.py ( giving all the executable permission)

7) cd ~
   roscore

8) In a new terminal, you can rosrun catkin_ws (or any other name for ur ws) file.py

9) rostopic list    # will give all the active topics
8) rostopic echo /topic_name # will read the data engendered
10) rosnode list # will give qall the live nodes
11) rosnode kill -a # will kill all

#publisher will produce a topic and data, while subscriber wil subscribe to that topic name and get that data

##ROS is used for acquiring data from one node and other, same as multithreading

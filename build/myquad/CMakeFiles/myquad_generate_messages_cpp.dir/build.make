# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/emsg/ws_2/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/emsg/ws_2/build

# Utility rule file for myquad_generate_messages_cpp.

# Include the progress variables for this target.
include myquad/CMakeFiles/myquad_generate_messages_cpp.dir/progress.make

myquad/CMakeFiles/myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/mymsg.h
myquad/CMakeFiles/myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/Ins.h
myquad/CMakeFiles/myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/F64.h
myquad/CMakeFiles/myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/mysrv.h


/home/emsg/ws_2/devel/include/myquad/mymsg.h: /opt/ros/melodic/lib/gencpp/gen_cpp.py
/home/emsg/ws_2/devel/include/myquad/mymsg.h: /home/emsg/ws_2/src/myquad/msg/mymsg.msg
/home/emsg/ws_2/devel/include/myquad/mymsg.h: /opt/ros/melodic/share/std_msgs/msg/Header.msg
/home/emsg/ws_2/devel/include/myquad/mymsg.h: /opt/ros/melodic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/emsg/ws_2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from myquad/mymsg.msg"
	cd /home/emsg/ws_2/src/myquad && /home/emsg/ws_2/build/catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/emsg/ws_2/src/myquad/msg/mymsg.msg -Imyquad:/home/emsg/ws_2/src/myquad/msg -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -p myquad -o /home/emsg/ws_2/devel/include/myquad -e /opt/ros/melodic/share/gencpp/cmake/..

/home/emsg/ws_2/devel/include/myquad/Ins.h: /opt/ros/melodic/lib/gencpp/gen_cpp.py
/home/emsg/ws_2/devel/include/myquad/Ins.h: /home/emsg/ws_2/src/myquad/msg/Ins.msg
/home/emsg/ws_2/devel/include/myquad/Ins.h: /opt/ros/melodic/share/std_msgs/msg/Header.msg
/home/emsg/ws_2/devel/include/myquad/Ins.h: /opt/ros/melodic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/emsg/ws_2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating C++ code from myquad/Ins.msg"
	cd /home/emsg/ws_2/src/myquad && /home/emsg/ws_2/build/catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/emsg/ws_2/src/myquad/msg/Ins.msg -Imyquad:/home/emsg/ws_2/src/myquad/msg -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -p myquad -o /home/emsg/ws_2/devel/include/myquad -e /opt/ros/melodic/share/gencpp/cmake/..

/home/emsg/ws_2/devel/include/myquad/F64.h: /opt/ros/melodic/lib/gencpp/gen_cpp.py
/home/emsg/ws_2/devel/include/myquad/F64.h: /home/emsg/ws_2/src/myquad/msg/F64.msg
/home/emsg/ws_2/devel/include/myquad/F64.h: /opt/ros/melodic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/emsg/ws_2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating C++ code from myquad/F64.msg"
	cd /home/emsg/ws_2/src/myquad && /home/emsg/ws_2/build/catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/emsg/ws_2/src/myquad/msg/F64.msg -Imyquad:/home/emsg/ws_2/src/myquad/msg -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -p myquad -o /home/emsg/ws_2/devel/include/myquad -e /opt/ros/melodic/share/gencpp/cmake/..

/home/emsg/ws_2/devel/include/myquad/mysrv.h: /opt/ros/melodic/lib/gencpp/gen_cpp.py
/home/emsg/ws_2/devel/include/myquad/mysrv.h: /home/emsg/ws_2/src/myquad/srv/mysrv.srv
/home/emsg/ws_2/devel/include/myquad/mysrv.h: /opt/ros/melodic/share/gencpp/msg.h.template
/home/emsg/ws_2/devel/include/myquad/mysrv.h: /opt/ros/melodic/share/gencpp/srv.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/emsg/ws_2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating C++ code from myquad/mysrv.srv"
	cd /home/emsg/ws_2/src/myquad && /home/emsg/ws_2/build/catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/emsg/ws_2/src/myquad/srv/mysrv.srv -Imyquad:/home/emsg/ws_2/src/myquad/msg -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -p myquad -o /home/emsg/ws_2/devel/include/myquad -e /opt/ros/melodic/share/gencpp/cmake/..

myquad_generate_messages_cpp: myquad/CMakeFiles/myquad_generate_messages_cpp
myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/mymsg.h
myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/Ins.h
myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/F64.h
myquad_generate_messages_cpp: /home/emsg/ws_2/devel/include/myquad/mysrv.h
myquad_generate_messages_cpp: myquad/CMakeFiles/myquad_generate_messages_cpp.dir/build.make

.PHONY : myquad_generate_messages_cpp

# Rule to build all files generated by this target.
myquad/CMakeFiles/myquad_generate_messages_cpp.dir/build: myquad_generate_messages_cpp

.PHONY : myquad/CMakeFiles/myquad_generate_messages_cpp.dir/build

myquad/CMakeFiles/myquad_generate_messages_cpp.dir/clean:
	cd /home/emsg/ws_2/build/myquad && $(CMAKE_COMMAND) -P CMakeFiles/myquad_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : myquad/CMakeFiles/myquad_generate_messages_cpp.dir/clean

myquad/CMakeFiles/myquad_generate_messages_cpp.dir/depend:
	cd /home/emsg/ws_2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/emsg/ws_2/src /home/emsg/ws_2/src/myquad /home/emsg/ws_2/build /home/emsg/ws_2/build/myquad /home/emsg/ws_2/build/myquad/CMakeFiles/myquad_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : myquad/CMakeFiles/myquad_generate_messages_cpp.dir/depend


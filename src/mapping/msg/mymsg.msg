#class $(file_name):
#          type file_name.attr1 = var_name1
#		   type file_name.attr2 = var_name2


#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
#echo "field type variable" > msg/$(FILE.msg)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg
#FIELD_TYPE VARIABLE Format

Header header		#seq, time_stamp, id
float32 x
float32 y
float32 z

float32 roll
float32 yaw
float32 pitch

float32 q0
float32 q1
float32 q2
float32 q3


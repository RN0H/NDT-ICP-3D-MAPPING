;; Auto-generated. Do not edit!


(when (boundp 'myquad::mymsg)
  (if (not (find-package "MYQUAD"))
    (make-package "MYQUAD"))
  (shadow 'mymsg (find-package "MYQUAD")))
(unless (find-package "MYQUAD::MYMSG")
  (make-package "MYQUAD::MYMSG"))

(in-package "ROS")
;;//! \htmlinclude mymsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass myquad::mymsg
  :super ros::object
  :slots (_header _x _y _z _roll _yaw _pitch _q0 _q1 _q2 _q3 ))

(defmethod myquad::mymsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    ((:q0 __q0) 0.0)
    ((:q1 __q1) 0.0)
    ((:q2 __q2) 0.0)
    ((:q3 __q3) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
   (setq _q0 (float __q0))
   (setq _q1 (float __q1))
   (setq _q2 (float __q2))
   (setq _q3 (float __q3))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:q0
   (&optional __q0)
   (if __q0 (setq _q0 __q0)) _q0)
  (:q1
   (&optional __q1)
   (if __q1 (setq _q1 __q1)) _q1)
  (:q2
   (&optional __q2)
   (if __q2 (setq _q2 __q2)) _q2)
  (:q3
   (&optional __q3)
   (if __q3 (setq _q3 __q3)) _q3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _roll
    4
    ;; float32 _yaw
    4
    ;; float32 _pitch
    4
    ;; float32 _q0
    4
    ;; float32 _q1
    4
    ;; float32 _q2
    4
    ;; float32 _q3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q0
       (sys::poke _q0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q1
       (sys::poke _q1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q2
       (sys::poke _q2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q3
       (sys::poke _q3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q0
     (setq _q0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q1
     (setq _q1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q2
     (setq _q2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q3
     (setq _q3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get myquad::mymsg :md5sum-) "28d802b043573036b2806f18ff6a49a4")
(setf (get myquad::mymsg :datatype-) "myquad/mymsg")
(setf (get myquad::mymsg :definition-)
      "#class $(file_name):
#          type file_name.attr1 = var_name1
#		   type file_name.attr2 = var_name2


#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing 

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


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :myquad/mymsg "28d802b043573036b2806f18ff6a49a4")



; Auto-generated. Do not edit!


(cl:in-package myquad-msg)


;//! \htmlinclude mymsg.msg.html

(cl:defclass <mymsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (q0
    :reader q0
    :initarg :q0
    :type cl:float
    :initform 0.0)
   (q1
    :reader q1
    :initarg :q1
    :type cl:float
    :initform 0.0)
   (q2
    :reader q2
    :initarg :q2
    :type cl:float
    :initform 0.0)
   (q3
    :reader q3
    :initarg :q3
    :type cl:float
    :initform 0.0))
)

(cl:defclass mymsg (<mymsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mymsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mymsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myquad-msg:<mymsg> is deprecated: use myquad-msg:mymsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:header-val is deprecated.  Use myquad-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:x-val is deprecated.  Use myquad-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:y-val is deprecated.  Use myquad-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:z-val is deprecated.  Use myquad-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:roll-val is deprecated.  Use myquad-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:yaw-val is deprecated.  Use myquad-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:pitch-val is deprecated.  Use myquad-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'q0-val :lambda-list '(m))
(cl:defmethod q0-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:q0-val is deprecated.  Use myquad-msg:q0 instead.")
  (q0 m))

(cl:ensure-generic-function 'q1-val :lambda-list '(m))
(cl:defmethod q1-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:q1-val is deprecated.  Use myquad-msg:q1 instead.")
  (q1 m))

(cl:ensure-generic-function 'q2-val :lambda-list '(m))
(cl:defmethod q2-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:q2-val is deprecated.  Use myquad-msg:q2 instead.")
  (q2 m))

(cl:ensure-generic-function 'q3-val :lambda-list '(m))
(cl:defmethod q3-val ((m <mymsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:q3-val is deprecated.  Use myquad-msg:q3 instead.")
  (q3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mymsg>) ostream)
  "Serializes a message object of type '<mymsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'q3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mymsg>) istream)
  "Deserializes a message object of type '<mymsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'q3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mymsg>)))
  "Returns string type for a message object of type '<mymsg>"
  "myquad/mymsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mymsg)))
  "Returns string type for a message object of type 'mymsg"
  "myquad/mymsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mymsg>)))
  "Returns md5sum for a message object of type '<mymsg>"
  "28d802b043573036b2806f18ff6a49a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mymsg)))
  "Returns md5sum for a message object of type 'mymsg"
  "28d802b043573036b2806f18ff6a49a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mymsg>)))
  "Returns full string definition for message of type '<mymsg>"
  (cl:format cl:nil "#class $(file_name):~%#          type file_name.attr1 = var_name1~%#		   type file_name.attr2 = var_name2~%~%~%#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading~%#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw~%#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing ~%~%#AFTER EDITING, cd ~~/catkin_ws; catkin_make #compile msg~%#FIELD_TYPE VARIABLE Format~%~%Header header		#seq, time_stamp, id~%float32 x~%float32 y~%float32 z~%~%float32 roll~%float32 yaw~%float32 pitch~%~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mymsg)))
  "Returns full string definition for message of type 'mymsg"
  (cl:format cl:nil "#class $(file_name):~%#          type file_name.attr1 = var_name1~%#		   type file_name.attr2 = var_name2~%~%~%#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading~%#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw~%#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing ~%~%#AFTER EDITING, cd ~~/catkin_ws; catkin_make #compile msg~%#FIELD_TYPE VARIABLE Format~%~%Header header		#seq, time_stamp, id~%float32 x~%float32 y~%float32 z~%~%float32 roll~%float32 yaw~%float32 pitch~%~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mymsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mymsg>))
  "Converts a ROS message object to a list"
  (cl:list 'mymsg
    (cl:cons ':header (header msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':q0 (q0 msg))
    (cl:cons ':q1 (q1 msg))
    (cl:cons ':q2 (q2 msg))
    (cl:cons ':q3 (q3 msg))
))

; Auto-generated. Do not edit!


(cl:in-package myquad-msg)


;//! \htmlinclude Ins.msg.html

(cl:defclass <Ins> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (arr
    :reader arr
    :initarg :arr
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Ins (<Ins>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ins>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ins)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myquad-msg:<Ins> is deprecated: use myquad-msg:Ins instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:header-val is deprecated.  Use myquad-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'arr-val :lambda-list '(m))
(cl:defmethod arr-val ((m <Ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:arr-val is deprecated.  Use myquad-msg:arr instead.")
  (arr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ins>) ostream)
  "Serializes a message object of type '<Ins>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'arr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'arr))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ins>) istream)
  "Deserializes a message object of type '<Ins>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'arr) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'arr)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ins>)))
  "Returns string type for a message object of type '<Ins>"
  "myquad/Ins")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ins)))
  "Returns string type for a message object of type 'Ins"
  "myquad/Ins")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ins>)))
  "Returns md5sum for a message object of type '<Ins>"
  "51824bbaac648d885c19de11971ce20b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ins)))
  "Returns md5sum for a message object of type 'Ins"
  "51824bbaac648d885c19de11971ce20b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ins>)))
  "Returns full string definition for message of type '<Ins>"
  (cl:format cl:nil "Header header~%float32[] arr~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ins)))
  "Returns full string definition for message of type 'Ins"
  (cl:format cl:nil "Header header~%float32[] arr~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ins>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'arr) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ins>))
  "Converts a ROS message object to a list"
  (cl:list 'Ins
    (cl:cons ':header (header msg))
    (cl:cons ':arr (arr msg))
))

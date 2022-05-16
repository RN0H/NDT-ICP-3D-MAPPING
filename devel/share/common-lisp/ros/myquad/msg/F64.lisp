; Auto-generated. Do not edit!


(cl:in-package myquad-msg)


;//! \htmlinclude F64.msg.html

(cl:defclass <F64> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass F64 (<F64>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <F64>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'F64)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myquad-msg:<F64> is deprecated: use myquad-msg:F64 instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <F64>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myquad-msg:angle-val is deprecated.  Use myquad-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <F64>) ostream)
  "Serializes a message object of type '<F64>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <F64>) istream)
  "Deserializes a message object of type '<F64>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<F64>)))
  "Returns string type for a message object of type '<F64>"
  "myquad/F64")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'F64)))
  "Returns string type for a message object of type 'F64"
  "myquad/F64")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<F64>)))
  "Returns md5sum for a message object of type '<F64>"
  "4edb55038e2b888976a0c0c56935341c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'F64)))
  "Returns md5sum for a message object of type 'F64"
  "4edb55038e2b888976a0c0c56935341c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<F64>)))
  "Returns full string definition for message of type '<F64>"
  (cl:format cl:nil "float64 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'F64)))
  "Returns full string definition for message of type 'F64"
  (cl:format cl:nil "float64 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <F64>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <F64>))
  "Converts a ROS message object to a list"
  (cl:list 'F64
    (cl:cons ':angle (angle msg))
))

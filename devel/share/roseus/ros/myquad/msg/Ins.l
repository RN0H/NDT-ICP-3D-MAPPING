;; Auto-generated. Do not edit!


(when (boundp 'myquad::Ins)
  (if (not (find-package "MYQUAD"))
    (make-package "MYQUAD"))
  (shadow 'Ins (find-package "MYQUAD")))
(unless (find-package "MYQUAD::INS")
  (make-package "MYQUAD::INS"))

(in-package "ROS")
;;//! \htmlinclude Ins.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass myquad::Ins
  :super ros::object
  :slots (_header _arr ))

(defmethod myquad::Ins
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:arr __arr) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _arr __arr)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:arr
   (&optional __arr)
   (if __arr (setq _arr __arr)) _arr)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _arr
    (* 4    (length _arr)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _arr
     (write-long (length _arr) s)
     (dotimes (i (length _arr))
       (sys::poke (elt _arr i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _arr
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _arr (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _arr i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get myquad::Ins :md5sum-) "51824bbaac648d885c19de11971ce20b")
(setf (get myquad::Ins :datatype-) "myquad/Ins")
(setf (get myquad::Ins :definition-)
      "Header header
float32[] arr

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



(provide :myquad/Ins "51824bbaac648d885c19de11971ce20b")



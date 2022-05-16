;; Auto-generated. Do not edit!


(when (boundp 'myquad::F64)
  (if (not (find-package "MYQUAD"))
    (make-package "MYQUAD"))
  (shadow 'F64 (find-package "MYQUAD")))
(unless (find-package "MYQUAD::F64")
  (make-package "MYQUAD::F64"))

(in-package "ROS")
;;//! \htmlinclude F64.msg.html


(defclass myquad::F64
  :super ros::object
  :slots (_angle ))

(defmethod myquad::F64
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get myquad::F64 :md5sum-) "4edb55038e2b888976a0c0c56935341c")
(setf (get myquad::F64 :datatype-) "myquad/F64")
(setf (get myquad::F64 :definition-)
      "float64 angle
")



(provide :myquad/F64 "4edb55038e2b888976a0c0c56935341c")



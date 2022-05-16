;; Auto-generated. Do not edit!


(when (boundp 'myquad::mysrv)
  (if (not (find-package "MYQUAD"))
    (make-package "MYQUAD"))
  (shadow 'mysrv (find-package "MYQUAD")))
(unless (find-package "MYQUAD::MYSRV")
  (make-package "MYQUAD::MYSRV"))
(unless (find-package "MYQUAD::MYSRVREQUEST")
  (make-package "MYQUAD::MYSRVREQUEST"))
(unless (find-package "MYQUAD::MYSRVRESPONSE")
  (make-package "MYQUAD::MYSRVRESPONSE"))

(in-package "ROS")





(defclass myquad::mysrvRequest
  :super ros::object
  :slots (_name ))

(defmethod myquad::mysrvRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass myquad::mysrvResponse
  :super ros::object
  :slots (_age _weight ))

(defmethod myquad::mysrvResponse
  (:init
   (&key
    ((:age __age) 0)
    ((:weight __weight) 0.0)
    )
   (send-super :init)
   (setq _age (round __age))
   (setq _weight (float __weight))
   self)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; int64 _age
    8
    ;; float32 _weight
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _age
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _age (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _age) (= (length (_age . bv)) 2)) ;; bignum
              (write-long (ash (elt (_age . bv) 0) 0) s)
              (write-long (ash (elt (_age . bv) 1) -1) s))
             ((and (class _age) (= (length (_age . bv)) 1)) ;; big1
              (write-long (elt (_age . bv) 0) s)
              (write-long (if (>= _age 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _age s)(write-long (if (>= _age 0) 0 #xffffffff) s)))
     ;; float32 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _age
#+(or :alpha :irix6 :x86_64)
      (setf _age (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _age (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _weight
     (setq _weight (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass myquad::mysrv
  :super ros::object
  :slots ())

(setf (get myquad::mysrv :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get myquad::mysrv :datatype-) "myquad/mysrv")
(setf (get myquad::mysrv :request) myquad::mysrvRequest)
(setf (get myquad::mysrv :response) myquad::mysrvResponse)

(defmethod myquad::mysrvRequest
  (:response () (instance myquad::mysrvResponse :init)))

(setf (get myquad::mysrvRequest :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get myquad::mysrvRequest :datatype-) "myquad/mysrvRequest")
(setf (get myquad::mysrvRequest :definition-)
      "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading
#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw
#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile srv

#FIELD_TYPE VARIABLE Format

#REQUEST
#-------------
#RESPONSE


string name
---
int64 	age
float32 weight
")

(setf (get myquad::mysrvResponse :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get myquad::mysrvResponse :datatype-) "myquad/mysrvResponse")
(setf (get myquad::mysrvResponse :definition-)
      "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading
#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw
#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile srv

#FIELD_TYPE VARIABLE Format

#REQUEST
#-------------
#RESPONSE


string name
---
int64 	age
float32 weight
")



(provide :myquad/mysrv "043c37660891c202c07ae9cb667631f0")



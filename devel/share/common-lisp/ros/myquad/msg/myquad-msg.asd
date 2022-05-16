
(cl:in-package :asdf)

(defsystem "myquad-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "F64" :depends-on ("_package_F64"))
    (:file "_package_F64" :depends-on ("_package"))
    (:file "Ins" :depends-on ("_package_Ins"))
    (:file "_package_Ins" :depends-on ("_package"))
    (:file "mymsg" :depends-on ("_package_mymsg"))
    (:file "_package_mymsg" :depends-on ("_package"))
  ))
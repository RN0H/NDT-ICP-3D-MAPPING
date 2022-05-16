// Generated by gencpp from file myquad/mymsg.msg
// DO NOT EDIT!


#ifndef MYQUAD_MESSAGE_MYMSG_H
#define MYQUAD_MESSAGE_MYMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace myquad
{
template <class ContainerAllocator>
struct mymsg_
{
  typedef mymsg_<ContainerAllocator> Type;

  mymsg_()
    : header()
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , roll(0.0)
    , yaw(0.0)
    , pitch(0.0)
    , q0(0.0)
    , q1(0.0)
    , q2(0.0)
    , q3(0.0)  {
    }
  mymsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , roll(0.0)
    , yaw(0.0)
    , pitch(0.0)
    , q0(0.0)
    , q1(0.0)
    , q2(0.0)
    , q3(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;

   typedef float _roll_type;
  _roll_type roll;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef float _q0_type;
  _q0_type q0;

   typedef float _q1_type;
  _q1_type q1;

   typedef float _q2_type;
  _q2_type q2;

   typedef float _q3_type;
  _q3_type q3;





  typedef boost::shared_ptr< ::myquad::mymsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::myquad::mymsg_<ContainerAllocator> const> ConstPtr;

}; // struct mymsg_

typedef ::myquad::mymsg_<std::allocator<void> > mymsg;

typedef boost::shared_ptr< ::myquad::mymsg > mymsgPtr;
typedef boost::shared_ptr< ::myquad::mymsg const> mymsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::myquad::mymsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::myquad::mymsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::myquad::mymsg_<ContainerAllocator1> & lhs, const ::myquad::mymsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.roll == rhs.roll &&
    lhs.yaw == rhs.yaw &&
    lhs.pitch == rhs.pitch &&
    lhs.q0 == rhs.q0 &&
    lhs.q1 == rhs.q1 &&
    lhs.q2 == rhs.q2 &&
    lhs.q3 == rhs.q3;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::myquad::mymsg_<ContainerAllocator1> & lhs, const ::myquad::mymsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace myquad

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::myquad::mymsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::myquad::mymsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::myquad::mymsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::myquad::mymsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::myquad::mymsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::myquad::mymsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::myquad::mymsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "28d802b043573036b2806f18ff6a49a4";
  }

  static const char* value(const ::myquad::mymsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x28d802b043573036ULL;
  static const uint64_t static_value2 = 0xb2806f18ff6a49a4ULL;
};

template<class ContainerAllocator>
struct DataType< ::myquad::mymsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "myquad/mymsg";
  }

  static const char* value(const ::myquad::mymsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::myquad::mymsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#class $(file_name):\n"
"#          type file_name.attr1 = var_name1\n"
"#		   type file_name.attr2 = var_name2\n"
"\n"
"\n"
"#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading\n"
"#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw\n"
"#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing \n"
"\n"
"#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg\n"
"#FIELD_TYPE VARIABLE Format\n"
"\n"
"Header header		#seq, time_stamp, id\n"
"float32 x\n"
"float32 y\n"
"float32 z\n"
"\n"
"float32 roll\n"
"float32 yaw\n"
"float32 pitch\n"
"\n"
"float32 q0\n"
"float32 q1\n"
"float32 q2\n"
"float32 q3\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::myquad::mymsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::myquad::mymsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.roll);
      stream.next(m.yaw);
      stream.next(m.pitch);
      stream.next(m.q0);
      stream.next(m.q1);
      stream.next(m.q2);
      stream.next(m.q3);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct mymsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::myquad::mymsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::myquad::mymsg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "roll: ";
    Printer<float>::stream(s, indent + "  ", v.roll);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "q0: ";
    Printer<float>::stream(s, indent + "  ", v.q0);
    s << indent << "q1: ";
    Printer<float>::stream(s, indent + "  ", v.q1);
    s << indent << "q2: ";
    Printer<float>::stream(s, indent + "  ", v.q2);
    s << indent << "q3: ";
    Printer<float>::stream(s, indent + "  ", v.q3);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MYQUAD_MESSAGE_MYMSG_H
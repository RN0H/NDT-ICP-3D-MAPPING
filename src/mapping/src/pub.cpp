#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/ndt.h>

int main(int argc ,char** argv)

{
     //Initialize and start the node
     ros::init(argc, argv, "pub");
     ros::NodeHandle nh;
     
     ros::Publisher pub = nh.advertise<std_msgs::Int32>("cpp_pub_topic", 1000);
     //Define and create some messages
     std_msgs::Int32 abc;
     abc.data = 32;
     
     ros::Rate(10);
     
     while(ros::ok)
     {
           pub.publish(abc);
           ros::spinOnce();               
     }

     return 0;
 }
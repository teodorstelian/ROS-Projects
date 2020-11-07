#include &lt;sensor_msgs/PointCloud2.h&gt;
#include &lt;pcl_conversions/pcl_conversions.h&gt;

sensor_msgs::PointCloud2 object_msg;
pcl::PointCloud::Ptr object_cloud;
object_cloud.reset(new pcl::PointCloud);
pcl::toROSMsg(*object_cloud.get(),object_msg );

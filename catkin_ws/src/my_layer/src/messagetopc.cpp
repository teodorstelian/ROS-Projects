pcl::PointCloud::Ptr received_cloud_ptr;
received_cloud_ptr.reset(new pcl::PointCloud);
sensor_msgs::PointCloud2ConstPtr pointcloud_msg;

pcl::fromROSMsg(*pointcloud_msg.get(), *received_cloud_ptr.get());

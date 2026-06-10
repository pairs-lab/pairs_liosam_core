#!/bin/bash

PACKAGE_PATH=$(rospack find pairs_liosam_core)

cp $PACKAGE_PATH/rviz/default.rviz /tmp/default.rviz
cp $PACKAGE_PATH/rviz/rosbag.rviz /tmp/rosbag.rviz

sed -i "s/uav[0-9]/$UAV_NAME/g" /tmp/default.rviz
sed -i "s/uav[0-9]/$UAV_NAME/g" /tmp/rosbag.rviz

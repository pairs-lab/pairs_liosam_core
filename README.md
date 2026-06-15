# pairs_liosam_core

**PAIRS LIO-SAM core** metapackage. Runs the PAIRS UAV system with LIO-SAM LiDAR-inertial SLAM.

The SLAM backend `liosam` (TixiaoShan LIO-SAM, CTU fork; depends on GTSAM, from
apt as `ros-noetic-gtsam`) is kept under its upstream name (third-party) and
provided as a separate `.deb` package — it is NOT renamed to `pairs_*`.

Component repositories are managed via `ros_packages/.gitman.yml` (`gitman install`).

## Branches
- `ros1` — ROS 1 Noetic (catkin). *(upstream is ROS 1 only)*

## License
BSD 3-Clause. Derived from the CTU-MRS `pairs_liosam_core`; original copyright
retained in [LICENSE](LICENSE).
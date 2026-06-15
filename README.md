# pairs_liosam_core

Metapackage that runs the PAIRS UAV system with LIO-SAM LiDAR-inertial SLAM as its localization source. It bundles the SLAM backend with a PAIRS estimator plugin and ships the launch files, tmux sessions, RViz layouts, and Ouster point-cloud filtration configs needed to fly with LIO-SAM in both simulation and on real hardware.

The SLAM backend `liosam` (TixiaoShan LIO-SAM, CTU fork; depends on GTSAM from apt as `ros-noetic-gtsam`) is kept under its upstream third-party name and provided as a separate `.deb` — it is NOT renamed to `pairs_*`. Component repositories are pulled via `ros_packages/.gitman.yml` (`gitman install`).

## Contents

Bundled packages (`ros_packages/.gitman.yml`):

- **`liosam`** — the LIO-SAM LiDAR-inertial SLAM backend (third-party, upstream-named).
- **`pairs_liosam_estimator_plugin`** — the PAIRS state-estimator plugin that feeds the LIO-SAM solution into the estimation/control stack.

Provided in this package:

- **Launch files** — `slam_pipeline.launch` (full pipeline: Ouster driver, point-cloud filtration, and the LIO-SAM nodelet), `uav_os_filtration.launch` (Ouster cloud processing), and `rviz.launch`.
- **tmux sessions** — `simulation/` (Gazebo end-to-end run, spawn through takeoff and goto) and `realworld_rosbag/` (replay a recorded bag through the SLAM pipeline).
- **Configs and visualization** — per-Ouster point-cloud filtration YAMLs, RViz layouts, and PlotJuggler layouts.

## Branches

- `ros1` — ROS 1 Noetic (catkin). *(upstream is ROS 1 only)*

## Install (ROS 1 Noetic)

```bash
sudo apt install ros-noetic-pairs-liosam-core
```

## Usage

Simulation (Gazebo, full PAIRS + LIO-SAM run):

```bash
cd ros_packages/pairs_liosam_core/tmux/simulation
./simulation.sh
```

Rosbag replay:

```bash
cd ros_packages/pairs_liosam_core/tmux/realworld_rosbag
./start.sh
```

Or launch just the SLAM pipeline directly:

```bash
roslaunch pairs_liosam_core slam_pipeline.launch OUSTER_TYPE:=OS0-32 IMU_TYPE:=ouster
```

Each tmux session is stopped with its own `./kill.sh`.

## License
BSD 3-Clause. Derived from the CTU-MRS `pairs_liosam_core`; original copyright
retained in [LICENSE](LICENSE).

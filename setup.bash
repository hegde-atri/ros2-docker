#!/usr/bin/env bash

ros_dev() {
  ROS_PROJECT_PATH=$(pwd)

  cd $ROS2_DOCKER_DIR && docker compose up -d --build
}

ros_shell() {
    docker exec -it ros2 /bin/zsh
}

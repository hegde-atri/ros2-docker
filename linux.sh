#!/usr/bin/env bash

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    cd $ROS2_DOCKER_ENV && docker compose up -d --build && cd $ROS_PROJECT_PATH
    xhost +local:root
}

ros_stop() {
    cd $ROS2_DOCKER_ENV && docker compose down && cd $ROS_PROJECT_PATH
}

ros_shell() {
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/bash
}

#!/usr/bin/env bash

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    cd $ROS2_DOCKER_ENV && docker compose up -d --build
}

ros_stop() {
    cd $ROS2_DOCKER_ENV && docker compose down
}

ros_shell() {
    docker exec -it ros2 /bin/bash
}

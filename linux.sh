#!/usr/bin/env bash

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    pushd $ROS2_DOCKER_ENV && docker compose -f docker-compose.linux.yml up -d --build && popd
}

ros_stop() {
    pushd $ROS2_DOCKER_ENV && docker compose down && popd
}

ros_shell() {
    docker exec -it ros2 /bin/zsh
}

#!/usr/bin/env bash

ros_dev() {
  if (( $# != 2 )); then
    echo "Usage: ros_dev <container_name1> <project_path1>"
    return 1
  fi

  ROS_DEV_CONTAINER_NAME=$1
  ROS_PROJECT_PATH=$2

  cd $ROS2_DOCKER_DIR && docker compose up -d --build
}

ros_shell() {
    if (( $# != 1 )); then
        echo "Usuage: ros_shell <container_name>"
        return 1
    fi

    docker exec -it $1 /bin/zsh
}

#!/usr/bin/env bash

ros_dev() {
  if (( $# % 2 != 0 )); then
    echo "Usage: ros_dev <container_name1> <project_path1> [<container_name2> <project_path2> ...]"
    return 1
  fi

  while (( $# >= 2 )); do
    ROS_DEV_CONTAINER_NAME=$1
    ROS_PROJECT_PATH=$2
    shift 2

    cd "$ROS2_DOCKER_DIR" && docker-compose up -d --build
  done
}

ros_shell() {
    if (( $# != 1 )); then
        echo "Usuage: ros_shell <container_name>"
        return 1
    fi

    docker exec -it $1 /bin/zsh
}

# Shell Configurations

> [!INFO]
> You need to restart your shell to load the changes (or just source it, example: `source ~/.bashrc`)

Find out what shell you are using by running the command `echo $SHELL` and then add the code block to your configuration file.

In the code blocks you will find `<YOUR PATH>` in the first line. This needs to replaced by the path to where you cloned this repository. You can find this out by going to the repository and running `pwd`.

You will also need to replace `<DOCKER-COMMAND>` with the docker command found on your platform file.

> [!WARNING]
> If you are running Linux, you need to allow have Xwayland running with the following xhost command added to your shell configuration `xhost +local:root

## BASH and ZSH

Configuration file: `~/.bashrc` or `~/.zshrc`

```bash
export ROS2_DOCKER_ENV=<YOUR PATH>

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    cd $ROS2_DOCKER_ENV
    git pull
    <DOCKER-COMMAND>
    cd $ROS_PROJECT_PATH
}

ros_stop() {
    cd $ROS2_DOCKER_ENV && docker compose down && cd && $ROS_PROJECT_PATH
}

ros_shell() {
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/bash
}
```

> Navigate back to [Linux](./linux.md), [MacOS](./mac.md) or [Windows](./windows.md) instructions.

## Fish

Configuration file: `~/.config/fish/config.fish`

```fish
set -x ROS2_DOCKER_ENV <YOUR PATH>

function ros_start
    set -x ROS_PROJECT_PATH (pwd)
    cd $ROS2_DOCKER_ENV
    git pull
    <DOCKER-COMMAND>
    cd $ROS_PROJECT_PATH
    xhost +local:root
end

function ros_stop
    cd $ROS2_DOCKER_ENV; and docker compose down; and cd $ROS_PROJECT_PATH
end

function ros_shell
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/bash
end
```

> Navigate back to [Linux](./linux.md), [MacOS](./mac.md) or [Windows](./windows.md) instructions.

## NuShell

*Coming Soon...*
# ROS2 Humble Development Container 

![](https://img.shields.io/github/actions/workflow/status/hegde-atri/ros2-docker/docker-publish.yml.svg)

# Preface

ROS2 Humble Development Container. Unfortunately poor performance on
macOS and Windows(AMD Graphics Card) due to hardware acceleration being
unsupported.

# Table of Contents

- [Prerequisites](#prerequisites)
- [Linux](#linux)
  - [Setup your shell](#setup-your-shell)
  - [Running the container](#running-the-container)
- [MacOS](#macos)
  - [Setup your shell](#setup-your-shell-1)
  - [Running the containers](#running-the-containers)
- [Windows](#windows)
  - [Setup your shell](#setup-your-shell-2)
  - [Running the containers](#running-the-containers-1)
- [Setting up VSCode (Optional)](#setting-up-vscode-optional)
- [Other Information](#other-information)

# Prerequisites

Before starting, ensure Docker is installed on your system following the instructions for your platform below.

# Linux

> [!IMPORTANT]
> You must first install Docker from your distribution's package manager (not Docker Desktop!). For Ubuntu users, follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) to install Docker.

> Expected performance is 60fps in gazebo.

## Setup your shell

1. Find out what shell you are using by running the command `echo $SHELL`.

2. It will be either bash or zsh.
   - If you are running `bash` add the next code block to `~/.bashrc`
   - If you are running `zsh` add the the next code block to `~/.zshrc`

3. Clone this repository to your computer and add the full path to the location you cloned this repository and replacing the placeholder `<STEP-3>`.

```bash
export ROS2_DOCKER_ENV=<STEP-3>

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    pushd $ROS2_DOCKER_ENV && docker compose -f docker-compose.linux.yml up -d --build && popd
    xhost +local:root
}

ros_stop() {
    pushd $ROS2_DOCKER_ENV && docker compose down && popd
}

ros_shell() {
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/bash
}
```

> [!NOTE]
> You need to restart your shell to load the changes (or just source it)

## Running the container

You can type in `ros_start` to start the docker containers with the current directory being mounted into docker.

Type `ros_shell` in the current terminal to enter your ros environment.

> [!IMPORTANT]
> If you are on wayland, make sure you have xwayland support and the `xorg.xhost` package installed.

# MacOS

> [!IMPORTANT]
> You must install Docker Desktop for Mac and ensure it is running before proceeding.
> Docker Desktop doesn't support GPU acceleration on macOS.

> Expected performance is 15-20fps in gazebo

## Setup your shell

1.  Find out what shell you are using by running the command
    `echo $SHELL`.
2.  It will be either bash or zsh.
    1.  If you are running `bash` add the next code block to `~/.bashrc`
    2.  If you are running `zsh` add the the next code block to
        `~/.zshrc`
3.  Clone this repository to your computer and add the full path to the
    location you cloned this repository and replacing the placeholder
    `<STEP-3>`.

``` bash
export ROS2_DOCKER_ENV=<STEP-3>

ros_start() {
    export ROS_PROJECT_PATH=$(pwd)
    pushd $ROS2_DOCKER_ENV && docker compose up -d --build && popd
}

ros_stop() {
    pushd $ROS2_DOCKER_ENV && docker compose down && popd
}

ros_shell() {
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/bash
}
```

Now restart your shell.

## Running the containers

You can type in `ros_start` to start the docker containers with the
current directory being your `ros2_ws/src` directory. (or its equivalent)

Type `ros_shell` in the current terminal to enter your ros environment.
You can keep spawing new terminals and entering `ros_shell` to have
multiple shells.

> [!IMPORTANT]
> Any GUI window opened will have to be viewed using the noVNC viewer at
> <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling
> mode to local.

When you are finished, type `ros_stop` to shutdown the containers.

# Windows

> [!WARNING]
> Windows support is currently experimental. GPU acceleration is not supported due to limitations with Docker and our specific setup.
> Performance may be significantly impacted.

The instructions here are a bit unclear at the moment due to not being able to test it on different types of hardware.

## Setup your shell

1. First clone this repository onto your computer to a location of your choice
2. Please update the windows.ps1 file in the download to have the the location to where you cloned the repository for `ROS2_DOCKER_ENV`
3. OPTIONAL: In `windows.ps1`, make sure the correct docker-compose file name is used  in `ROS2_DOCKER_COMPOSE_START_COMMAND` if you have Intel or Nvidia graphics
4. Import the file using `. .\windows.ps1`. Then run `ROS2` to see the command list

> [!WARNING]
> Intel and Nvidia variants of the windows docker-compose files are not tested. Please open an issue if you run into any errors.

## Running the containers

Always make sure to import the `windows.ps1` file (Step 4 from Setup your shell) before running any of the commands below.

1. Run `ROS2` - if you get a list of ROS2 commands, you've imported the file correctly.
2. `Start-ROS2`: Run this command in your ROS2 project/workspace directory. It will be the folder you can edit from within the container
3. `Enter-ROS2`: Run this command to open the shell in the running ROS2 container
4. `Stop-ROS2`: Run this command to stop the ROS2 containers

> [!IMPORTANT]
> Any GUI window opened will have to be viewed using the noVNC viewer at
> <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling
> mode to local.

# Setting up VSCode (Optional)

This is optional since the only ability it grants is you is to open
docker container terminals in an easier manner.

You can just write your code in your preferred code editor directly from
your ros2 workspace, but if you work with VSCode you can install the Dev
Containers extension to connect to the ros2 docker container, so you can
open terminals directly from vscode without having to run `ros_shell`
(or its equivalent for windows).


# Other Information

- The password for the student user is `password`.
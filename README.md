![](https://img.shields.io/github/actions/workflow/status/hegde-atri/ros2-docker/docker-publish.yml.svg)

# Preface

ROS2 Humble Development Container. Unfortunately poor performance on
macOS and Windows(AMD Graphics Card) due to hardware acceleration being
unsupported.

# Table of Contents <span class="tag" tag-name="TOC"><span class="smallcaps">TOC</span></span>

- [Preface](#preface)
- [Linux](#linux)
  - [Setup your shell](#setup-your-shell)
  - [Running the container](#running-the-container)
- [MacOS](#macos)
  - [Setup your shell](#setup-your-shell-1)
  - [Running the containers](#running-the-containers)
- [Windows](#windows)
- [Setting up VSCode (Optional)](#setting-up-vscode-optional)

# Linux

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
    pushd $ROS2_DOCKER_ENV && docker compose -f docker-compose.linux.yml up -d --build && popd
}

ros_stop() {
    pushd $ROS2_DOCKER_ENV && docker compose down && popd
}

ros_shell() {
    echo "Launching ROS Shell, type 'exit' to exit the shell once you are done."
    docker exec -it ros2 /bin/zsh
}
```

> You need to restart your shell to load the changes. (or just source
> it)

## Running the container

You can type in `ros_start` to start the docker containers with the
current directory being mounted into docker.

Type `ros_shell` in the current terminal to enter your ros environment.
You can keep spawing new terminals and entering `ros_shell` to have
multiple shells.

> You will need to run `xhost +` in your shell to allow the docker
> container to open windows in your environment. You can add this to
> your `.bashrc` / `.zshrc` or run it everytime you run `ros_start`.
>
> If you are on wayland, make sure you have xwayland support and the
> `xorg.xhost` package installed.

When you are finished, type `ros_stop` to shutdown the containers.

# MacOS

> Docker Desktop doesn't support GPU acceleration on macOS :(

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
    docker exec -it ros2 /bin/zsh
}
```

Now restart your shell.

## Running the containers

You can type in `ros_start` to start the docker containers with the
current directory being mounted into docker.

Type `ros_shell` in the current terminal to enter your ros environment.
You can keep spawing new terminals and entering `ros_shell` to have
multiple shells.

> Any GUI window opened will have to be viewed using the noVNC viewer at
> <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling
> mode to local.

When you are finished, type `ros_stop` to shutdown the containers.

# Windows

> Docker Desktop doesn't support GPU acceleration properly.

Please amend windows.ps1 to use the correct docker-compose file and
import it using `. .\windows.ps1`. Then run `ROS2` to see the command
list.

# Setting up VSCode (Optional)

This is optional since the only ability it grants is you is to open
docker container terminals in an easier manner.

You can just write your code in your preferred code editor directly from
your ros2 workspace, but if you work with VSCode you can install the Dev
Containers extension to connect to the ros2 docker container, so you can
open terminals directly from vscode without having to run `ros_shell`
(or its equivalent).

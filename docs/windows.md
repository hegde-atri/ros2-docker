# Windows

> [!WARNING]
> Windows support is currently experimental. GPU acceleration is not supported due to limitations with Docker and our specific setup.
> Performance may be significantly impacted.

## Prerequisites

Clone this repository using the command below in a location your prefer. You will need to remember this location. You will also need to install docker (with docker compose). Refer to your platform specific instructions.

``` bash
git clone https://github.com/hegde-atri/ros2-docker --depth 1
```

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

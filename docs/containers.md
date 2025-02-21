# Running and using the containers
> [!NOTE]
> You need to restart your shell to load the changes (or just source it) after updating your shell.

There are three commands `ros_start` to start running the containers, `ros_shell` to enter the container, and `ros_stop` to stop the containers.

### `ros_start`

Before you type in this command, you need to make sure that you are either in your team directory or an empty directory (typically at `~/ros2_ws`).

### `ros_shell`

> [!IMPORTANT]
> **Linux users:** If you are on wayland, make sure you have xwayland support and the `xorg.xhost` package installed.

This will launch the shell where you can start using all the `ros2` tools you need.

Refer to [vscode.md](./vscode.md) to be able to open and edit files in vsccode.

> [!IMPORTANT]
> **MacOS users:** Any GUI window opened will have to be viewed using the noVNC viewer at
> <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling
> mode to local.

### `ros_stop`

Once you are done working, exit the `ros_shell`. Now you just run `ros_stop`. 

> [!NOTE]
> you might get a warning if you run `ros_stop` from a different shell than `ros_start`
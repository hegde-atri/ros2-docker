FROM osrf/ros:humble-desktop-full

ARG WORKSPACE=/home/student/ros2_ws/src
WORKDIR /ros2_ws/src

ENV QT_X11_NO_MITSHM=1
ENV EDITOR=nano
# ENV XDG_RUNTIME_DIR=/tmp

RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt-get install -y \
    cmake \
    curl \
    gazebo \
    libglu1-mesa-dev \
    nano \
    vim \
    python3-pip \
    python3-pydantic \
    ros-dev-tools \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-turtlebot3 \
    ros-humble-turtlebot3-msgs \
    ros-humble-turtlebot3-simulations \
    ros-humble-turtlebot3-gazebo \
    ros-humble-joint-state-publisher \
    ros-humble-robot-localization \
    ros-humble-plotjuggler-ros \
    ros-humble-robot-state-publisher \
    ros-humble-ros2bag \
    ros-humble-rosbag2-storage-default-plugins \
    ros-humble-rmw-fastrtps-cpp \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-slam-toolbox \
    ros-humble-rqt* \
    ros-humble-librealsense2* \
    ros-humble-realsense2-* \
    ros-humble-dynamixel-sdk \
    ros-humble-gazebo-* \
    ros-humble-turtlesim \
    python3-rosdep \
    python3-colcon-common-extensions \
    ffmpeg \
    rviz \
    tmux \
    wget \
    xorg-dev

RUN pip3 install setuptools==58.2.0

RUN apt-get install -y \
    mesa-utils \
    libegl1-mesa-dev \
    libgl1-mesa-dev \
    libgles2-mesa-dev \
    python3-pandas



RUN useradd -ms /bin/bash student \
    && echo "student:password" | chpasswd

RUN apt-get update && apt-get install -y sudo && \
    usermod -aG sudo student && \
    echo "student ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# Try to install starship, but don't fail if it doesn't work
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes || true

USER student
# Disable sudo warning
RUN touch ~/.hushlogin

RUN mkdir -p ~/ros2_ws/src/com2009
WORKDIR /home/student/ros2_ws/src

# Switch to bash

# Only add starship init if starship was successfully installed
RUN if [ -f "/usr/local/bin/starship" ]; then \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc; \
    fi
RUN echo 'if [ -f "$HOME/ros2_ws/install/setup.bash" ]; then\n    source $HOME/ros2_ws/install/setup.bash\nfi' >> ~/.bashrc
RUN echo 'LC_NUMERIC="en_US.UTF-8"' >> ~/.bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc
# Enable colcon_cd
RUN echo 'source /usr/share/colcon_cd/function/colcon_cd.sh' >> ~/.bashrc
RUN echo 'export _colcon_cd_root=/home/student/ros2_ws' >> ~/.bashrc

RUN echo 'alias rosdi="rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y"' >> ~/.bashrc
RUN echo 'alias cbuild="colcon build --symlink-install"' >> ~/.bashrc
RUN echo 'alias ssetup="source ./install/local_setup.bash"' >> ~/.bashrc
RUN echo 'alias cyclone="export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp"' >> ~/.bashrc
RUN echo 'alias fastdds="export RMW_IMPLEMENTATION=rmw_fastrtps_cpp"' >> ~/.bashrc
RUN echo 'export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp' >> ~/.bashrc

RUN echo 'export TURTLEBOT3_MODEL=waffle' >> ~/.bashrc
RUN echo 'export ROS_DOMAIN_ID=1' >> ~/.bashrc

RUN echo "[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion" >> ~/.bashrc
RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> ~/.bashrc
RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> ~/.bashrc

# Build any additional packages.
# WORKDIR /home/student/ros2_ws/src
# RUN git clone -b humble https://github.com/tom-howard/tuos_ros.git tuos_ros
# ENV COLCON_PREFIX_PATH=/home/student/ros2_ws/src
# WORKDIR /home/student/ros2_ws/src/tuos_ros
# RUN git checkout humble
# WORKDIR /home/student/ros2_ws
# RUN source ~/.zshrc && colcon build --symlink-install
# RUN echo 'source /home/student/ros2_ws/install/local_setup.zsh' >> ~/.zshrc

RUN echo 'alias roscd="cd ~/ros2_ws/src"' >> ~/.bashrc
RUN echo 'alias tb3_teleop="ros2 run turtlebot3_teleop teleop_keyboard"' >> ~/.bashrc
RUN echo 'alias tb3_world="ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py"' >> ~/.bashrc
RUN echo 'alias tb3_sim="ros2 launch turtlebot3_gazebo empty_world.launch.py"' >> ~/.bashrc
RUN echo 'alias tb3_slam="ros2 launch turtlebot3_cartographer cartographer.launch.py"' >> ~/.bashrc
RUN echo 'alias tb3_rviz="ros2 launch tuos_simulations rviz.launch"' >> ~/.bashrc

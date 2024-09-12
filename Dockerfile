FROM osrf/ros:humble-desktop-full

ARG WORKSPACE=/ros2_ws
WORKDIR /ros2_ws

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
    xorg-dev \
    zsh

RUN pip3 install setuptools==58.2.0

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc
RUN echo 'echo "You are in the BASH shell."' >> ~/.bashrc
RUN echo 'echo "This is not configured for ROS2 Development"' >> ~/.bashrc
RUN echo 'echo "Return to the ZSH shell by running zsh"' >> ~/.bashrc

RUN echo 'eval "$(starship init zsh)"' >> ~/.zshrc

RUN echo "export DISABLE_AUTO_TITLE=true" >> /root/.zshrc
RUN echo 'LC_NUMERIC="en_US.UTF-8"' >> /root/.zshrc
RUN echo "source /opt/ros/humble/setup.zsh" >> /root/.zshrc
RUN echo "source /usr/share/gazebo/setup.sh" >> /root/.zshrc

RUN echo 'alias rosdi="rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y"' >> /root/.zshrc
RUN echo 'alias cbuild="colcon build --symlink-install"' >> /root/.zshrc
RUN echo 'alias ssetup="source ./install/local_setup.zsh"' >> /root/.zshrc
RUN echo 'alias cyclone="export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp"' >> /root/.zshrc
RUN echo 'alias fastdds="export RMW_IMPLEMENTATION=rmw_fastrtps_cpp"' >> /root/.zshrc
RUN echo 'export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp' >> /root/.zshrc

RUN echo 'export TURTLEBOT3_MODEL=waffle' >> /root/.zshrc
RUN echo 'export ROS_DOMAIN_ID=30' >> /root/.zshrc

RUN echo "autoload -U bashcompinit" >> /root/.zshrc
RUN echo "bashcompinit" >> /root/.zshrc
RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> /root/.zshrc
RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> /root/.zshrc

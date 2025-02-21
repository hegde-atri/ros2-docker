# Linux

## 1. Installing Docker (and Docker Compose)

### Ubuntu/Debian
Make sure to install docker using [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04).

Make sure you also complete the guide Step 1 **and** [Step 2 (Optional)](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04#step-2-executing-the-docker-command-without-sudo-optional) as you need to be able to use the `docker` command without root permissions.

### Arch Linux (Artix/Endeavour/Manjaro)

You can install it using the command below, but also refer to the [documentation](https://wiki.archlinux.org/title/Docker) to run the service, and execute `docker` without root permissions.

```shell
sudo pacman -S docker docker-compose
```

### Fedora

You can use the command below to install it on Fedora 41 and newer. Make sure to refer to the [documentation](https://docs.fedoraproject.org/en-US/quick-docs/installing-docker/) as this is untested.

```bash
sudo dnf install docker-cli containerd docker-compose
```

### NixOS

In your `configuration.nix` file, add the following.
```nix
   virtualisation.docker.enable = true;
   environment.systemPackages = with pkgs; [ docker-compose ];
```

Then make sure to add your user to the docker group (also in `configuration.nix`)

```nix
users.users.username = {
   ...
    extraGroups = [
      ...
      "docker"
    ];
    ...
  };
 
```

## 2. Setting up your workspace

### 2.1 Clone this repository

Clone this repository using the command below in a location your prefer. You will need to remember this location.

``` bash
git clone https://github.com/hegde-atri/ros2-docker --depth 1
```

### 2.2 Setup your Shell

Refer to [shell.md](./shell.md) to setup your shell.

> [!WARNING]
> If you are running Linux, you need to allow have Xwayland running with the following xhost command added to your shell configuration `xhost +local:root

## 3. Start using the containers
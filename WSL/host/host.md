# Essential steps to setup Windows host

## Microsoft Activation Scripts (MAS)

Run [Microsoft Activation Scripts (MAS)](https://github.com/massgravel/Microsoft-Activation-Scripts) with `irm https://massgrave.dev/get | iex`

## Winutil

Run [Winutil](https://github.com/ChrisTitusTech/winutil) with `iwr -useb https://christitus.com/win | iex`

## Use Podman/Docker in WSL

### Goal

To use `docker compose up` inside a WSL project, without installing multiple instances of podman/docker.

### Approach

1. install WSL

2. install podman on host machine

3. set up alias for docker to use podman, and for WSL podman to use podman.exe

## Install WSL

Essential commands:

1. list current distributions: `wsl --list --all`

```
PS C:\Users\weiwei> wsl --list --all
Windows Subsystem for Linux Distributions:
Ubuntu-22.04 (Default)
podman-machine-default
```

2. list distributions that can be installed: `wsl --list --online`

```
PS C:\Users\weiwei> wsl --list --online
The following is a list of valid distributions that can be installed.
Install using 'wsl.exe --install <Distro>'.

NAME                                   FRIENDLY NAME
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
kali-linux                             Kali Linux Rolling
Ubuntu-18.04                           Ubuntu 18.04 LTS
Ubuntu-20.04                           Ubuntu 20.04 LTS
Ubuntu-22.04                           Ubuntu 22.04 LTS
OracleLinux_7_9                        Oracle Linux 7.9
OracleLinux_8_7                        Oracle Linux 8.7
OracleLinux_9_1                        Oracle Linux 9.1
openSUSE-Leap-15.5                     openSUSE Leap 15.5
SUSE-Linux-Enterprise-Server-15-SP4    SUSE Linux Enterprise Server 15 SP4
SUSE-Linux-Enterprise-15-SP5           SUSE Linux Enterprise 15 SP5
openSUSE-Tumbleweed                    openSUSE Tumbleweed
```

3. install distribution (ex. Ubuntu 22.04): `wsl --install --web-download --no-launch Ubuntu-22.04`

```
PS C:\Users\weiwei> wsl --install --web-download --no-launch Ubuntu-22.04
Downloading: Ubuntu 22.04 LTS
Installing: Ubuntu 22.04 LTS
Ubuntu 22.04 LTS has been installed.
```

note: `--web-download` to not use Store, `--no-launch` to not launch after installing, so launch app from start menu after installing to setup username

4. set as default (ex. Ubuntu 22.04): `wsl --set-default Ubuntu-22.04`

5. uninstall (unregister) (ex. Ubuntu 22.04): `wsl --unregister Ubuntu-22.04`

```
PS C:\Users\weiwei> wsl --unregister Ubuntu-22.04
Unregistering.
The operation completed successfully.
```

## Install Podman on Host Windows

1. install Podman: `winget install RedHat.Podman`

2. initailize Podman vm: `podman machine init`

3. (optional) set rootful: `podman machine set --rootful`

4. start Podman vm: `podman machine start`

### Podman Compose (via Podman Desktop)

5. install Podman desktop: `winget install RedHat.Podman-Desktop`

6. install Podman Compose (instructions from [podman-desktop.io](https://podman-desktop.io/docs/compose/setting-up-compose)): Settings > Resources > Compose:Setup > follow prompts

```
PS C:\Users\weiwei> podman compose version
>>>> Executing external compose provider "C:\\Users\\weiwei\\AppData\\Local\\Microsoft\\WindowsApps\\docker-compose.exe". Please refer to the documentation for details. <<<<

Docker Compose version v2.24.6
```

## Alias

### WSL

Add the following lines to `.bashrc` or `.zshrc`:

```sh
alias podman='podman.exe'
alias docker='podman'
```

Verify by

```
weiwei@the3dsandesktop:~$ docker version
Client:       Podman Engine
Version:      4.9.3
API Version:  4.9.3
Go Version:   go1.20.13
Git Commit:   8d2b55ddde1bc81f43d018dfc1ac027c06b26a7f
Built:        Fri Feb 16 21:45:54 2024
OS/Arch:      windows/amd64

Server:       Podman Engine
Version:      4.9.3
API Version:  4.9.3
Go Version:   go1.21.7
Built:        Mon Feb 19 23:41:34 2024
OS/Arch:      linux/amd64
weiwei@the3dsandesktop:~$ docker compose version
>>>> Executing external compose provider "C:\\Users\\weiwei\\AppData\\Local\\Microsoft\\WindowsApps\\docker-compose.exe". Please refer to the documentation for details. <<<<

Docker Compose version v2.24.6
```

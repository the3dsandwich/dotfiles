#!bin/bash

# install dependencies
sudo apt install -y thunar rofi kitty awesome variety virtual-machine-manager
# fix qemu network 'default' not started (by enabling autostart)
sudo virsh net-autostart default
# check result
sudo virsh net-list --all

# setup bluetooth to connect keyboard on boot
sudo sh -c "echo 'FastConnectable=true' >> /etc/bluetooth/main.conf"

# 150% scale on 4K (basically looks like 2K)
xrandr --output `xrandr | grep " connected"|cut -f1 -d" "` --mode 3840x2160 --scale 0.75x0.75

cp -r .config/* ~/.config
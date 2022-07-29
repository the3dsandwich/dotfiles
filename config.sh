#!bin/bash

# requires qemu
sudo apt install virtual-machine-manager
# fix qemu network 'default' not started (by enabling autostart)
sudo virsh net-autostart default
# check result
sudo virsh net-list --all

# setup bluetooth to connect keyboard on boot
sudo sh -c "echo 'FastConnectable=true' >> /etc/bluetooth/main.conf"

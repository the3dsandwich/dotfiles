#!/bin/bash
sudo apt install build-essential gcc -y

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
    echo
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
) >>~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

exec $SHELL

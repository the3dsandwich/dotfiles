# upgrade currently installed packages
echo "Upgrading currently installed packages..."
sudo apt update && sudo apt upgrade -y
brew update && brew upgrade

# basic utilities
echo "Installing basic utilities..."
sudo apt install -y \
    curl \
    wget \
    git \
    htop \
    nvtop \
    btop \
    bat
brew install fastfetch
(
  echo
  echo 'alias cat="batcat"'
) >>~/.zshrc

# docker
echo "Installing Docker..."
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt remove $pkg; done
# Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# ansible
echo "Installing Ansible..."
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# terraform (opentofu)
sudo snap install --classic opentofu

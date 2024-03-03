rm ~/.zshrc
sudo rm -r ~/.oh-my-zsh

brew reinstall zsh zsh-autosuggestions zsh-syntax-highlighting

echo $(which zsh) | sudo tee -a /etc/shells

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chsh -s $(which zsh)

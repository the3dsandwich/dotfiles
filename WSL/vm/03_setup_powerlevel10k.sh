brew reinstall powerlevel10k

rm ~/.zshrc
(
    echo 'export ZSH="$HOME/.oh-my-zsh"'
    echo
    echo 'source $ZSH/oh-my-zsh.sh'
    echo 'source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
    echo 'source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
    echo 'source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme'
    echo
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"'
    echo
    echo 'zstyle ':omz:update' mode auto'
    echo 'zstyle ':omz:update' frequency 1'
    echo
    echo 'plugins=(git)'
    echo
    echo 'alias podman="podman.exe"'
    echo 'alias docker="podman"'
    echo 'alias python="python3"'
    echo 'alias ohmyzsh="mate ~/.oh-my-zsh"'
    echo 'alias zshconfig="mate ~/.zshrc"'
    echo
    echo 'chpwd() { l }'
    echo
    echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)'
    echo 'POWERLEVEL9K_SHORTEN_STRATEGY=default'
    echo 'POWERLEVEL9K_SHORTEN_DIR_LENGTH=2'
    echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)'
    echo 'POWERLEVEL9K_MODE='nerdfont-complete''
    echo
    echo 'DEFAULT_USER=weiwei'
    echo
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
    echo
) >> ~/.zshrc

echo
echo "restart shell to take into effect"

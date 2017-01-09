# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="bullet-train"
ZSH_CUSTOM=~/.dotfiles/oh-my-zsh-custom
plugins=(vi-mode git npm osx zsh-syntax-highlighting history-substring-search command-not-found)
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
  eval "$(rbenv init -)"
  source $(brew --prefix nvm)/nvm.sh
  export NVM_DIR=~/.nvm
  export EDITOR='vim'
  export PATH=~/.rbenv/shims/:$PATH
fi

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#==========================
# Pandoc to create word files from markdown
#==========================

alias md2word=md2word # alias the function below

function md2word () {  
    PANDOC_INSTALLED=$(pandoc --version >> /dev/null; echo $?)

    if [ "0" == ${PANDOC_INSTALLED} ]; then
        pandoc -o $2 -f markdown -t docx $1
    else
        echo "Pandoc is not installed. Unable to convert document."
    fi
} 


# WP-CLI Bash completions
autoload bashcompinit
bashcompinit
source $HOME/.dotfiles/scripts/wp-completion.bash

im() { 
  echo -e "\033]50;SetProfile=$1\a" 
  export ITERM_PROFILE=$1
}

export PATH=~/bin:$PATH


export GOPATH=$HOME/web/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
alias rn='react-native'

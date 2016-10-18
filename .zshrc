# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="bullet-train"
ZSH_CUSTOM=~/.dotfiles/oh-my-zsh-custom
plugins=(git, history-substring-search, command-not-found)
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
bindkey -v

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

source ~/.dotfiles/antigen.zsh
antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle chrissicool/zsh-256color

# # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

## history seasrch
antigen bundle zsh-users/zsh-history-substring-search

# # Load the theme.
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# # Tell antigen that you're done.
antigen apply

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
eval "$(rbenv init -)"

source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

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

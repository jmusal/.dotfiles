# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
 ZSH_CUSTOM=~/.dotfiles/oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, history-substring-search, command-not-found)

source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
  eval "$(rbenv init -)"

  source $(brew --prefix nvm)/nvm.sh
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  export EDITOR='vim'
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"


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

source ~/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle chrissicool/zsh-256color

# # Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

# # Load the theme.
antigen theme wesbos/Cobalt2-iterm cobalt2.zsh-theme

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


#BULLETTRAIN_NVM_SHOW=true
#BULLETTRAIN_RUBY_SHOW=false
#BULLETTRAIN_EXEC_TIME_SHOW=true
#BULLETTRAIN_NVM_FG="black"
#BULLETTRAIN_TIME_SHOW=false

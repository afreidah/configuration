# ZSH configuration including oh-my-zsh and plugins
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="mocha" # Required! Options: mocha, flappe, macchiato, latte
ENABLE_CORRECTION="false"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"

export ZSH="$HOME/.oh-my-zsh"
autoload -U compinit; compinit

plugins=(
    git
    taskwarrior
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# general aliases
alias ls="ls -ltrG"
alias be="bundle exec"
alias cat="pygmentize -f terminal256 -O style=native -g"
alias egrep="egrep -i --color=\"always\""

# copilot aliases
alias ghe="gh copilot explain"
alias ghs="gh copilet suggest"

# tmux aliases
alias tmux='tmux -u'
alias tmx="tmuxinator"
alias ta="tmux attach -t"
alias tmuxcfg="vim ~/.tmux.conf"

# vim aliases
alias vi="nvim"
alias vim="nvim"
alias vimcfg="vim ~/config/nvim/.config/nvim/init.lua"

# zsh aliases
alias zsrc="source ~/.zshrc"
alias zshconfig="vim ~/.zshrc"

# terraform/terragrunt aliases
alias tp="terragrunt plan"
alias ta="terragrunt apply"
alias ti="terragrunt init -upgrade"
alias tip="terragrunt init -upgrade; terragrunt plan"

# test kitchen aliases
alias kl="kitchen list"
alias kt="kitchen test"
alias kv="kitchen verify"
alias kd="kitchen destroy"
alias klog="kitchen login"
alias kc="kitchen converge"

# editor stuff
set -o vi
export EDITOR='nvim'
export TERM="tmux-256color"

#Chef stuff
export DOCKER_BUILDKIT=1
export CHEF_API_CLIENT='afreidah'
export PATH="/Users/AlexFreidah/.mynav:$PATH"
export PATH="/Users/AlexFreidah/tools:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="/Users/alexfreidah/.local/bin:$PATH"
export PATH="/Users/alexfreidah/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"

source '/Users/AlexFreidah/repos/edo-chef/.chefrc'
export CHEF_API_KEY='/Users/AlexFreidah/tools/chef/afreidah.pem'
export CHEF_SECRET_FILE='/Users/AlexFreidah/tools/chef/encrypted_data_bag_secret'
export CHEF_SECRET_FILE_COLLECTION='/Users/AlexFreidah/tools/chef/encrypted_data_bag_secret_collection'

# AWS stuff
export AWS_PROFILE=default-mfa
export AWS_DEFAULT_REGION=us-west-2

# reverse history search
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# go stuff
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export TERRAGRUNT_DOWNLOAD=/tmp/terragrunt_caches

# these are strays
export PACKER_SSH_KEY="$HOME/.ssh/id_rsa"
export PKG_CONFIG_PATH="/opt/homebrew/Cellar/libffi/3.4.7/lib/pkgconfig/"
setopt auto_cd

# SSH stuff for osx
eval "$(ssh-agent -s)" >/dev/null
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 >/dev/null

# PATH general settings
export PATH=/opt/local/bin:$PATH
export PATH="/opt/homebrew/anaconda3/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/Users/AlexFreidah/utilities:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# fzf stuff
source <(fzf --zsh)
fpath+=~/.zfunc; autoload -Uz compinit; compinit
alias fzf="fzf --color=dark --tmux center"
# for kitchen completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# testing out mcfly intelligent history search
eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim

# text formatter aliases
alias c_format="find . -regex '.*\.\(cpp\|hpp\|cu\|cuh\|c\|h\)' -exec clang-format -style=file -i {} \;"
alias terraform_format="terragrunt fmt"
alias terraform_doc="terraform-docs --hide modules --output-file README.md --output-mode inject markdown ./"
alias ruby_format="bundle exec rubocop -a"
alias python_format="black ."
alias python_doc="pydoc-markdown -I $(pwd) > README.md"
alias chef_format="cookstyle"

# >>> conda initialize >>>
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
 
# source private settings if they exist
[ -f ~/.private-zshrc ] && source ~/.private-zshrc

# mann function for reading man pages in vim
function mann {
man $1 | ul -i | nvim -
}

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin"

# syntax highlighting
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


# setting for mkgoprj command (auto generate)
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm for node
source "$HOME/.nvm/nvm.sh"

# ZSH configuration including oh-my-zsh and plugins
ZSH_THEME="jnrowe"
ENABLE_CORRECTION="true"
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
alias vi="nvim"
alias vim="nvim"
alias ls="ls -ltrG"
alias tmx="tmuxinator"
alias ta="tmux attach -t"
alias zsrc="source ~/.zshrc"
alias ghe="gh copilot explain"
alias ghs="gh copilet suggest"
alias zshconfig="vim ~/.zshrc"
alias fzf="fzf --color=dark --tmux center"
alias cat="pygmentize -f terminal256 -O style=native -g"
alias terragruntreset="terragrunt destroy --auto-approve; rm -rf /tmp/terragrunt_cache; rm .terraform.lock.hcl; terragrunt init -upgrade"

# editor stuff
set -o vi
export EDITOR='nvim'
export TERM="xterm-256color"

#Chef stuff
export DOCKER_BUILDKIT=1
export CHEF_API_CLIENT='afreidah'
export PATH="/Users/AlexFreidah/.mynav:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="/Users/alexfreidah/.local/bin:$PATH"
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

# TODO: these are strays
# mcfly history search
export PACKER_SSH_KEY="$HOME/.ssh/id_rsa"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
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

# testing out mcfly intelligent history search
eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim

# text formatter aliases
alias format_c="find . -regex '.*\.\(cpp\|hpp\|cu\|cuh\|c\|h\)' -exec clang-format -style=file -i {} \;"
alias format_terraform="terragrunt fmt"
alias format_ruby="bundle exec rubocop -a"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

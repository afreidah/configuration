# ~/.zshrc
[ -f ~/.shell_zsh ] && source ~/.shell_zsh
[ -f ~/.shell_shared ] && source ~/.shell_shared

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/nomad nomad

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

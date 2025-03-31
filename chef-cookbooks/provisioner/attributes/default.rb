default['provisioner']['packages'] = %w(awscli nvim zsh git tmux stow curl tmuxinator zsh-autosuggestions zsh-syntax-highlighting rbenv unzip cowsay fzf go k9s ipcalc jq lynx mysql-client packer pygments ripgrep task taskwarrior-tui tig tree-sitter xz yq bat)
default['provisioner']['arm64_packages'] = %w(tfenv tmuxinator-completion clang-format minikube buildkit)
default['provisioner']['x86_64_packages'] = %w(build_essential libssl-dev libreadline-dev zlib1g-dev)
default['provisioner']['ruby_version'] = '3.3.0'
default['provisioner']['user'] = 'root'
default['provisioner']['group'] = node['platform'] == 'mac_os_x' ? 'wheel' : 'root'
default['provisioner']['active_stow_dirs'] = %w(nvim oh-my-zsh tmux zsh scripts)

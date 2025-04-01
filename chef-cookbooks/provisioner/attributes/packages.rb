#<> Description: List of packages to install on the system
##

#<> linux specific packages
default['provisioner']['x86_64_packages'] = %w(
  build_essential
  libssl-dev
  libreadline-dev 
  zlib1g-dev
)

#<> osx specific packages
default['provisioner']['arm64_packages'] = %w(
  tfenv
  tmuxinator-completion
  clang-format 
  minikube
  buildkit
)

#<> commmon packages
default['provisioner']['packages'] = %w(
  awscli
  nvim
  zsh
  git
  tmux
  stow
  curl
  tmuxinator
  zsh-autosuggestions
  zsh-syntax-highlighting
  rbenv
  unzip
  cowsay
  fzf
  go
  k9s
  ipcalc
  jq
  lynx
  mysql-client
  packer
  pygments
  ripgrep
  task
  taskwarrior-tui
  tig
  tree-sitter
  xz
  yq
  bat
)

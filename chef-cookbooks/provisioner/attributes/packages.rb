#<> Description: List of packages to install on the system
##

#<> linux specific packages
linux_packages =  = %w(
  build_essential
  libssl-dev
  libreadline-dev 
  zlib1g-dev
)
default['provisioner']['x86_64_packages'] = linux_packages

#<> osx specific packages
osx_packages = %w(
  tfenv
  tmuxinator-completion
  clang-format 
  minikube
  buildkit
)
default['provisioner']['arm64_packages']  = osx_packages

#<> commmon packages
common_packages = %w(
  virtualbox
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
default['provisioner']['packages'] = common_packages

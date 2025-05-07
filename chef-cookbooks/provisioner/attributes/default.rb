# <> Description: Default attributes for the provisioner cookbook
##

# < sadly we have to handle OSX and not just linux when handling the root
# user and group
# >
default['provisioner']['group'] = platform?('mac_os_x') ? 'wheel' : 'root'
default['provisioner']['user'] = 'root'

# < these are the configs that will be installed based on the filder
# names in the ~/config directory of the repository
# >
default['provisioner']['active_stow_dirs'] = %w(nvim oh-my-zsh tmux zsh scripts alacritty bash unified_shell)

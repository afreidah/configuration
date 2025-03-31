include_recipe 'provisioner::packages'
include_recipe 'provisioner::stow'
include_recipe 'provisioner::ruby'
include_recipe 'provisioner::terraform' unless node['platform'] == "mac_os_x"

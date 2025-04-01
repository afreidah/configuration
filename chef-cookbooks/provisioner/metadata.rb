# chef-cookbooks/provisioner/metadata.rb
name 'provisioner'
maintainer 'Alex Freidah'
maintainer_email 'afreidah@gmail.com'
license 'Apache-2.0'
description 'A cookbook to handle provisioning of my settings'
version '0.1.0'
chef_version '>= 16.0'

%w( debian mac_os_x ubuntu ).each do |os|
  supports os
end


depends 'homebrew', '~> 6.0.1'

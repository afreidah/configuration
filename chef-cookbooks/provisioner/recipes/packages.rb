=begin
#<
Installs packages based on the platform. The packages are defined in the node attributes.
#>
=end

case node['platform']
when 'mac_os_x'
  include_recipe 'homebrew::default'

  (node['provisioner']['packages'] + node['provisioner']['arm64_packages']).each do |pkg|
    homebrew_package pkg do
      action :install
    end
  end

when 'ubuntu', 'debian', 'centos', 'redhat'
  (node['provisioner']['packages'] + node['provisioner']['x86_64_packages']).each do |pkg|
    package pkg do
      action :install
    end
  end
else
  log 'Unsupported platform for package installation' do
    level :error
  end
end

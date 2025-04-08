# #<
# This recipe uses the `stow` command to symlink the configuration files in the `~/config` directory to the user's home directory.
# It loops through the `active_stow_dirs` attribute and runs the `stow` command for each directory which means that the configs
# to restore can be customized by adding or removing directories from the `active_stow_dirs` attribute.
# >

node['provisioner']['active_stow_dirs'].each do |i|
  bash "stow_#{i}" do
    code "stow -R #{i}"
    cwd "#{ENV['HOME']}/config/"
    action :run
  end
end

# Description: use stow to restore config
# directories
for i in node['provisioner']['active_stow_dirs'] do
  bash "stow_#{i}" do
    code "stow -R #{i}"
    cwd "#{ENV['HOME']}/config/"
    action :run
  end
end

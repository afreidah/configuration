#!/usr/bin/env ruby

# UTILITY FUNCTIONS
def utility_exists?(utility)
  IO.popen("command -v #{utility}", 'r') { |io| io.read.strip != '' }
end

# INSTALL CHEF
if !utility_exists?('chef-solo')
  system('curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P cinc-workstation -v 24')
end

# RUN CHEF
system('sudo chef-solo -c solo.rb -j configure.json')

# TODO: run stow to symlink all the dotfiles in this repo
# we need to leep over every directory in this repo
# and run `stow <directoryname>` on it to symlink the files
# to where they belong for confiuration

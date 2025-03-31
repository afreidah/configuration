#README FOR CONFIGURING SYSTEM

# BOOTSTRAPPING A NEW MACHINE

This repo contains the dotfiles and config files for my required tools.
It uses stow to symlink the files to the home directory so that my
configs are portable and easy to enable/disable.  Then it installs chef
(cinc) if it isn't already installed and runs the chef cookbook to
install the required packages and provisions the system.

## Requirements

A ruby installed on the system already.  This is because chef is
written in ruby and the bootstrap script needs to bundle install and
berks install and then run cinc-solo.

## Installation

git clone git@github.com:afreidah/configuration.git ~/config

## Configuration

node['provisioner']['active_stow_dirs'] - an attribute that is an
array of coponents (directories) we want stow to run against...that way
if a certain system doesn't need a component we don't have to muddy up
the home directory with configs for it.

node['provisioner']['packages'] - an arrray of packages to
install.  Since this needs to work on OSX and Linux there are certain
packages unique to each system.  To quickly get around this, I have set
up three package attribute arrays and in the recipe they will be merged
based on platform:

* node['provisioner']['packages'] => packages comon to both
* node['provisioner']['arm_packages'] => packages for OSX
* node['provisioner']['x86_64_packages'] => packages for Linux

## Execution

cd ~/config/chef-cookbooks/provisioner
./bootstrap.sh

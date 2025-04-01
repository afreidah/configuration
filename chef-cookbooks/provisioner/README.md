# Description

A cookbook to handle provisioning of my settings

# Requirements


## Chef Client:

* chef (>= 16.0)

## Platform:

* debian
* mac_os_x
* ubuntu

## Cookbooks:

* [homebrew](https://github.com/sous-chefs/homebrew) (~> 6.0.1)

# Attributes

* `node['provisioner']['group']` -  Defaults to `node['platform'] == 'mac_os_x' ? 'wheel' : 'root`.
* `node['provisioner']['user']` -  Defaults to `root`.
* `node['provisioner']['active_stow_dirs']` -  Defaults to `%w(nvim oh-my-zsh tmux zsh scripts)`.
* `node['provisioner']['x86_64_packages']` - linux specific packages. Defaults to `%w(`.
* `node['provisioner']['arm64_packages']` - osx specific packages. Defaults to `%w(`.
* `node['provisioner']['packages']` - commmon packages. Defaults to `%w(`.
* `node['provisioner']['ruby_version']` - Ruby version to install. Defaults to `3.3.0`.

# Recipes

* [provisioner::default](#provisionerdefault) - The default recipe for the provisioner cookbook.
* [provisioner::packages](#provisionerpackages) - Installs packages based on the platform.
* [provisioner::ruby](#provisionerruby) - Installs Ruby using rbenv.
* [provisioner::stow](#provisionerstow) - This recipe uses the `stow` command to symlink the configuration files in the `~/config` directory to the user's home directory.
* [provisioner::terraform](#provisionerterraform) - Installs Terraform and Terragrunt using tfenv and the latest stable version of Terragrunt respectively.

## provisioner::default

The default recipe for the provisioner cookbook. This recipe includes all the other recipes in the cookbook.

## provisioner::packages

Installs packages based on the platform. The packages are defined in the node attributes.

## provisioner::ruby

Installs Ruby using rbenv. The Ruby version is defined in the node attributes.

## provisioner::stow

This recipe uses the `stow` command to symlink the configuration files in the `~/config` directory to the user's home directory.
It loops through the `active_stow_dirs` attribute and runs the `stow` command for each directory which means that the configs
to restore can be customized by adding or removing directories from the `active_stow_dirs` attribute.

## provisioner::terraform

Installs Terraform and Terragrunt using tfenv and the latest stable version of Terragrunt respectively.

# License and Maintainer

Maintainer:: Alex Freidah (<afreidah@gmail.com>)



License:: Apache-2.0

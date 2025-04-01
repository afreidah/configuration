# Description

A cookbook to handle provisioning of my settings

# Requirements


## Chef Client:

* chef (>= 16.0)

## Platform:

*No platforms defined*

## Cookbooks:

* [homebrew](https://github.com/sous-chefs/homebrew) (~> 6.0.1)

# Attributes

* `node['provisioner']['group']` -  Defaults to `node['platform'] == 'mac_os_x' ? 'wheel' : 'root`.
* `node['provisioner']['user']` -  Defaults to `root`.
* `node['provisioner']['active_stow_dirs']` -  Defaults to `%w(nvim oh-my-zsh tmux zsh scripts)`.
* `node['provisioner']['x86_64_packages']` -  Defaults to `%w(`.
* `node['provisioner']['arm64_packages']` -  Defaults to `%w(`.
* `node['provisioner']['packages']` -  Defaults to `%w(`.
* `node['provisioner']['ruby_version']` -  Defaults to `3.3.0`.

# Recipes

* provisioner::default
* provisioner::packages
* provisioner::ruby
* provisioner::stow
* provisioner::terraform

# License and Maintainer

Maintainer:: Alex Freidah (<afreidah@gmail.com>)



License:: Apache-2.0

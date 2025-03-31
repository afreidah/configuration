##!/usr/bin/env bash
#
# CLEANUP
sudo rm -rf berks-cookbooks local-mode-cache nodes cinc_guid

# INSTALL CHEF IF NOT INSTALLED
if ! command -v cinc-solo >/dev/null 2>&1; then
  curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P cinc-workstation -v 24
fi

# GET LATEST CHANGES
git checkout main
git pull origin main

# BUNDLER STUFF
gem install bundler
bundle install
bundle exec berks update
bundle exec berks install
bundle exec berks vendor

# RUN CHEF
sudo cinc-solo -c solo.rb -j solo.json

# CLEANUP
sudo rm -rf berks-cookbooks local-mode-cache nodes cinc_guid
cowsay "Bootstrap complete!"

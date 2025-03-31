##!/usr/bin/env bash
#
#cleanup
sudo rm -rf berks-cookbooks local-mode-cache nodes cinc_guid

# INSTALL CHEF IF NOT INSTALLED
if ! command -v cinc-solo >/dev/null 2>&1; then
  curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P cinc-workstation -v 24
end

# RUN CHEF
bundle install
bundle exec berks install
bundle exec berks vendor
sudo cinc-solo -c solo.rb -j solo.json

echo "Bootstrap complete"

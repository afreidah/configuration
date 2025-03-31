# solo.rb
current_dir = File.dirname(__FILE__)
log_level          :info
log_location       STDOUT
node_name          "cinc-solo-provisioner"
file_cache_path    '/tmp/chef-solo'
file_backup_path   '/tmp/chef-solo-backups'
cookbook_path      ["#{File.expand_path('berks-cookbooks')}", "#{File.expand_path('cookbooks')}"]

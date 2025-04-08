# #<
# The default recipe for the provisioner cookbook. This recipe includes all the other recipes in the cookbook.
# >

include_recipe 'provisioner::packages'
include_recipe 'provisioner::stow'
include_recipe 'provisioner::ruby'
include_recipe 'provisioner::terraform'

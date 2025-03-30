# install all required packages
node['provisioner']['packages'].each do |pkg|
  package pkg
end

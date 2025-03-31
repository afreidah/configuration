# install specific ruby
bash 'install ruby' do
  code <<-EOH
    rbenv install #{node['provisioner']['ruby_version']}
    rbenv global #{node['provisioner']['ruby_version']}
    rbenv rehash
  EOH
  not_if "rbenv versions | grep #{node['provisioner']['ruby_version']}"
end

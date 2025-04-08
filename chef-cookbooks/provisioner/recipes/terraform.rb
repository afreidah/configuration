# #<
# Installs Terraform and Terragrunt using tfenv and the latest stable version of Terragrunt respectively.
# >

# Directory where Terraform will be installed
terraform_dir = platform?('mac_os_x') ? '/opt/homebrew/bin' : '/usr/local/bin'

# Install tfenv (Terraform version manager)
git "#{terraform_dir}/tfenv" do
  repository 'https://github.com/tfutils/tfenv.git'
  reference 'master'
  action :sync
  user node['provisioner']['user']
  group node['provisioner']['group']
  notifies :run, 'bash[install_tfenv]', :immediately
  not_if { platform?('mac_os_x') }
end

bash 'install_tfenv' do
  code <<-EOH
    export PATH="$PATH:#{terraform_dir}/tfenv/bin"
    if ! which tfenv > /dev/null; then
      echo "tfenv installed successfully!"
    fi
  EOH
  user node['provisioner']['user']
  group node['provisioner']['group']
  action :nothing
end

# Install Terraform using tfenv
execute 'install_terraform' do
  command "#{terraform_dir}/tfenv install 1.10.4" # Specify the desired version of Terraform here
  action :run
  not_if { ::File.exist?("#{terraform_dir}/terraform") }
  user node['provisioner']['user']
  group node['provisioner']['group']
end

# Ensure the correct version of Terraform is set globally with tfenv
execute 'set_terraform_version' do
  command "#{terraform_dir}/tfenv use 1.10.4" # Specify the desired version of Terraform here
  action :run
  user node['provisioner']['user']
  group node['provisioner']['group']
end

# Install Terragrunt (latest stable version)
bash 'install_terragrunt' do
  code <<-EOH
    TERRAGRUNT_VERSION="v0.39.0"  # Specify the desired version of Terragrunt here
    curl -L https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o #{terraform_dir}/terragrunt
    chmod +x #{terraform_dir}/terragrunt
  EOH
  user node['provisioner']['user']
  group node['provisioner']['group']
  not_if { ::File.exist?("#{terraform_dir}/terragrunt") }
end

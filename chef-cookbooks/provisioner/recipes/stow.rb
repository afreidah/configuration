# Description: use stow to restore config
# directories
bash 'restore_configs_with_stow' do
  code <<-EOH
    cd $HOME/config
    for i in nvim oh-my-zsh tmux zsh scripts; do
      echo "Restoring $i"
      stow -R $i
    done
  EOH
  action :run
end

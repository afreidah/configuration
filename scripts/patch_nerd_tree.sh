sed -i '' \
  's/^command! \(-complete=\)/command! -nargs=* \1/' \
  ~/.local/share/nvim/site/pack/packer/start/nerdtree-project-plugin/nerdtree_plugin/project.vim


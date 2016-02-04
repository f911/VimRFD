#/bin/bash

# initialization plugin system
git clone https://github.com/VundleVim/Vundle.vim.git ~/vimfile/bundle/Vundle.vim

# sysnc between gvim-on-windows and vim-on-msysy
mkdir ~/.vim && cp ~/vimfiles/vimrc ~/.vim/vimrc

# vim: se ai si sw=4 ts=4 ft=sh :
# EOF


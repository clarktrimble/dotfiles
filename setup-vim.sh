#!/bin/bash

ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/vimrc.bundles $HOME/.vimrc.bundles

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim -u $HOME/.vimrc.bundles +PluginInstall +PluginClean! +qa

ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig

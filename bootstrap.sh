#!/bin/sh

ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.config ~/.config
ln -s ~/.dotfiles/.brewfile ~/.brewfile
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

tap rcmdnk/file
brew brew-file
brew file install

mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes
cd ~/Library/Developer/Xcode/UserData/FontAndColorThemes
git clone https://github.com/joedynamite/base16-xcode Base16
ln -s Base16/* ./

./osx_preferences.sh


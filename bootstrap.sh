#!/bin/sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#
# # Download dotfiles
git clone git@github.com:simme/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.config ~/.config
ln -s ~/.dotfiles/.brewfile ~/.brewfile
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

brew tap rcmdnk/file
brew brew-file
brew file install

mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes
cd ~/Library/Developer/Xcode/UserData/FontAndColorThemes
git clone https://github.com/joedynamite/base16-xcode Base16
ln -s Base16/* ./

./~/.dotfiles/osx_preferences.sh

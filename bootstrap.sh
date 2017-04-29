#!/bin/sh

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/.atom ~/.atom
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
git pull && git submodule init && git submodule update && git submodule status
cp -R custom-themes/*.zsh-theme .oh-my-zsh/themes/
ln -s ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
brew install gnupg gpg2
gpg2 --recv-keys 7D2E1496
gpg2 --card-status
gpg2 --list-secret-keys

echo "Install GPGSuite for macOS https://gpgtools.org/"

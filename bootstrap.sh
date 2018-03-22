#!/bin/sh

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
git pull && git submodule init && git submodule update && git submodule status
cp -R custom-themes/*.zsh-theme .oh-my-zsh/themes/
ln -s ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
echo "Install GPGSuite for macOS https://gpgtools.org/"
read -n1 -r -p "Press space to continue..."
cp gpg.conf ~/.gnupg/
cp gpg-agent.conf ~/.gnupg/
cp sshcontrol ~/.gnupg/

chsh -s $(grep /zsh$ /etc/shells | tail -1)

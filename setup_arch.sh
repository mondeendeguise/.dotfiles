#!/bin/bash

# Install packages
pacman -Syu
pacman -S git tree zsh neovim tmux

# Enable sudo privileges for wheel group
set 's/# %wheel ALL=(ALL:ALL) ALL /%wheel ALL=(ALL:ALL) ALL' /etc/sudoers

# Add non-root user
read username
useradd -m -G wheel -s /bin/zsh $username
passwd $username

# Make symlinks to dotfiles repo
git clone https://github.com/mondeendeguise/dotfiles /home/$username
mkdir -p /home/$username/.config/
ln -s /home/$username/dotfiles/nvim /home/$username/.config/nvim
ln -s /home/$username/dofiles/.zshrc /home/$username/.zshrc
ln -s /home/$username/dotfiles/.gitconfig /home/$username/.gitconfig


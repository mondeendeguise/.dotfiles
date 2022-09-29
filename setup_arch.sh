#!/bin/bash

# Install packages
pacman -Syu
pacman -S git tree zsh neovim tmux wget base-devel docker

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Enable sudo privileges for wheel group
sed 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL' /etc/sudoers

# Add non-root user
read username
useradd -m -G wheel -s /bin/zsh $username
passwd $username

# Make symlinks to dotfiles repo
git clone https://github.com/mondeendeguise/dotfiles /home/$username
mkdir /home/$username/.config/
ln -s /home/$username/dotfiles/nvim /home/$username/.config/nvim
ln -s /home/$username/dofiles/.zshrc /home/$username/.zshrc
ln -s /home/$username/dotfiles/.gitconfig /home/$username/.gitconfig

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
/home/$username/.local/share/nvim/site/pack/packer/start/packer.nvim

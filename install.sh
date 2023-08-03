#!/bin/bash
config=~/.config
echo "copying bashrc"
cp ./.bashrc ~/.bashrc
echo "copying tmux.conf"
cp ./.tmux.conf ~/.tmux.conf
echo "copying contour config"
cp -r ./contour $config/contour
echo "copying zshrc"
cp ./.zshrc ~/.zshrc
echo "copying nvim config"
cp -r ./nvimrc $config/nvim

echo "copying oh-my-zsh"
cp -r ./.oh-my-zsh ~/.oh-my-zsh
echo "copying sway config"
cp -r ./sway $config/sway
echo "copying waybar config"
cp -r ./waybar $config/waybar
echo "copying ssh config"
cp ./ssh-config ~/.ssh/config

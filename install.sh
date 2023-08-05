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
echo "copying greetd config"
sudo rm -rf /etc/greetd
sudo cp -r /greetd /etc/greetd
sudo chown greeter /etc/greetd
sudo chown greeter /etc/greetd/*
sudo chown greeter /etc/greetd/wallpaper/*
echo "copying local binaries"
mkdir ~/.local
mkdir ~/.local/bin
cp -r ./bin/* ~/.local/bin/
chmod u+x ~/.local/bin/*

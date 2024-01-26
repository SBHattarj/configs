#!/bin/bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

config=~/.config
echo "linking bashrc"
ln -rsi $DIR/.bashrc ~/.bashrc
echo "linking tmux.conf"
ln -rsi $DIR/.tmux.conf ~/.tmux.conf
echo "linking contour config"
rm -rf $config/contour
ln -rsi $DIR/contour $config/contour
echo "linking zshrc"
rm -rf ~/.zshrc
ln -rsi $DIR/.zshrc ~/.zshrc
echo "linking nvim config"
rm -rf $config/nvim
ln -rsi $DIR/nvimrc $config/nvim

echo "linking oh-my-zsh"
rm -rf ~/.oh-my-zsh
ln -rsi $DIR/.oh-my-zsh ~/.oh-my-zsh
echo "linking sway config"
rm -rf ~/.config/sway
ln -rsi $DIR/sway $config/sway
echo "linking swaync config"
rm -rf ~/.config/swaync
ln -rsi $DIR/swaync $config/swaync
echo "linking waybar config"
rm -rf ~/.config/waybar
ln -rsi $DIR/waybar $config/waybar
echo "linking ssh config"
ln -rsi $DIR/ssh-config ~/.ssh/config
echo "linking ulauncher configs"
rm -rf ~/.config/ulauncher
ln -rsi $DIR/ulauncher $config/ulauncher
echo "linking local binaries"
mkdir ~/.local
mkdir ~/.local/bin
ln -rsi $DIR/bin ~/.local/bin
chmod u+x $DIR/bin/*

echo "copying greetd config"
sudo rm -rf /etc/greetd
sudo cp -r $DIR/greetd /etc/greetd
sudo chown greeter /etc/greetd/*
sudo chown greeter /etc/greetd/*
sudo chown greeter /etc/greetd/wallpaper/*
sudo cp $DIR/sway-run /usr/bin/sway-run

echo "copying sway-run"
sudo chmod a+x /usr/bin/sway-run

#!/bin/bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

config="$HOME/.config"
echo "linking bashrc"
ln -rsi "$DIR/.bashrc" "$HOME/.bashrc"
echo "linking tmux.conf"
ln -rsi "$DIR/.tmux.conf" "$HOME/.tmux.conf"
echo "linking contour config"
rm -rf "$config/contour"
ln -rsi "$DIR/contour" "$config/contour"
echo "linking zshrc"
rm -rf "$HOME/.zshrc"
ln -rsi "$DIR/.zshrc" "$HOME/.zshrc"
echo "linking nvim config"
rm -rf "$config/nvim"
ln -rsi "$DIR/nvimrc" "$config/nvim"
echo "linking rofi config"
rm -rf "$config/rofi"
ln -rsi "$DIR/rofi" "$config/rofi"

echo "linking oh-my-zsh"
rm -rf "$HOME/.oh-my-zsh"
ln -rsi "$DIR/.oh-my-zsh" "$HOME/.oh-my-zsh"
echo "linking sway config"
rm -rf "$HOME/.config/sway"
ln -rsi "$DIR/sway" "$config/sway"
echo "linking swaync config"
rm -rf "$HOME/.config/swaync"
ln -rsi "$DIR/swaync" "$config/swaync"
echo "linking waybar config"
rm -rf "$HOME/.config/waybar"
ln -rsi "$DIR/waybar" "$config/waybar"
echo "linking ssh config"
ln -rsi "$DIR/ssh-config" "$HOME/.ssh/config"
echo "linking ulauncher configs"
rm -rf "$HOME/.config/ulauncher"
ln -rsi "$DIR/ulauncher" "$config/ulauncher"
echo "linking gtk themes"
rm -rf "$HOME/.config/gtk-3.0"/* "$HOME/.config/gtk-4.0"/*
ln -rsi "$DIR/gtk-3.0-4.0-theme.css" "$HOME/.config/gtk-3.0/gtk.css"
ln -rsi "$DIR/gtk-3.0-4.0-theme.css" "$HOME/.config/gtk-4.0/gtk.css"
echo "linking local binaries"
mkdir "$HOME/.local"
rm -rf "$HOME/.local/bin"
ln -rsi "$DIR/bin" "$HOME/.local/bin"
rm -rf "$HOME/.vst3"
ln -rsi "$DIR/vst3" "$HOME/.vst3"
echo "linking wallpapers"
rm -rf "$HOME/wallpaper"
ln -rsi "$DIR/greetd/wallpaper" "$HOME/wallpaper"
echo "updating crontab"
crontab "$DIR/crontab"
chmod u+x "$DIR/bin/"*

echo "linking greetd config"
sudo rm -rf "/etc/greetd"
sudo mkdir "/etc/greetd"
sudo ln -rsi "$DIR/greetd/"* "/etc/greetd/"
sudo chgrp -R greeter "$DIR/greetd"
sudo chgrp greeter "$HOME"
sudo chmod g+x "$HOME"
sudo chgrp -R greeter "/etc/greetd"
sudo chmod -R g+rwX "$DIR/greetd"
sudo chmod -R g+rwX "/etc/greetd"
sudo ln -rsi $DIR/sway-run "/usr/bin/sway-run"

echo "copying sway-run"
sudo chmod a+x "/usr/bin/sway-run"

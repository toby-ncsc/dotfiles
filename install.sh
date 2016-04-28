#!/bin/bash

# Bootstrap a vanilla ubuntu machine

# Update the machine
apt-get update -y
apt-get upgrade -y

# Install core tools
apt-get install -y vim tmux git
apt-get install -y python-pip

# Install secondary tools
pip install powerline-status

# configure git 
git config --global user.name "Toby Wilkins"
git config --global user.email "tobwilk@gmail.com"
git config --global push.default simple

# Pull the git submodules
git submodule init
git submodule update

#symlink the files
DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf $DIR/.bashrc ~/.bashrc
ln -sf $DIR/.vimrc ~/.vimrc
ln -sfn $DIR/.vim ~/.vim
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sfn $DIR/.tmux ~/.tmux
ln -sf $DIR/tmuxme.sh ~/tmuxme.sh

# Install powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo fc-cache -vf

tmux source ~/.tmux.conf
source ~/.bashrc



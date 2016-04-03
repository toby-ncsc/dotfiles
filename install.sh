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
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sfn $DIR/.vim ~/.vim

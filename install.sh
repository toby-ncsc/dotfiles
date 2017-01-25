#!/bin/bash

# Bootstrap a vanilla ubuntu machine

# Update the machine
apt-get update -y
apt-get upgrade -y

# Install core tools
apt-get install -y vim git
apt-get install -y python-pip

# Install tmux v2
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get install -y tmux=2.0-1~ppa1~t

# Install stuff I like
sudo apt-get install -y tree

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

tmux source ~/.tmux.conf
source ~/.bashrc

# Now go into a tmux session, eg with 'tmux new -s main'
# inside, update plugins with 'ctrl-b I'

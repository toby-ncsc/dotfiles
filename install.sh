#!/bin/bash

# Bootstrap a vanilla ubuntu machine

# Get the current directory of this script wherever it was executed from
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Update the machine
sudo apt-get update -y
sudo apt-get upgrade -y

# Install core tools
sudo apt-get install -y vim git python3
sudo apt-get install -y python3-pip

# Install tmux v2
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get install -y tmux=2.0-1~ppa1~t

# Install stuff I like
sudo apt-get install -y tree
pip install httpie virtualenv

# create SSH keypair
mkdir ~/.ssh
#cd ~/.ssh
while true; do
    read -p "What email should be used for a new SSH key? " keyemail
    if [[ -n "$keyemail" ]]; then break; fi
done

ssh-keygen -t rsa -b 4096 -C $keyemail -f $HOME/.ssh/id_rsa
echo "The default key is: "
cat ~/.ssh/id_rsa.pub
echo "Copy this and register it on Github as a new key, then press any key"
read

# configure git 
if [ "$(git config --global --get user.email)" == "" ]; then
    read -p "What email address do you want to use for git commits? " gitemail
    git config --global user.email $gitemail
fi

if [ "$(git config --global --get user.name)" == "" ]; then
    read -p "What name do you want to use for git commits? " gitname
    git config --global user.email $gitname
fi

git config --global push.default simple

# Pull the git submodules
git submodule init
git submodule update

#symlink the files
DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf $DIR/.vimrc ~/.vimrc
ln -sfn $DIR/.vim ~/.vim
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sfn $DIR/.tmux ~/.tmux

ln -sf $DIR/tmux-createnew.sh ~/tmux-createnew.sh
ln -sf $DIR/tmuxme.sh ~/tmux-attatch.sh

ln -sf $DIR/cheatsheet.md ~/cheatsheet.md

tmux source ~/.tmux.conf
source ~/.bashrc

# Now go into a tmux session, eg with 'tmux new -s main'
# inside, update plugins with 'ctrl-b I'

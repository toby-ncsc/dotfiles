#!/bin/sh

#
# Install Powerline
#

apt-get install -y python-pip
pip install powerline-status

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/
fc-cache -vf /usr/share/fonts/

#
# symlink the vim files
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.vim ~/.vim


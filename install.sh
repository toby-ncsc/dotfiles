#!/bin/sh

# Install Powerline
apt-get install -y python-pip
pip install git+git://github.com/Lokaltog/powerline

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf /usr/share/fonts/

fc-cache -vf /usr/share/fonts/

mv 10-powerline-symbols.conf /etc/fonts/conf.d/

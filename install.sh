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

git config --global user.name "Toby Wilkins"
git config --global user.email "tobwilk@gmail.com"



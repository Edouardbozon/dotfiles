#!/bin/sh

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install yarn -y

# Yarn completion plugin
git clone https://github.com/buonomo/yarn-completion ~/.oh-my-zsh/custom/plugins/yarn-completion
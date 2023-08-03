#!/bin/bash 
echo "Install git g++ wget unzip"
apt-get update
apt-get install git build-essential wget unzip fontconfig -y 

echo "Install Nerd font"
# Clone the Nerd Fonts repository
cd $HOME
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
mdkir  ~/.local/share/fonts
unzip /tmp/Hack.zip -d ~/.local/share/fonts

# Reload your font cache
fc-cache -fv
cd $HOME


#!/bin/bash
pushd $(pwd)
mkdir -p $HOME/.prebuilt/neovim
mkdir -p $HOME/.prebuilt/bin

if ! test -e $HOME/.prebuilt/neovim/nvim.appimage; then
wget -P $HOME/.prebuilt/neovim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
fi

cd $HOME/.prebuilt
chmod +x neovim/nvim.appimage

cd bin && ln -s ../neovim/nvim.appimage vim 

if [[ "$SHELL" == "bash" ]]; then
echo "if [[ ! $PATH == $HOME/.prebuilt/bin ]]; then export PATH="$HOME/.prebuilt/bin:$PATH" fi" >> $HOME/.bashrc
source $HOME/.bashrc
elif [[ "$SHELL" == "zsh" ]]; then
echo "if [[ ! $PATH == $HOME/.prebuilt/bin ]]; then export PATH="$HOME/.prebuilt/bin:$PATH" fi" >> $HOME/.zshrc
source $HOME/.zshrc
fi

popd

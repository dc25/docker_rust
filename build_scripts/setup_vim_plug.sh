#! /bin/bash



sudo apt-get update 

sudo apt-get install -y \
    git 


# install vim-plug per https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


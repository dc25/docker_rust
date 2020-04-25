#! /bin/bash

if [[ -x `which nvim` ]]; then
    nvim +PlugInstall +UpdateRemotePlugins +qa
fi

if [[ -x `which vim` ]]; then
    vim +PlugInstall +qa
fi


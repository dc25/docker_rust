#! /bin/bash



sudo apt update -y
sudo apt upgrade -y
sudo apt install -y libxcb-dri3-dev
sudo apt install -y libdrm-dev
sudo apt install -y libgbm-dev

# export VSC_EXTENSIONS='rust-lang.rust vadimcn.vscode-lldb'
export VSC_EXTENSIONS='vadimcn.vscode-lldb'

for s in $VSC_EXTENSIONS; do
    code --install-extension $s
done




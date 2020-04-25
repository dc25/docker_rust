#! /bin/bash

export VSC_EXTENSIONS='rust-lang.rust vadimcn.vscode-lldb'
# export VSC_EXTENSIONS='vadimcn.vscode-lldb'

for s in $VSC_EXTENSIONS; do
    code --install-extension $s
done




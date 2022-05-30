#! /bin/bash 
export DEBIAN_FRONTEND=noninteractive

./install_rust.sh
./install_rust_helpers.sh
./install_mold.sh
./install_rust_gtk_dev.sh
./install_rust-analyzer.sh
./setup_vscode_debugging.sh
./setup_home.sh

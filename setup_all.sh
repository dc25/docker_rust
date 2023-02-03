#! /bin/bash 
export DEBIAN_FRONTEND=noninteractive

~/logged_setup.sh ./install_rust.sh
~/logged_setup.sh ./install_rust_helpers.sh
~/logged_setup.sh ./install_mold.sh
~/logged_setup.sh ./install_rust_gtk_dev.sh
~/logged_setup.sh ./install_latest_node.sh
~/logged_setup.sh ./install_rust-analyzer.sh
~/logged_setup.sh ./setup_vscode_debugging.sh
~/logged_setup.sh ./install_lunarvim.sh
~/logged_setup.sh ./setup_home.sh

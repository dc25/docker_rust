#! /bin/bash

echo "installing rust"
curl -L https://sh.rustup.rs      | sh -s -- -y --default-toolchain=stable
# curl   -L https://sh.rustup.rs -sSf | sh -s -- -y 
source ~/.cargo/env


###########################################################################
# While building on virtualbox got error in install_rust_helpers.sh :
#
#        error: no default toolchain configured
#
# adding the following two commands seemed to fix it:
#
rustup install stable
rustup default stable
#
# Thank you: https://stackoverflow.com/a/46864309
#
###########################################################################


##-- rustup target add asmjs-unknown-emscripten
##-- rustup target add wasm32-unknown-emscripten

### echo "installing vim plugin for rust"
### git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim

### echo "installing emscripten with sdk"
### cd 
##-- sudo apt-get install -y cmake build-essential
##-- curl -O https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
##-- tar -xzf emsdk-portable.tar.gz
##-- source emsdk-portable/emsdk_env.sh
##-- emsdk update
##-- emsdk install sdk-incoming-64bit
##-- emsdk activate sdk-incoming-64bit

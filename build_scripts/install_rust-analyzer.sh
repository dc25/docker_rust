#! /bin/bash

# NOTE 2020-03-02:  
# This evening tried both rust-analyzer and rls/rust-lang.rust
# The latter seemed to give more useful messages so sticking with it for now.


# rust-analyser suggested here: https://www.reddit.com/r/rust/comments/fbrxxs/suggested_vscode_extensions/

source ~/.cargo/env

./install_npm.sh

# per instructions here: https://github.com/rust-analyzer/rust-analyzer

# clone the repo
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer

# install both the language server and VS Code extension
cargo xtask install




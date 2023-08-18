#! /bin/bash

# NOTE 2020-03-02:  
# This evening tried both rust-analyzer and rls/rust-lang.rust
# The latter seemed to give more useful messages so sticking with it for now.


# rust-analyser suggested here: https://www.reddit.com/r/rust/comments/fbrxxs/suggested_vscode_extensions/

. ~/.cargo/env


# npm needed for installation of rust-analyzer
# doing this in separate script to ensure that correct version gets detected by this script.

cd /tmp

# per instructions here: https://github.com/rust-analyzer/rust-analyzer

rm -rf rust-analyzer
# clone the repo
git clone https://github.com/rust-analyzer/rust-analyzer 
cd rust-analyzer

# install both the language server and VS Code extension
cargo xtask install

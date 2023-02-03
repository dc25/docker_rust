#! /bin/bash

echo hit1
sudo apt-get install -y pkg-config libssl-dev

echo hit2
. ~/.cargo/env

## per https://stackoverflow.com/questions/37706999/error-installing-a-crate-via-cargo-specified-package-has-no-binaries
echo hit3
which cargo
echo hit3a
# $HOME/.cargo/bin/cargo install cargo-edit
# cargo clean
# echo hit3b
cargo install cargo-edit

echo hit4
rustup component add clippy
echo hit5
rustup component add rustfmt


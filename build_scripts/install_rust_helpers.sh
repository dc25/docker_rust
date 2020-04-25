#! /bin/bash

sudo apt-get install -y pkg-config libssl-dev

source ~/.cargo/env

## per https://stackoverflow.com/questions/37706999/error-installing-a-crate-via-cargo-specified-package-has-no-binaries
cargo install cargo-edit

rustup component add clippy
rustup component add rustfmt


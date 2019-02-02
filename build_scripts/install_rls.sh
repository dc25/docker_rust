#! /bin/bash

source ~/.cargo/env

## per https://github.com/rust-lang/rls
rustup component add rls 
rustup component add rust-analysis 
rustup component add rust-src

## per https://github.com/racer-rust/racer
# cargo install racer


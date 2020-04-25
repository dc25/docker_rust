#! /bin/bash

source ~/.cargo/env

export PROJECT=count_the_coins

cd ~

cargo init $PROJECT

cd $PROJECT

cat > src/main.rs << ALLDONE
fn make_change(coins: &[usize], cents: usize) -> usize {
    let size = cents + 1;
    let mut ways = vec![0; size];
    ways[0] = 1;
    for &coin in coins {
        for amount in coin..size {
            ways[amount] += ways[amount - coin];
        }
    }
    ways[cents]
}
 
fn main() {
    println!("{}", make_change(&[1,5,10,25], 100));
    println!("{}", make_change(&[1,5,10,25,50,100], 100_000));
}
ALLDONE

export VSC_EXTENSIONS='rust-lang.rust vadimcn.vscode-lldb'
# export VSC_EXTENSIONS='vadimcn.vscode-lldb'

for s in $VSC_EXTENSIONS; do
    code --install-extension $s
done




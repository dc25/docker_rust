#This script gets called from .bashrc whenever a shell starts.
# Edit to suit your own tastes.


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v=vim
alias pyser='python -m SimpleHTTPServer'
alias cdgnc='cd /repos/gitnc'
alias cdgit='cd /repos/git'

function nixextras
{
    nix-env -f "<nixpkgs>" -iA haskellPackages.ghc-mod
    nix-env -f "<nixpkgs>" -iA haskellPackages.hdevtools            
    nix-env -f "<nixpkgs>" -iA haskellPackages.hlint 
    nix-env -f "<nixpkgs>" -iA haskellPackages.hindent
}

function rebu
{
    find . -type f -name '*.hs' | xargs ls | entr sh -c 'echo;echo;echo;echo;echo;ghcjs -DGHCJS_GC_INTERVAL=60000 Main.hs; echo done'
}


function rebc
{
    find . -type f -name '*.hs' | xargs ls | entr sh -c 'echo;echo;echo;echo;echo;ghc Main.hs; echo done'
}



# cd /repos/gitnc/reflex-platform14-2016-12-11-cab7dd8939836a16d91b3d56405e2b6c772a2172
# cd /repos/gitnc/reflex-platform15-2017-01-05-cab7dd8939836a16d91b3d56405e2b6c772a2172
# cd /repos/gitnc/reflex-platform16-2017-01-18-80a3bec3fb4d755bc40c1db6fde21fb685528ece
# cd /repos/gitnc/reflex-platform17-2017-01-22-0de88ce3a17fc47353111150ba86a91159fe2cb6
#cd /repos/gitnc/reflex-platform18-2017-02-28-824e979768798ae9089cffdf54548c34fe391648
#cd /repos/gitnc/reflex-platform19-2017-07-01-fe95713153ebd4e0a97ac8caabbcf7bb1a951bb6
#cd /repos/gitnc/reflex-platform20-2017-07-29-b7c00b3574d0ef42974eda0f2812c794c7b5d4f3
cd /repos/gitnc/reflex-platform23-2017-11-02-292ae334bdb9178245af96d26688df7bf3532849

#! /bin/bash 

echo "installing nix build system"
curl https://nixos.org/nix/install | sh

. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -i cabal2nix

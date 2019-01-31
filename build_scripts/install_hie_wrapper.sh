#! /bin/bash

. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA cachix -f https://cachix.org/api/v1/install

cachix use hie-nix

nix-env -iA hies -f https://github.com/domenkozar/hie-nix/tarball/master



#! /bin/bash 

. /workarea/.nix-profile/etc/profile.d/nix.sh

nix-env -i cabal2nix
cd
mkdir app && touch app/{Main.hs,app.cabal,default.nix,app.nix} 

cd app

cat > app.cabal << DONE
name:                app
version:             0.1.0.0
synopsis:            First miso app
category:            Web
build-type:          Simple
cabal-version:       >=1.10

executable app
  main-is:             Main.hs
  build-depends:       base, miso
  default-language:    Haskell2010
DONE

cabal2nix . --compiler ghcjs > app.nix

cat > default.nix << DONE
{ pkgs ? import ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "a0aeb23";
    sha256 = "04dgg0f2839c1kvlhc45hcksmjzr8a22q1bgfnrx71935ilxl33d";
  }){}
}:
let
  result = import (pkgs.fetchFromGitHub {
    owner = "dmjio";
    repo = "miso";
    sha256 = "1l1gwzzqlvvcmg70jjrwc5ijv1vb6y5ljqkh7rxxq7hkyxpjyx9q";
    rev = "95f6bc9b1ae6230b110358a82b6a573806f272c2";
  }) {};
in pkgs.haskell.packages.ghcjs.callPackage ./app.nix {
  miso = result.miso-ghcjs;
}
DONE

cat > Main.hs << DONE
main = print "Hello"
DONE

mkdir -p ~/.config/nixpkgs
cat > ~/.config/nixpkgs/config.nix << DONE
{ allowUnfree = true; }
DONE

nix-build

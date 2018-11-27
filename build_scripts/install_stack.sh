#! /bin/bash 

sudo apt-get install -y libtinfo-dev --fix-missing

echo "installing stack build system"
curl -sSL https://get.haskellstack.org/ | sh

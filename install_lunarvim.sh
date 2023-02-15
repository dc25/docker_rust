#! /bin/bash

source ~/.cargo/env

# pip, cargo, npm all needed for lunarvim; cargo & npm should already be installed.
sudo apt-get install  -y python3 python3-pip

INSTALL=/tmp/install.sh
curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh > $INSTALL
chmod +x $INSTALL
$INSTALL -y

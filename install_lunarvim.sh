#! /bin/bash

source ~/.cargo/env

# pip, cargo, npm all needed for lunarvim; cargo & npm should already be installed.
# sudo apt-get install  -y python3 python3-pip
cd /tmp

yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#! /bin/bash

# next line is pretty much from old version of ./install-build-deps.sh 
# new version seems to leave clang out .   Including others just in case.
sudo apt-get install -y build-essential g++ cmake libssl-dev zlib1g-dev pkg-config clang


## per: https://github.com/rui314/mold

cd /tmp
rm -rf mold
git clone https://github.com/rui314/mold.git
mkdir mold/build
cd mold/build
git checkout v1.10.1
sudo ../install-build-deps.sh
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ ..
cmake --build . -j $(nproc)
sudo cmake --install .

mkdir -p ~/.cargo
cd ~/.cargo
cat > config.toml.mold << END
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/usr/local/bin/mold"]
END

# cp config.toml.mold config.toml

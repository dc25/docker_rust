#! /bin/bash
## per: https://github.com/rui314/mold

rm -rf /tmp/mold
cd /tmp
git clone https://github.com/rui314/mold.git
cd mold
git checkout v1.3.1

# sudo ./install-build-deps.sh 
# next line is pretty much from ./install-build-deps.sh but script had trouble recognizing machine type
sudo apt-get install -y build-essential g++ cmake libssl-dev zlib1g-dev pkg-config clang

make -j$(nproc) CXX=clang
sudo make install

mkdir -p ~/.cargo
cd ~/.cargo
cat > config.toml.mold << END
[target.x86_64-unknown-linux-gnu]
linker = "clang"
rustflags = ["-C", "link-arg=-fuse-ld=/usr/local/bin/mold"]
END

cp config.toml.mold config.toml



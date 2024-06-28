cd /workspaces/botan
./configure.py --os=linux --cpu=aarch64 \
--cc-bin=/workspaces/udphop/arm64/bin/aarch64-linux-musl-g++ \
--ar-command=/workspaces/udphop/arm64/bin/aarch64-linux-musl-ar
make 

sudo ln -s /workspaces/botan/libbotan-3.a /workspaces/udphop/arm64/lib/
sudo ln -s /workspaces/botan/libbotan-3.so.4 /workspaces/udphop/arm64/lib/libbotan-3.so
sudo ln -s //workspaces/botan/build/include/public/botan /workspaces/udphop/arm64/include/botan
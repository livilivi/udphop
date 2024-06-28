apk update 
apk add --no-cache libstdc++ asio asio-dev botan-libs botan-dev botan3-libs cmake llvm clang
apk add fish starship atuin

# ------------------------- sysroot---------------------------------
mkdir arm64

# # linaro prebuild sysroot(gnu8 not found,cpp20 require)
# curl -sSfL https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/sysroot-glibc-linaro-2.25-2019.12-aarch64-linux-gnu.tar.xz |\
# xz -d | tar --strip-components=1 -xf - -C /workspaces/udphop/arm64

# # sysroot from Android NDK(include:cpp4.9.x)
# curl -sfL https://dl.google.com/android/repository/android-ndk-r26d-linux.zip | unzip -d /tmp/ 
# ls -al /tmp/a26ndk/android-ndk-r26d/toolchains/llvm/prebuilt/linux-x86_64/
# ln -s /tmp/a26ndk/android-ndk-r26d/toolchains/llvm/prebuilt/linux-x86_64 /workspaces/udphop/arm64

# # sysroot from developer.arm.com (missing libssp_nonshared) 
# curl -sfL https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz | \
# xz -d | tar --strip-components=2 -C /workspaces/udphop/arm64 -xf - arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu

# # sysroot from musl.cc
curl -sfL https://musl.cc/aarch64-linux-musl-cross.tgz| \
tar --strip-components=1 -C /workspaces/udphop/arm64 -xzf -

# https://github.com/ClickHouse/sysroot


# ------------------------------------ test cpp20-----------------------------
# sysroot from developer.arm.com
# clang++ -target aarch64-none-linux-gnu \
# --sysroot=/workspaces/udphop/arm64/ \
# -I/workspaces/udphop/arm64/include/c++/13.2.1/ \
# -I/workspaces/udphop/arm64/include/c++/13.2.1/aarch64-none-linux-gnu \
# -fuse-ld=lld -stdlib=libc++ \
# -o hello hello20.cpp -lz --verbose
# sysroot from musl.cc
# clang++ -target aarch64-linux-musl \
# --sysroot=/workspaces/udphop/arm64 \
# -fuse-ld=lld -static \
# -o hello hello20.cpp --verbose

#------------------------------- download botan-3|asio------------------

mkdir /workspaces/botan
curl -sfL https://botan.randombit.net/releases/Botan-3.4.0.tar.xz |\
xz -d | tar --strip-components=1 -C /workspaces/botan -xf -

mkdir /workspaces/asio
curl -sfL https://download.sourceforge.net/project/asio/asio/1.30.2%20%28Stable%29/asio-1.30.2.tar.gz |\
tar --strip-components=1 -C /workspaces/asio -xzf -

sudo ln -s /workspaces/asio/include/asio /workspaces/udphop/arm64/include/asio
sudo ln -s /workspaces/asio/include/asio.hpp /workspaces/udphop/arm64/include/asio.hpp


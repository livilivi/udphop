apk update 
apk add --no-cache libstdc++ asio asio-dev botan-libs botan-dev botan3-libs cmake llvm clang
apk add fish starship atuin


mkdir arm64

# linaro prebuild sysroot(gnu8 not found,cpp20 require)
# curl -sSfL https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/sysroot-glibc-linaro-2.25-2019.12-aarch64-linux-gnu.tar.xz |\
# xz -d | tar --strip-components=1 -xf - -C ./arm64

# sysroot from Android NDK(include:cpp4.9.x)
# curl -sfL https://dl.google.com/android/repository/android-ndk-r26d-linux.zip | unzip -d /tmp/ 
# ls -al /tmp/a26ndk/android-ndk-r26d/toolchains/llvm/prebuilt/linux-x86_64/
# ln -s /tmp/a26ndk/android-ndk-r26d/toolchains/llvm/prebuilt/linux-x86_64 /workspaces/udphop/arm64

# from developer.arm.com
curl -sfL https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz | \
xz -d | tar --strip-components=2 -C ./arm64 -xf - arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu

# musl.cc
# https://github.com/ClickHouse/sysroot

# clang++ -target aarch64-linux-gnu \
# --sysroot=/workspaces/udphop/arm64/ \
# -I/workspaces/udphop/arm64/include/c++/13.2.1/ \
# -I/workspaces/udphop/arm64/include/c++/13.2.1/aarch64-none-linux-gnu \
# -fuse-ld=lld -stdlib=libc++ \
# -o hello hello20.cpp -lz --verbose
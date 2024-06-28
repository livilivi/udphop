set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# set(triple aarch64-none-linux-gnu)
# set(CMAKE_SYSROOT /tmp/arm64)
# set(CMAKE_SYSROOT /workspaces/udphop/arm64/libc)

set(triple aarch64-linux-musl)
set(CMAKE_SYSROOT /workspaces/udphop/arm64)
# set(CMAKE_SYSROOT /tmp/aarch64-linux-musl-cross) 

set(CMAKE_C_COMPILER clang)
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CXX_COMPILER_TARGET ${triple})

# set(CMAKE_AR llvm-ar)
# set(CMAKE_LINKER ld.lld)
set(CMAKE_LINKER_TYPE LLD)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_COMPILER_ID Clang)
set(CMAKE_CXX_COMPILER_ID Clang)

set(DCMAKE_CROSSCOMPILING True)
set(DLLVM_DEFAULT_TARGET_TRIPLE ${triple})
set(DLLVM_TARGET_ARCH aarch64)
set(DLLVM_TARGETS_TO_BUILD aarch64)
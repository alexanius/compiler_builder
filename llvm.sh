#!/bin/bash

# This file is for biulding LLVM compiler and tools

if [ $LLVM_DOWNLOAD_SOURCES = "yes" ]
then
    echo "Start downloading llvm archives"
    e "mkdir -p \"$LLVM_ARCHIVE_DIR\""
    e "pushd  \"$LLVM_ARCHIVE_DIR\" > /dev/null"

    download "$LLVM_DOWNLOAD_URL"

    if [ $LLVM_WITH_CFE = "yes" ]
    then
        download "$CFE_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LLD = "yes" ]
    then
        download "$LLD_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LLDB = "yes" ]
    then
        download "$LLDB_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_POLLY = "yes" ]
    then
        download "$POLLY_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_COMPILER_RT = "yes" ]
    then
        download "$COMPILER_RT_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LIBOPENMP = "yes" ]
    then
        download "$LIBOPENMP_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LIBUNWIND = "yes" ]
    then
        download "$LIBUNWIND_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LIBCXX = "yes" ]
    then
        download "$LIBCXX_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_LIBCXXABI = "yes" ]
    then
        download "$LIBCXXABI_DOWNLOAD_URL"
    fi

    if [ $LLVM_WITH_CLANG_TOOLS_EXTRA = "yes" ]
    then
        download "$CLANG_TOOLS_EXTRA_DOWNLOAD_URL"
    fi

    e "popd > /dev/null" # $LLVM_ARCHIVE_DIR

    echo "Finish downloading llvm archives"
fi

if [ $LLVM_UNPACK_SOURCES = "yes" ]
then
    echo "Start unpacking llvm archives"
    e "mkdir -p \"$LLVM_SRC_DIR\""
    e "pushd  \"$LLVM_SRC_DIR\" > /dev/null"

    unpack "$LLVM_ARCHIVE_PATH" "llvm-$LLVM_VERSION.src"

    e "pushd  \"$LLVM_UNPACK_SRC_DIR\" > /dev/null"

    e "pushd tools > /dev/null"

    if [ $LLVM_WITH_CFE = "yes" ]
    then
    	unpack "$CFE_ARCHIVE_PATH" "clang"
    fi

    if [ $LLVM_WITH_LLD = "yes" ]
    then
        unpack "$LLD_ARCHIVE_PATH" "lld"
    fi

    if [ $LLVM_WITH_LLDB = "yes" ]
    then
        unpack "$LLDB_ARCHIVE_PATH" "lldb"
    fi

    if [ $LLVM_WITH_POLLY = "yes" ]
    then
        unpack "$POLLY_ARCHIVE_PATH" polly
    fi

    if [ $LLVM_WITH_CLANG_TOOLS_EXTRA = "yes" ]
    then
        unpack "$CLANG_TOOLS_EXTRA_ARCHIVE_PATH" extra
    fi

    e "popd > /dev/null" # tools

    e "pushd runtimes > /dev/null"

    if [ $LLVM_WITH_LIBUNWIND = "yes" ]
    then
        unpack "$LIBUNWIND_ARCHIVE_PATH" libunwind
    fi

    e "popd > /dev/null" # runtimes

    e "pushd projects > /dev/null"

    if [ $LLVM_WITH_COMPILER_RT = "yes" ]
    then
        unpack "$COMPILER_RT_ARCHIVE_PATH" compiler-rt
    fi

    if [ $LLVM_WITH_LIBOPENMP = "yes" ]
    then
        unpack "$LIBOPENMP_ARCHIVE_PATH" openmp
    fi

    if [ $LLVM_WITH_LIBCXX = "yes" ]
    then
        unpack "$LIBCXX_ARCHIVE_PATH" libcxx
    fi

    if [ $LLVM_WITH_LIBCXXABI = "yes" ]
    then
        unpack "$LIBCXXABI_ARCHIVE_PATH" libcxxabi
    fi

    e "popd > /dev/null" # projects

    e "popd > /dev/null" # $LLVM_UNPACK_SRC_DIR

    e "popd > /dev/null" # $LLVM_SRC_DIR

    echo "Finish unpacking llvm archives"
fi

if [ $LLVM_BUILD_COMPILER = "yes" ]
then
    e "mkdir -p \"$LLVM_OBJ_DIR\""
    e "pushd \"$LLVM_OBJ_DIR\" > /dev/null"

    echo "Start configurating compiler"

    if [ $LLVM_BUILD_CROSS = "no" ]
    then
        # Here we will configure a native compiler
        e "cmake -G \"$LLVM_BUILD_SYSTEM\" -DCMAKE_C_COMPILER=\"$HOST_CC\" -DCMAKE_CXX_COMPILER=\"$HOST_CPP\" -DCMAKE_INSTALL_PREFIX=\"$LLVM_INSTALL_DIR\" -DCMAKE_BUILD_TYPE=$LLVM_BUILD_TYPE -DCMAKE_C_FLAGS=\"$LLVM_HOST_CC_OPT_FLAGS\" -DCMAKE_CXX_FLAGS=\"$LLVM_HOST_CPP_OPT_FLAGS\" -DLLVM_ENABLE_THREADS=$LLVM_ENABLE_THREADS -DLLVM_PARALLEL_COMPILE_JOBS=$BUILD_THREADS_NUMBER -DLLVM_PARALLEL_LINK_JOBS=$BUILD_THREADS_NUMBER \"$LLVM_UNPACK_SRC_DIR\""
    else
        echo "Yet I can not build LLVM cross-compiler"
	exit 1
#e "cmake -G \"$LLVM_BUILD_SYSTEM\" -DCMAKE_C_COMPILER=\"$HOST_CC\" -DCMAKE_AR=\"$HOST_AR\" -DCMAKE_RANLIB=\"$HOST_RANLIB\" -DCMAKE_CXX_COMPILER=\"$HOST_CPP\" -DCMAKE_FIND_ROOT_PATH=\"$PREFIX_GCC/bin/:$PREFIX_GCC/$TARGET/:$PREFIX_GCC/$TARGET/lib\" -DCMAKE_INSTALL_PREFIX=\"$PREFIX_LLVM\" -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=\"$OPT_FLAGS\" -DCMAKE_CXX_FLAGS=\"$OPT_FLAGS\" -DLLVM_ENABLE_THREADS=True -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_CXX1Y=On -DLLVM_PARALLEL_COMPILE_JOBS=$MAKE_THREADS -DLLVM_PARALLEL_LINK_JOBS=$MAKE_THREADS -DCMAKE_CROSSCOMPILING=True -DLLVM_TARGET_ARCH=$LLVM_TARGET_ARCH -DLLVM_TARGETS_TO_BUILD=$LLVM_TARGET_ARCH -DLLVM_ENABLE_PIC=On \"$LLVM_SRC\""
#e "cmake --build . --target install -- -j$MAKE_THREADS"
    fi

    echo "Finish configurating compiler"

    echo "Start building compiler"

    e "cmake --build ."

    echo "Finish building compiler"

    e "popd > /dev/null" # $LLVM_OBJ_DIR
fi

if [ $LLVM_BUILD_COMPILER = "yes" ]
then
    e "mkdir -p \"$LLVM_OBJ_DIR\""
    e "pushd \"$LLVM_OBJ_DIR\" > /dev/null"

    echo "Start installing compiler"

    e "cmake --target install ."

    echo "Finish installing compiler"

    e "popd > /dev/null" # $LLVM_OBJ_DIR
fi

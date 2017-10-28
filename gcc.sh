#!/bin/bash

# This file is for biulding GCC compiler and tools

if [ $GCC_DOWNLOAD_SOURCES = "yes" ]
then
    e "echo \"Start downloading gcc archives\""
    e "mkdir -p \"$GCC_ARCHIVE_DIR\""
    e "pushd  \"$GCC_ARCHIVE_DIR\" > /dev/null"

    download "$GCC_DOWNLOAD_URL"

    e "popd > /dev/null" # $GCC_ARCHIVE_DIR

    e "echo \"Finish downloading gcc archives\""

fi

if [ $GCC_UNPACK_SOURCES = "yes" ]
then
    e "echo \"Start unpacking gcc archives\""
    e "mkdir -p \"$GCC_SRC_DIR\""
    e "pushd  \"$GCC_SRC_DIR\" > /dev/null"

    unpack "$GCC_ARCHIVE_PATH" "gcc-$GCC_VERSION.src"

    e "popd > /dev/null" # $GCC_SRC_DIR

    e "echo \"Finish unpacking gcc archives\""
fi

if [ $GCC_BUILD_COMPILER = "yes" ]
then
    e "mkdir -p \"$GCC_OBJ_DIR\""
    e "pushd \"$GCC_OBJ_DIR\" > /dev/null"

    echo "Start configurating compiler"

    if [ $GCC_BUILD_CROSS = "no" ]
    then
        # Here we will configure a native compiler
	e "$GCC_UNPACK_SRC_DIR/configure --prefix=\"$GCC_INSTALL_DIR\" --enable-languages=$GCC_LANGUAGES --enable-gold=yes --enable-ld=yes --enable-lto CFLAGS=\"$GCC_HOST_CC_OPT_FLAGS\" CXXFLAGS=\"$GCC_HOST_CPP_OPT_FLAGS\""
    else
        echo "Yet I can not build GCC cross-compiler"
	exit 1
    fi

    echo "Finish configurating compiler"

    echo "Start building compiler"

    e "make -j$BUILD_THREADS_NUMBER "

    echo "Finish building compiler"

    e "popd > /dev/null" # $GCC_OBJ_DIR
fi

if [ $GCC_INSTALL_COMPILER = "yes" ]
then
    e "mkdir -p \"$GCC_OBJ_DIR\""
    e "pushd \"$GCC_OBJ_DIR\" > /dev/null"

    echo "Start installing compiler"

    e "make install"

    echo "Finish installing compiler"

    e "popd > /dev/null" # $GCC_OBJ_DIR
fi

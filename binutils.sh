#!/bin/bash

# This file is for biulding project build

if [ $BINUTILS_DOWNLOAD_SOURCES = "yes" ]
then
    e "echo \"Start downloading binutils archives\""
    e "mkdir -p \"$BINUTILS_ARCHIVE_DIR\""
    e "pushd  \"$BINUTILS_ARCHIVE_DIR\" > /dev/null"

    download "$BINUTILS_DOWNLOAD_URL"

    e "popd > /dev/null" # $BINUTILS_ARCHIVE_DIR

    e "echo \"Finish downloading binutils archives\""
fi

if [ $BINUTILS_UNPACK_SOURCES = "yes" ]
then
    e "echo \"Start unpacking binutils archives\""
    e "mkdir -p \"$BINUTILS_SRC_DIR\""
    e "pushd  \"$BINUTILS_SRC_DIR\" > /dev/null"

    unpack "$BINUTILS_ARCHIVE_PATH" "binutils-$BINUTILS_VERSION.src"

    e "popd > /dev/null" # $BINUTILS_SRC_DIR

    e "echo \"Finish unpacking binutils archives\""
fi

if [ $BINUTILS_BUILD_COMPILER = "yes" ]
then
    e "mkdir -p \"$BINUTILS_OBJ_DIR\""
    e "pushd \"$BINUTILS_OBJ_DIR\" > /dev/null"

    echo "Start configurating compiler"

	e "$BINUTILS_UNPACK_SRC_DIR/configure --prefix=\"$BINUTILS_INSTALL_DIR\" --enable-gold --enable-ld --enable-lto CFLAGS=\"$BINUTILS_HOST_CC_OPT_FLAGS\" CXXFLAGS=\"$BINUTILS_HOST_CPP_OPT_FLAGS\""


    echo "Finish configurating compiler"

    echo "Start building compiler"

    e "make -j$BUILD_THREADS_NUMBER "

    echo "Finish building compiler"

    e "popd > /dev/null" # $BINUTILS_OBJ_DIR
fi

if [ $BINUTILS_INSTALL_COMPILER = "yes" ]
then
    e "mkdir -p \"$BINUTILS_OBJ_DIR\""
    e "pushd \"$BINUTILS_OBJ_DIR\" > /dev/null"

    echo "Start installing compiler"

    e "make install"

    echo "Finish installing compiler"

    e "popd > /dev/null" # $BINUTILS_OBJ_DIR
fi

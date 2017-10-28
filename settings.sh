#!/bin/bash

# This is start settings file for compiler-building script. Here you can set
# all the variables and choose what you want to compile

##----------------- Tasks variables

# Here you can set all the actions you want to do
# Possible values are "yes" and "no"
# All the variables are derived by concrete compiler variables
# For example for LLVM there is a variable"
# LLVM_DOWNLOAD_SOURCE="$DOWNLOAD_SOURCES"

# Should we download source file from the internet
# The sources will be downloaded to the directory $GENERAL_SRC_DIR
DOWNLOAD_SOURCES="no"

# Should we unpack archieves with sources. Archives are located
# in the $GENERAL_SRC_DIR
UNPACK_SOURCES="yes"

# Should we build the compiler (configure && make)
BUILD_COMPILERS="yes"

# Should we install compilers (make install)
INSTALL_COMPILERS="yes"

##----------------- Environment variables

# Util for downlading sources
WGET="wget"

# Util for archieve unpacking
TAR="tar"

# This is path for host gcc compiler that will be used for building all
# other cross-compilers. If you want just a native build this variable
# should be set to "/usr"
HOST_GCC_DIR="/usr"

# This is host C compiler that will build your custom compiler
HOST_CC="$HOST_GCC_DIR/bin/gcc"

# This is host C++ compiler that will build your custom compiler
HOST_CPP="$HOST_GCC_DIR/bin/g++"

# This is host archiver that will build your custom compiler
HOST_AR="$HOST_GCC_DIR/bin/ar"

# This is host ranlib
HOST_RANLIB="$HOST_GCC_DIR/bin/ranlib"

# This is directory where plugin-api.h
# It is needed for llvm ltoplugin
HOST_BINUTILS_INCLUDE="$HOST_GCC_DIR/include"

##----------------- General paths

# Here is root directory for all object files generated during compilation
# This variable used only to define llvm and gcc obj dirs
OBJ_GENERAL_DIR="/tmp"

# Here is root directory for all the source files needed for building
GENERAL_SRC_DIR="`getent passwd $USER | cut -d: -f6`/Downloads"

# Here is root directory to install compilers
GENERAL_INSTALL_DIR="/opt"

# File with all executed lines output
LOG_FILE="`pwd`/log"

##----------------- General build options

# Glags for host C compiler
HOST_CC_OPT_FLAFS="-O2"

# Glags for host C++ compiler
HOST_CPP_OPT_FLAFS="-O2"

# Parameter for threads of parallel building
BUILD_THREADS_NUMBER="8"

# Should we do anything with binutils
WORK_WITH_BINUTILS="no"

# Should we do anything with gcc
WORK_WITH_GCC="no"

# Should we do anything with llvm
WORK_WITH_LLVM="yes"

##----------------- BINUTILS special variables

# BINUTILS site is here: https://www.gnu.org/software/binutils/

# Version of GCC to be downloaded and installed
BINUTILS_VERSION="2.29"

# Should we download the BINUTILS sources
BINUTILS_DOWNLOAD_SOURCES="$DOWNLOAD_SOURCES"

# Should we unpack the BINUTILS sources
BINUTILS_UNPACK_SOURCES="$UNPACK_SOURCES"

# Should we build BINUTILS
BINUTILS_BUILD_COMPILER="$BUILD_COMPILERS"

# Should we install BINUTILS
BINUTILS_INSTALL_COMPILER="$INSTALL_COMPILERS"

# Name of the BINUTILS archive file
BINUTILS_ARCHIVE_NAME="binutils-$BINUTILS_VERSION.tar.xz"

# URL of server to download archives
BINUTILS_DOWNLOAD_URL="https://ftp.gnu.org/gnu/binutils/$BINUTILS_ARCHIVE_NAME"

# Directory where archives with sources lies or will be downloaded
BINUTILS_ARCHIVE_DIR="$GENERAL_SRC_DIR"

# Full path to the archive file
BINUTILS_ARCHIVE_PATH="$BINUTILS_ARCHIVE_DIR/$BINUTILS_ARCHIVE_NAME"

# Directory where we unpack BINUTILS archive
BINUTILS_SRC_DIR="$GENERAL_SRC_DIR"

# Directory where we unpack BINUTILS archive
BINUTILS_SRC_DIR="$GENERAL_SRC_DIR"

# This is root BINUTILS directory with unpacked sources
BINUTILS_UNPACK_SRC_DIR="$BINUTILS_SRC_DIR/binutils-$BINUTILS_VERSION.src"

# Here is directory for object files of BINUTILS
BINUTILS_OBJ_DIR="$OBJ_GENERAL_DIR/binutils-$BINUTILS_VERSION"

# Here is directory to install BINUTILS
BINUTILS_INSTALL_DIR="$GENERAL_INSTALL_DIR/binutils-$BINUTILS_VERSION"

# Concrete options for host C compiler to build BINUTILS
BINUTILS_HOST_CC_OPT_FLAGS="$HOST_CC_OPT_FLAFS"

# Concrete options for host C++ compiler to build BINUTILS
BINUTILS_HOST_CPP_OPT_FLAGS="$HOST_CPP_OPT_FLAFS"


##----------------- GCC special variables

# Options to build GCC can be found here: https://gcc.gnu.org/install/configure.html

# Shoukd we build GCC crosscompiler
GCC_BUILD_CROSS="no"

# Version of GCC to be downloaded and installed
GCC_VERSION="7.2.0"

# Should we download the GCC sources
GCC_DOWNLOAD_SOURCES="$DOWNLOAD_SOURCES"

# Should we unpack the GCC sources
GCC_UNPACK_SOURCES="$UNPACK_SOURCES"

# Should we build GCC
GCC_BUILD_COMPILER="$BUILD_COMPILERS"

# Should we install GCC
GCC_INSTALL_COMPILER="$INSTALL_COMPILERS"

# Name of the GCC archive file
GCC_ARCHIVE_NAME="gcc-$GCC_VERSION.tar.xz"

# URL of server to download archives
# You can choose any other mirror here: https://gcc.gnu.org/mirrors.html
GCC_DOWNLOAD_URL="ftp://ftp.mpi-sb.mpg.de/pub/gnu/mirror/gcc.gnu.org/pub/gcc/releases/gcc-$GCC_VERSION/$GCC_ARCHIVE_NAME"

# Directory where archives with sources lies or will be downloaded
GCC_ARCHIVE_DIR="$GENERAL_SRC_DIR"

# Full path to the archive file
GCC_ARCHIVE_PATH="$GCC_ARCHIVE_DIR/$GCC_ARCHIVE_NAME"

# Directory where we unpack GCC archive
GCC_SRC_DIR="$GENERAL_SRC_DIR"

# This is root GCC directory with unpacked sources
GCC_UNPACK_SRC_DIR="$GCC_SRC_DIR/gcc-$GCC_VERSION.src"

# Here is directory for object files of GCC
GCC_OBJ_DIR="$OBJ_GENERAL_DIR/gcc-$GCC_VERSION"

# Here is directory to install GCC
GCC_INSTALL_DIR="$GENERAL_INSTALL_DIR/gcc-$GCC_VERSION"

# List of languages to build frontend for
GCC_LANGUAGES="c,c++,fortran"

# Concrete options for host C compiler to build GCC
GCC_HOST_CC_OPT_FLAGS="$HOST_CC_OPT_FLAFS"

# Concrete options for host C++ compiler to build GCC
GCC_HOST_CPP_OPT_FLAGS="$HOST_CPP_OPT_FLAFS"

##----------------- LLVM special variables

# Options to build LLVM can be found here: https://llvm.org/docs/CMake.html
# And some build info is here https://llvm.org/docs/GettingStarted.html

# Version of LLVM to be downloaded and installed
LLVM_VERSION="5.0.0"

# Should we download the LLVM sources
LLVM_DOWNLOAD_SOURCES="$DOWNLOAD_SOURCES"

# Should we unpack the LLVM sources
LLVM_UNPACK_SOURCES="$UNPACK_SOURCES"

# Should we build llvm
LLVM_BUILD_COMPILER="$BUILD_COMPILERS"

# Should we install llvm
LLVM_INSTALL_COMPILER="$INSTALL_COMPILERS"

# Build LLVM with cfe (clang) - a C/C++ frontend
# Documentation: https://clang.llvm.org/docs/InternalsManual.html
LLVM_WITH_CFE="yes"

# Build LLVM with lld - llvm linker (optional)
# Documentation: https://lld.llvm.org/
LLVM_WITH_LLD="yes"

# Build LLVM with lldb - llvm debuger (optional)
# Documentation: https://lldb.llvm.org/index.html
LLVM_WITH_LLDB="yes"

# Build LLVM with polly - loop optimizer (optional)
# Documentation: http://polly.llvm.org/index.html
LLVM_WITH_POLLY="yes"

# Build LLVM with compiler-rt - runtime tools for sanitizers (optional)
# Documentation: https://compiler-rt.llvm.org
LLVM_WITH_COMPILER_RT="yes"

# Build LLVM with libomp - OpenMP support (optional)
LLVM_WITH_LIBOPENMP="yes"

# Build LLVM with libunwind (optional)
# Documentation: http://bcain-llvm.readthedocs.io/projects/libunwind/en/latest/
LLVM_WITH_LIBUNWIND="yes"

# Build LLVM with libcxx - LLVM implemetation of standard C++ library (optional)
# Documentation: https://libcxx.llvm.org/
LLVM_WITH_LIBCXX="no"

# Build LLVM with libcxxabi - LLVM implemetation of low level support for standard C++ library (optional)
# Documentation: https://libcxxabi.llvm.org/
LLVM_WITH_LIBCXXABI="no"

# Build LLVM with clang-tools-extra - some tools including clang-analyzer (optional)
# Documentation: https://clang.llvm.org/extra/ReleaseNotes.html
LLVM_WITH_CLANG_TOOLS_EXTRA="no"

# Sould we build a cross-compiler. If "no" is set LLVM will be build in natine mode
LLVM_BUILD_CROSS="no"

# URLs and paths for llvm and tools download

# Directory where archives with sources lies or will be downloaded
LLVM_ARCHIVE_DIR="$GENERAL_SRC_DIR"

# Directory where we unpack llvm archive
LLVM_SRC_DIR="$GENERAL_SRC_DIR"

# This is root llvm directory with unpacked sources
LLVM_UNPACK_SRC_DIR="$LLVM_SRC_DIR/llvm-$LLVM_VERSION.src"

# Here is directory for object files of llvm
LLVM_OBJ_DIR="$OBJ_GENERAL_DIR/llvm-$LLVM_VERSION"

# Here is directory to install LLVM
LLVM_INSTALL_DIR="$GENERAL_INSTALL_DIR/llvm-$LLVM_VERSION"

# URL of server to download archives
LLVM_SERVER_URL="http://releases.llvm.org/$LLVM_VERSION"


LLVM_ARCHIVE_NAME="llvm-$LLVM_VERSION.src.tar.xz"

LLVM_DOWNLOAD_URL="$LLVM_SERVER_URL/$LLVM_ARCHIVE_NAME"

LLVM_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LLVM_ARCHIVE_NAME"


CFE_ARCHIVE_NAME="cfe-$LLVM_VERSION.src.tar.xz"

CFE_DOWNLOAD_URL="$LLVM_SERVER_URL/$CFE_ARCHIVE_NAME"

CFE_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$CFE_ARCHIVE_NAME"


LLD_ARCHIVE_NAME="lld-$LLVM_VERSION.src.tar.xz"

LLD_DOWNLOAD_URL="$LLVM_SERVER_URL/$LLD_ARCHIVE_NAME"

LLD_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LLD_ARCHIVE_NAME"



LLDB_ARCHIVE_NAME="lldb-$LLVM_VERSION.src.tar.xz"

LLDB_DOWNLOAD_URL="$LLVM_SERVER_URL/$LLDB_ARCHIVE_NAME"

LLDB_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LLDB_ARCHIVE_NAME"



POLLY_ARCHIVE_NAME="polly-$LLVM_VERSION.src.tar.xz"

POLLY_DOWNLOAD_URL="$LLVM_SERVER_URL/$POLLY_ARCHIVE_NAME"

POLLY_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$POLLY_ARCHIVE_NAME"



COMPILER_RT_ARCHIVE_NAME="compiler-rt-$LLVM_VERSION.src.tar.xz"

COMPILER_RT_DOWNLOAD_URL="$LLVM_SERVER_URL/$COMPILER_RT_ARCHIVE_NAME"

COMPILER_RT_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$COMPILER_RT_ARCHIVE_NAME"



LIBOPENMP_ARCHIVE_NAME="openmp-$LLVM_VERSION.src.tar.xz"

LIBOPENMP_DOWNLOAD_URL="$LLVM_SERVER_URL/$LIBOPENMP_ARCHIVE_NAME"

LIBOPENMP_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LIBOPENMP_ARCHIVE_NAME"



LIBUNWIND_ARCHIVE_NAME="libunwind-$LLVM_VERSION.src.tar.xz"

LIBUNWIND_DOWNLOAD_URL="$LLVM_SERVER_URL/$LIBUNWIND_ARCHIVE_NAME"

LIBUNWIND_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LIBUNWIND_ARCHIVE_NAME"



LIBCXX_ARCHIVE_NAME="libcxx-$LLVM_VERSION.src.tar.xz"

LIBCXX_DOWNLOAD_URL="$LLVM_SERVER_URL/$LIBCXX_ARCHIVE_NAME"

LIBCXX_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LIBCXX_ARCHIVE_NAME"



LIBCXXABI_ARCHIVE_NAME="libcxxabi-$LLVM_VERSION.src.tar.xz"

LIBCXXABI_DOWNLOAD_URL="$LLVM_SERVER_URL/$LIBCXXABI_ARCHIVE_NAME"

LIBCXXABI_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$LIBCXXABI_ARCHIVE_NAME"



CLANG_TOOLS_EXTRA_ARCHIVE_NAME="clang-tools-extra-$LLVM_VERSION.src.tar.xz"

CLANG_TOOLS_EXTRA_DOWNLOAD_URL="$LLVM_SERVER_URL/$CLANG_TOOLS_EXTRA_ARCHIVE_NAME"

CLANG_TOOLS_EXTRA_ARCHIVE_PATH="$LLVM_ARCHIVE_DIR/$CLANG_TOOLS_EXTRA_ARCHIVE_NAME"


# Build LLVM without debug info
LLVM_BUILD_TYPE="Release"

# Here you can set the llvm build system. It is recommened to use ninja
# But if you can't use it you can choode classic Makefile as well
LLVM_BUILD_SYSTEM="Ninja"
#LLVM_BUILD_SYSTEM="Unix Makefiles"

# Concreet options for host C compiler to build LLVM
LLVM_HOST_CC_OPT_FLAGS="$HOST_CC_OPT_FLAFS"

# Concreet options for host C++ compiler to build LLVM
LLVM_HOST_CPP_OPT_FLAGS="$HOST_CPP_OPT_FLAFS"

# Build LLVM with threads support
LLVM_ENABLE_THREADS="True"


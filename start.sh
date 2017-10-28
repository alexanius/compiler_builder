#!/bin/bash

# This is start file for compiler-building script. Here you can set
# different variables for you building environment

# Adding other script parts
source ./settings.sh
source ./tools.sh

if [ $WORK_WITH_BINUTILS = "yes" ]
then
    source ./binutils.sh
fi

if [ $WORK_WITH_LLVM = "yes" ]
then
    source ./llvm.sh
fi

if [ $WORK_WITH_GCC = "yes" ]
then
    source ./gcc.sh
fi


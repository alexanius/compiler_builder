#!/bin/bash

# This file contains misc functions for building script

# Execure line function. It prints execution line, writes it to log and
# terminates execution if it has failed
#
# $1 - line to be executed
function e()
{
    cmd=$1

    echo "\$ $cmd"
    { eval $cmd 2>&1; } >> "$LOG_FILE"

    if [ $? != 0 ] ;
    then
        echo "Last executed command:"
        echo "\$ $cmd"
        echo "Task failed"
        exit 1
    fi
}

# Download given url to the current directory
function download()
{
    url="$1"
    e "$WGET \"$url\""
}

# Unpack archives
# $1 is the path of the archive itself
# $2 is the name of an output directory
function unpack()
{
    archieve_path="$1"
    output_dir="$2"
    e "mkdir -p \"$output_dir\""
    e "$TAR -xpvf \"$archieve_path\" -C \"$output_dir\" --strip-components 1"
}


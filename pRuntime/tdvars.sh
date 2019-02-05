#!/bin/bash
cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #
export FPROOT="$cwd" #
td_obj="$cwd/obj" #
if [ -z "$CPATH" ]; then #
    export CPATH="${FPROOT}" #
else #
    export CPATH="${FPROOT}/include:$CPATH" #
fi #
if [ -z "$LIBRARY_PATH" ]; then #
    export LIBRARY_PATH="${td_obj}" #
else #
    export LIBRARY_PATH="${td_obj}:$LIBRARY_PATH" #
fi #
if [ -z "$LD_LIBRARY_PATH" ]; then #
    export LD_LIBRARY_PATH="${td_obj}" #
else #
    export LD_LIBRARY_PATH="${td_obj}:$LD_LIBRARY_PATH" #
fi #
 #

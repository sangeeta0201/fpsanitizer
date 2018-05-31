#!/bin/bash

root_cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #
echo $root_cwd

echo "***** Building LLVM *****"
cd build
make
cd ..
source llvmvars.sh

echo "***** Building herculean *****"
export LD_LIBRARY_PATH=""
cd $root_cwd
echo $root_cwd
cd src
make clean
make
source tdvars.sh


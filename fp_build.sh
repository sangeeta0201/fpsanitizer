#!/bin/bash

root_cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #
echo $root_cwd

echo "***** Building LLVM *****"
if [ -d "build" ]; then
cd build
make
else
mkdir build
cd build
cmake -G "Unix Makefiles" ../llvm
make
fi
cd ..
source llvmvars.sh

echo "***** Building fpsanitizer *****"
export LD_LIBRARY_PATH=""
cd $root_cwd
echo $root_cwd
cd pRuntime
make clean
make
source tdvars.sh
cd ..

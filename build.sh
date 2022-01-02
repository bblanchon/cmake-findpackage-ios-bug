#/bin/env bash

export ThePackage_DIR="$(dirname $0)/ThePackage"

rm -rf build
mkdir build

cmake -D CMAKE_SYSTEM_NAME="iOS" -S . -B build
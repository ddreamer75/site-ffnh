#!/bin/bash
echo "preparing build environment for building Gluon... This usually takes a good while."
apt-get update -y
apt-get install -y apt-utils
apt-get upgrade -y
apt-get install -y gawk unzip git wget curl rsync file genisoimage \
                   clang python3 python3-dev python3-pyelftools python3-setuptools \
                   build-essential gawk unzip libncurses-dev zlib1g-dev libssl-dev \
                   libelf-dev llvm wget rsync time qemu-utils ecdsautils swig
echo "install done. cleaning up."
apt-get clean && rm -rf /var/lib/apt/lists/*
echo "cleanup done. building Gluon."

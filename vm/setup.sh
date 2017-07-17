#!/bin/bash
yum update && yum install -y emacs docker git devtoolset-6
scl enable devtoolset-6 bash

# Install singularity
VERSION=2.3.1
curl -O -J -L https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install

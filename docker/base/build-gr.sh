#!/bin/bash
GR_TAG=$1
USER=bvan

cvs -d :ext:$USER@centaurusa.slac.stanford.edu:/nfs/slac/g/glast/ground/cvs co -r GlastRelease-$GR_TAG GlastRelease-scons

docker build -v `pwd`/GlastRelease-scons:/root/GlastRelease-scons --build-arg GR_TAG $GR_TAG .

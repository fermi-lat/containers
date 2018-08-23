#!/bin/bash
cp ../../yum_requirements.centos6-x86_64.txt yum_requirements.txt
docker build . -t fermi-lat/bootstrap:latest -f Dockerfile.bootstrap
docker run --rm fermi-lat/bootstrap:latest ./bootstrap.sh python27 rh-git29 > Dockerfile
docker build . -t fermilat/base:centos6-py27-gcc44

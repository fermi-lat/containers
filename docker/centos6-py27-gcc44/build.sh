#!/bin/bash
docker build . -t fermi-lat/bootstrap:latest -f Dockerfile.bootstrap
docker run --rm fermi-lat/bootstrap:latest ./bootstrap.sh python27 rh-git29 > Dockerfile

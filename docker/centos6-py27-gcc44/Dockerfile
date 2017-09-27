FROM centos:6

MAINTAINER Brian Van Klaveren <bvan@slac.stanford.edu>

RUN yum update -y && \
   yum install -y epel-release centos-release-scl-rh && \
   yum install -y curl gcc gcc-c++ scons \
   freetype-devel libX11-devel libXt-devel openmotif-devel \
   libXcursor-devel mesa-libGL-devel libGLU-devel \
   libXrandr-devel libtiff-devel \
   xrootd-client python27 rh-git29-git

WORKDIR /workspace
WORKDIR /ext

RUN echo -e "#!/bin/bash\nsource scl_source enable python27 rh-git29" > /etc/profile.d/fermilat.sh

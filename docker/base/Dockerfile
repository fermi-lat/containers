FROM centos:6

MAINTAINER Joris GUILLOUF <jguillouf@lupm.in2p3.fr>

ARG GR_TAG=20-10-04-gr02

RUN yum update && yum install -y curl gcc gcc-c++ scons \
   freetype-devel libX11-devel libXt-devel openmotif-devel \
   libXcursor-devel mesa-libGL-devel libGLU-devel \
   libXrandr-devel libtiff-devel

RUN curl "http://www-glast.stanford.edu/cgi-bin/viewcvs/SCons-installer/src/installer.py?revision=1.10&content-type=text%2Fplain" > installer.py

RUN mkdir /root/GLAST_EXT && \
    python installer.py  -c install -x --package GlastRelease \
      --versionType RELEASE --version $GR_TAG \
      --variant Optimized --os redhat6-x86_64-64bit-gcc44 \
      -e GLAST_EXT && \
    cd /root/GlastRelease-scons && \
    scons --with-GLAST-EXT /root/GLAST_EXT

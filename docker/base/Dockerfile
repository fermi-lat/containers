FROM centos:6

MAINTAINER Joris GUILLOUF <jguillouf@lupm.in2p3.fr>

ARG TAG=20-10-04-gr02
ARG PACKAGE=GlastRelease

RUN yum update -y && yum install -y curl gcc gcc-c++ scons \
   freetype-devel libX11-devel libXt-devel openmotif-devel \
   libXcursor-devel mesa-libGL-devel libGLU-devel \
   libXrandr-devel libtiff-devel

ADD workspace /root/workspace

WORKDIR /root
RUN curl "http://www-glast.stanford.edu/cgi-bin/viewcvs/SCons-installer/src/installer.py?revision=1.10&content-type=text%2Fplain" > installer.py

RUN mkdir /root/GLAST_EXT && \
    python installer.py  -c install -x --package $PACKAGE \
      --versionType RELEASE --version $TAG \
      --variant Optimized --os redhat6-x86_64-64bit-gcc44 \
      -e GLAST_EXT && \
    cd /root/workspace && \
    scons --with-GLAST-EXT /root/GLAST_EXT all

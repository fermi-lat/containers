Bootstrap:docker
From:centos:6

%labels
    Maintainer "Joris Guillouf <jguillouf@lupm.in2p3.fr>"

%post
    yum update -y && yum install -y epel-release

    yum install -y scons \
        time sendmail \
        freetype-devel libX11-devel libXt-devel openmotif-devel \
        libXcursor-devel mesa-libGL-devel libGLU-devel \
        libXrandr-devel libtiff-devel \
        xrootd-client

    mkdir -p /software

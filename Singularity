Bootstrap:docker
From:centos:6

%labels
    Maintainer "Joris Guillouf <jguillouf@lupm.in2p3.fr>"

%post
    yum update -y && yum install -y epel-release

    yum install -y scons \
        time \
        freetype-devel libX11-devel libXt-devel openmotif-devel openmotif-devel.i686 \
        libXcursor-devel mesa-libGL-devel libGLU-devel \
        libXrandr-devel libtiff-devel \
        glibc.i686 libstdc++.i686\
        xrootd-client \
        openssl098e

    mkdir -p /{software,afs,sps,scratch}
    mkdir -p /var/spool/sge

%files
    bin/bridge.sh /opt

%environment
    P2_SENDMAIL=/opt/bridge.sh
    export P2_SENDMAIL 

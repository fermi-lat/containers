Bootstrap:docker
From:centos:6

%labels
    Maintainer "Joris Guillouf <jguillouf@lupm.in2p3.fr>"

%post
    yum update -y && yum install -y epel-release

    yum install -y scons \
        time sendmail \
        freetype-devel libX11-devel libXt-devel openmotif-devel openmotif-devel.i386\
        libXcursor-devel mesa-libGL-devel libGLU-devel \
        libXrandr-devel libtiff-devel \
        glibc.i686 \
        xrootd-client

    mkdir -p /{software,afs,sps,scratch}

    chmod 2755 /usr/sbin/sendmail.sendmail

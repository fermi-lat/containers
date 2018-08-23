FROM centos:6

LABEL maintainer.name="Fermi LAT Collaboration" \
      maintainer.email="fermihelp@milkyway.gsfc.nasa.gov"

# Reproduce same dependency environment as the condaforge/linux-anvil container
# Use (now deprecated) scl devtoolset-2 compilers and do not install python.
RUN yum update -y && \
    yum install -y --setopt=tsflags=nodocs \
        bzip2 \
        centos-release-scl \
        make \
        mesa-libGL-devel \
        libXext-devel \
        libXrender-devel \
        libSM-devel \
        libX11-devel \
        patch \
        sudo \
        tar \
        tini \
        which \
        yum-utils && \
    yum-config-manager --add-repo http://people.centos.org/tru/devtools-2/devtools-2.repo && \
    yum update -y && \
    yum install -y --setopt=tsflags=nodocs \
        devtoolset-2-binutils \
        devtoolset-2-gcc \
        devtoolset-2-gcc-gfortran \
        devtoolset-2-gcc-c++ && \
    yum clean all

# Build miniconda2 from scratch and install necessary git and conda-build
# dependencies (From Condaforge) at the top level. Finally prepare the proper
# directory structure by making the conda directories 777 and owned by nobody.
RUN curl -s -L \
    https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh > \
    miniconda.sh && \
  bash miniconda.sh -b -p /miniconda && \
  rm miniconda.sh && \
  /miniconda/bin/conda install -c conda-forge \
    conda-build \
    anaconda-client \
    git \
    jinja2 \
    setuptools && \
  /miniconda/bin/conda clean -tipsy && \
  mkdir -p /.conda/pkgs && \
  touch /.conda/pkgs/urls.txt && \
  chmod -R a+rwx  /miniconda /.conda && \
  chown -R nobody:nobody  /miniconda /.conda

# Sciencetools must write to $home, but jenkins chooses its own UID:GID pair and
# sets its own wokrdir on docker run, so we create a dummy directory and make it
# 777 and owned by nobody
RUN mkdir -p /home/jenkins && \
  chmod -R a+rwx /home/jenkins && \
  chown -R nobody:nobody /home/jenkins

ENV PATH /miniconda/bin:$PATH
ENV HOME /home/jenkins

CMD [ "/bin/bash", "-c" ]

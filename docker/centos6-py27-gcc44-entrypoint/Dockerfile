FROM centos:6

LABEL maintainer="bvan@slac.stanford.edu"

COPY yum_requirements.txt .
ENV SCL_GIT=rh-git29
ENV SCL_PYTHON=python27

RUN yum update -y && \
   yum install -y  --setopt=tsflags='' epel-release centos-release-scl-rh && \
   xargs yum install -y  --setopt=tsflags='' \
   ${SCL_PYTHON} ${SCL_GIT} \
   < yum_requirements.txt && \
   yum clean all

# SHELL is for Dockerfile time, ENTRYPOINT is for runtime (e.g. docker run)
RUN echo -e '#!/bin/bash\nsource scl_source enable '${SCL_PYTHON} ${SCL_GIT}'\nbash -c "$@"\n' > /usr/bin/container-shell
RUN echo -e '#!/bin/bash\nsource scl_source enable '${SCL_PYTHON} ${SCL_GIT}'\nexec "$@"\n' > /usr/bin/container-entrypoint
RUN chmod +x /usr/bin/container-entrypoint /usr/bin/container-shell

# Set the User Shell also to /usr/bin/container-shell for docker exec
# on a running container
RUN groupadd -g 1000 centos && \
    useradd -u 1000 -g centos -s /usr/bin/container-shell centos

COPY --chown=1000:1000 ./root/home/centos /home/centos

SHELL ["/usr/bin/container-shell"]

# Pick up local pip directory by default
ENV PATH=/home/centos/.local/bin:$PATH

USER centos
WORKDIR /home/centos
ENTRYPOINT ["/usr/bin/container-entrypoint"]

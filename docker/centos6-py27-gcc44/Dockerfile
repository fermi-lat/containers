FROM centos:6

LABEL maintainer="bvan@slac.stanford.edu"
COPY yum_requirements.txt .
RUN yum update -y && \
   yum install -y  --setopt=tsflags='' epel-release centos-release-scl-rh && \
   xargs yum install -y  --setopt=tsflags='' \
   python27 rh-git29  \
   < yum_requirements.txt && \
   yum clean all

ENV PERL5LIB="/opt/rh/rh-git29/root/usr/share/perl5/vendor_perl"
ENV XDG_DATA_DIRS="/opt/rh/python27/root/usr/share:/usr/local/share:/usr/share"
ENV X_SCLS="rh-git29 python27 "
ENV MANPATH="/opt/rh/rh-git29/root/usr/share/man:/opt/rh/python27/root/usr/share/man:"
ENV PKG_CONFIG_PATH="/opt/rh/python27/root/usr/lib64/pkgconfig"
ENV PATH="/opt/rh/rh-git29/root/usr/bin:/opt/rh/python27/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV LD_LIBRARY_PATH="/opt/rh/httpd24/root/usr/lib64:/opt/rh/python27/root/usr/lib64"


# Set the User Shell also to /usr/bin/container-shell for docker exec
# on a running container
RUN groupadd -g 1000 centos && \
    useradd -u 1000 -g centos -s /usr/bin/container-shell centos

COPY --chown=1000:1000 ./root/home/centos /home/centos

# Create known_hosts
RUN mkdir /home/centos/.ssh && ssh-keyscan -t rsa github.com >> /home/centos/.ssh/known_hosts

# Pick up local pip directory by default
ENV PATH=/home/centos/.local/bin:$PATH

USER centos
WORKDIR /home/centos

# Fermi Containerization Project

This repository builds a [Docker image](https://hub.docker.com/r/fermilat/glast_release/) and a [Singularity image](https://singularity-hub.org/collections/335/) with GlastRelease.

# Singularity

## 1. Install Singularity

Instructions can be found on the [singularity site](https://singularityware.github.io).

## 2. Create the Image

### 2.1 Bootstrap the image
Bootstrapping means using something to build from, or not starting from nothing. In this case, we are goi
ng to use a build file that bootstraps a Docker image of CentOS 6. This build file is called [Singularity](Singularity), and for more details about this you can 
[read here](http://singularity.lbl.gov/docs-docker).

    sudo singularity create --size 6000 glast_release.img
    sudo singularity bootstrap glast_release.img Singularity


### 2.2. Import from Singularity Hub

    sudo singularity create --size 6000 glast_release.img
    sudo singularity import glast_release.img shub://fermi-lat/containers:latest

## 3. How do I shell into the container?
Singularity has an easy, intuitive way to shell inside!

      singularity shell glast_release.img
      Singularity: Invoking an interactive shell within container...
      Singularity.glast_release.img> cd /opt/workspace
      Singularity.glast_release.img> source bin/centos6-x86_64-64bit-gcc44/_setup.sh
      Singularity.glast_release.img> export startTime=0,1000
      Singularity.glast_release.img> ./bin/centos6-x86_64-64bit-gcc44/Gleam Gleam/src/jobOptions.txt

If you want the container to be writable (default isn't) then you will need root (on your local machine) and add the `--writable` option:

      sudo singularity shell --writable glast_release.img

# Docker

## 1. Getting Started
You should first [install Docker](https://docs.docker.com/engine/installation/). 

## 2. Build your image

If you want to look at or make changes to the code, it's recommended to install CVS package and to clone the repo and build the container locally:

    git clone https://github.com/fermi-lat/containers
    cd containers/docker/base
    bash ../../bin/setup-workspace.sh [GlastRelease_version] [CVS_username]
    docker build -t glast_release .

## 3. How do I shell into the container?
By default, running the container uses the `ENTRYPOINT`, meaning it is used as an executable and you do not enter the container. In the case that you want to interactively work with the code, you may want to shell into the container. If there is a running container (eg an analysis) and you want to open up another terminal on your local machine to look inside (while it's running!) you need to get the 12 digit identifier with `docker ps`, and then plug it into this command:

      docker exec -it dc83a8d801a2 /bin/bash

This says we want to execute (exec) and (interactive)(terminal) for container with id (dc83a8d801a2) and run the command (/bin/bash)
    
If the container isn't running, then you can use `run`:

      docker run -it --entrypoint /bin/bash glast_release

The container is provided on [Docker Hub](https://hub.docker.com/r/fermilat/glast_release/) and can be downloaded from there when you run it.

    docker run -it docker.io/fermilat/glast_release:20-10-04-gr02 /bin/bash

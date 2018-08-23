# Jenkins conda dockerfile

Build: `docker build -t fssc/jenkins-conda:latest /Users/areustle/nasa/fermi-lat/containers/docker/jenkins-conda`

or Download: `docker pull fssc/jenkins-conda:latest`

IMPORTANT NOTE. This mounts the present working directory as the home, and is writeable within the container. 
You can lose data that is in this directory if you delete it in the container. This was done to match the way
Jenkins runs docker containers.

Run as jenkins runs: 
`# cd tmp`
`docker run --rm -t -d -u ${UID}:${GID} -w /home/jenkins -v $(pwd):/home/jenkins fssc/jenkins-conda:latest cat`

Get the container id and `exec` all the things.

`docker exec <CONTAINER-ID> git clone https://github.com/fermi-lat/ScienceTools-conda-recipe.git`

`docker exec <CONTAINER-ID> scl enable devtoolset-2 "conda build -c conda-forge -c fermi_dev_externals ScienceTools-conda-recipe"`

`docker exec <CONTAINER-ID> /bin/bash -c "conda create -n fermi -c conda-forge -c fermi_dev_externals --use-local fermitools fermitools-test-scripts -y"`

`docker exec <CONTAINER-ID> /bin/bash -c "source activate fermi && test-scripts/ST-pulsar-test"`

`docker exec <CONTAINER-ID> /bin/bash -c "source activate fermi && "test-scripts/ST-unit-test --bit64"`

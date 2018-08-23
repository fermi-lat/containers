# Build Dockerfile
Run ./build.sh. This will evaluate the Dockerfile.template and back in
SCL-related environment variables into the Dockerfile that it would get
at runtime. When finished, check the generated Dockerfile in after verifying.

# Build Container with Dockerfile
Just docker build . -t fermilat/base:centos6-py27-gcc44

When done, push it


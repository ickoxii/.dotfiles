#
# Ubuntu Dockerfile
#
# Use for valgrind mem-checking
#

# Pull base image
FROM ubuntu

# Docker container will start in the specified directory
# Any subsequent instructions in Dockerfile will start from this directory
WORKDIR /projects

# Copy files from local machine to Docker container
# COPY /src /dest
COPY ./src .

# Run terminal commands to install packages
RUN \
	apt-get update && \
	apt-get install -y build-essential vim git tmux valgrind

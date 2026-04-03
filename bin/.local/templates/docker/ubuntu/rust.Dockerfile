# FROM ubuntu:latest
FROM rust:1.88

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools and protobuf
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip \
    protobuf-compiler \
    libprotobuf-dev

# Set the working directory to match our alias mount
WORKDIR /work

# Default command
CMD ["bash"]

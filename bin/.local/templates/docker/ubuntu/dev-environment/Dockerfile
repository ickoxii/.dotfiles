FROM --platform=linux/arm64 ubuntu:latest

# Set working directory
WORKDIR /root/work

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential coreutils git valgrind \
    vim \
    man man-db less groff \
    && rm -rf /var/lib/apt/lists/*

ENV MANPATH=/usr/share/man:/usr/local/share/man

# Copy config
COPY .bashrc /root/.bashrc
COPY .vimrc /root/.vimrc

# Set default command
CMD ["/bin/bash"]

# Use a Debian-based image as a base. Debian is commonly used for server environments.
FROM debian:bullseye-slim

# Update package lists and install necessary build tools and libraries.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        bash \
        nano \
        vim \
        gcc \
        make \
        libc6-dev \
        libncurses5-dev \
        libssl-dev \
        zlib1g-dev \
        wget \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the Dystopia 1.2 source code.
COPY dystopia/ /app/dystopia

# Expose the port the MUD will listen on (default 4000).
EXPOSE 4000:4000

# Define the command to run when the container starts.
CMD ["/bin/bash"]
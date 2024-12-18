# Use a Debian-based image as a base. Debian is commonly used for server environments.
FROM debian:bullseye-slim

# Update package lists and install necessary build tools and libraries.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        gcc \
        make \
        libc6-dev \
        libncurses5-dev \
        libssl-dev \
        wget \
        && rm -rf /var/lib/apt/lists/*


        WORKDIR /app

# Clone the Dystopia 1.2 source code.
RUN git clone https://github.com/dystopia-mud/dystopia-1.2.git .

# Set environment variables if required by the build process.
# Example:
# ENV CC=gcc

# Compile the Dystopia source code.
RUN make

# Expose the port the MUD will listen on (default 4000).
EXPOSE 4000

# Define the command to run when the container starts.
CMD ["./dystopia"]
# Use the official lightweight Alpine Linux image
FROM alpine:latest

# Install necessary packages and compilers
RUN apk update && apk add --no-cache \
    curl \
    git \
    openssl \
    libpcap-dev \
    nano \
    build-base \
    gfortran \
    openjdk11-jdk \
    python3 \
    py3-pip \
    ruby \
    rust \
    go \
    nodejs \
    npm \
    perl \
    zsh \
    bash \
    tcsh \
    nasm

COPY install_fpc.sh /install_fpc.sh
RUN chmod +x /install_fpc.sh
RUN /install_fpc.sh > /fpc_installation.txt

# Verify installations
RUN echo -n "gcc: " >> /installed_compilers.txt && \
    gcc --version >> /installed_compilers.txt && \
    echo -n "gfortran: " >> /installed_compilers.txt && \
    gfortran --version >> /installed_compilers.txt && \
    echo -n "as: " >> /installed_compilers.txt && \
    as --version >> /installed_compilers.txt && \
    echo -n "nasm: " >> /installed_compilers.txt && \
    nasm --version >> /installed_compilers.txt && \
    echo -n "java: " >> /installed_compilers.txt && \
    java -version && >> /installed_compilers.txt \
    echo -n "python3: " >> /installed_compilers.txt && \
    python3 --version && >> /installed_compilers.txt \
    echo -n "ruby: " >> /installed_compilers.txt && \
    ruby --version && >> /installed_compilers.txt \
    echo -n "rustc: " >> /installed_compilers.txt && \
    rustc --version && >> /installed_compilers.txt \
    echo -n "go: " >> /installed_compilers.txt && \
    go version && >> /installed_compilers.txt \
    echo -n "node: " >> /installed_compilers.txt && \
    node --version && >> /installed_compilers.txt \
    echo -n "perl: " >> /installed_compilers.txt && \
    perl --version >> /installed_compilers.txt

# Declare /opt as a mountable volume
VOLUME ["/opt"]

# Set the default command to run when starting the container
CMD ["/bin/bash"]

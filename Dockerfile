FROM --platform=linux/arm64 debian:trixie
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "deb [trusted=yes] http://archive.raspberrypi.com/debian/ trixie main" > /etc/apt/sources.list.d/raspi.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends raspberrypi-archive-keyring && \
    rm -rf /var/lib/apt/lists/*
RUN echo "deb [signed-by=/usr/share/keyrings/raspberrypi-archive-keyring.gpg] http://archive.raspberrypi.com/debian/ trixie main" > /etc/apt/sources.list.d/raspi.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    ccache \
    build-essential \
    devscripts \
    debhelper \
    fakeroot \
    cmake \
    git \
    pkg-config \
    dpkg-dev \
    lintian \
    equivs

WORKDIR /workspace

CMD ["/bin/bash"]

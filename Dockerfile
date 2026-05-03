FROM debian:trixie
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "deb [trusted=yes] http://archive.raspberrypi.com/debian/ trixie main" > /etc/apt/sources.list.d/raspi.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends raspberrypi-archive-keyring && \
    rm -rf /var/lib/apt/lists/*
RUN echo "deb [signed-by=/usr/share/keyrings/raspberrypi-archive-keyring.gpg] http://archive.raspberrypi.com/debian/ trixie main" > /etc/apt/sources.list.d/raspi.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    devscripts \
    equivs

WORKDIR /workspace

COPY debian/control debian/control
RUN mk-build-deps -i -r -t 'apt-get -y --no-install-recommends' debian/control

CMD ["/bin/bash"]

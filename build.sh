docker build -t rpi64-builder .
docker run --rm -v "$(pwd):/workspace" -v "ccache:/root/.cache/ccache" -w /workspace rpi64-builder bash -c "mkdir -p /build && cp -r . /build/src && cd /build/src && mk-build-deps -i -r -t 'apt-get -y --no-install-recommends' debian/control && dpkg-buildpackage -us -uc && cp ../*.deb /workspace/"

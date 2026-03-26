ARG ROCKY_VERSION
FROM rockylinux/rockylinux:${ROCKY_VERSION}
RUN dnf install -y wget make gcc;
RUN mkdir -p /build/{packages,workdir};
ARG LIBSODIUM_VERSION
RUN wget -q https://download.libsodium.org/libsodium/releases/libsodium-${LIBSODIUM_VERSION}.tar.gz.sig -O /build/packages/libsodium-${LIBSODIUM_VERSION}.tar.gz.sig;
RUN wget -q https://download.libsodium.org/libsodium/releases/libsodium-${LIBSODIUM_VERSION}.tar.gz -O /build/packages/libsodium-${LIBSODIUM_VERSION}.tar.gz;
RUN wget -q https://download.libsodium.org/jedi.gpg.asc -O /build/packages/jedi.gpg.asc;
RUN gpg --import /build/packages/jedi.gpg.asc;
RUN gpg --verify /build/packages/libsodium-${LIBSODIUM_VERSION}.tar.gz.sig /build/packages/libsodium-${LIBSODIUM_VERSION}.tar.gz;
RUN tar --strip-components=1 -xf /build/packages/libsodium-${LIBSODIUM_VERSION}.tar.gz -C /build/workdir/;
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

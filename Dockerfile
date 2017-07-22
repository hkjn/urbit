FROM {{ARG_FROM}}

ENV URBIT_VERSION=0.4.3

RUN pacman -Syyy && \
    pacman --noconfirm -S base-devel gcc gmp libsigsegv openssl automake autoconf ragel cmake re2c libtool ncurses curl && \
    curl -fsSLo urbit.tar.gz https://media.urbit.org/dist/src/urbit-${URBIT_VERSION}.tar.gz && \
    tar xzfv urbit.tar.gz && \
    cd urbit-${URBIT_VERSION} && \
    make && \
    install -m 0755 bin/urbit /usr/local/bin && \
    rm ../urbit.tar.gz
WORKDIR /usr/local/src
ENTRYPOINT ["urbit"]


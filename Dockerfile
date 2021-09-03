FROM ubuntu:18.04
LABEL maintainer="op <op@nervos.org>"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends wget apt-utils unzip ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

ENV MERCURY_VERSION 0.1.0
RUN wget https://github.com/nervosnetwork/mercury/releases/download/v${MERCURY_VERSION}/mercury-x86_64-unknown-linux-gnu.tar.gz -O /tmp/mercury-x86_64-unknown-linux-gnu.tar.gz
RUN cd /tmp && tar zxvf mercury-x86_64-unknown-linux-gnu.tar.gz
RUN cp /tmp/mercury /bin/mercury
RUN rm -rf /tmp/mercury-x86_64-unknown-linux-gnu.tar.gz

RUN mkdir /data
RUN mkdir /config

WORKDIR /data

EXPOSE 8116

ENV RUST_LOG=info
ENTRYPOINT ["/bin/mercury"]

FROM golang:1.7


RUN mkdir -p /go/src/github.com/flike && \
    cd /go/src/github.com/flike && \
    git clone https://github.com/flike/kingshard.git && \
    cd kingshard && \
    git checkout 1.5 && \
    make && \
    mkdir -p /opt/kingshard && \
    cp -r bin /opt/kingshard && \
    cd .. && \
    rm -rf kingshard


WORKDIR /opt/kingshard

EXPOSE 9696 9797
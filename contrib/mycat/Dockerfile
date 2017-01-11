FROM java:8
MAINTAINER zhengtao.wuzt@gmail.com


RUN mkdir -p /opt && \
    cd /opt && \
    wget  http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz && \
    tar zxvf Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz

WORKDIR /opt/mycat


CMD ["./bin/mycat","console"]
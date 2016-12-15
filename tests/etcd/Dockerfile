FROM golang:latest
COPY deb.list /etc/apt/sources.list
COPY / /root/

#RUN     cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#        && rm -f /etc/apt/sources.list.d/* \
#        && apt-get -y update &&  apt-get -y install net-tools zip \
#        && cd /root/

#RUN     cd /root && unzip etcd-master.zip && cd etcd-master && ./build

RUN     apt-get -y update && apt-get -y install curl

WORKDIR /root/etcd-master/bin
CMD   /root/etcd-master/bin/etcd

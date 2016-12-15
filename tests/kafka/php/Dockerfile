FROM php:latest
COPY deb.list /etc/apt/sources.list
COPY / /root/

RUN     cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && rm -f /etc/apt/sources.list.d/* \
        && apt-get -y update &&   apt-get -y install net-tools zip

RUN     apt-get -y install build-essential libc6-dev zlib1g-dev python-dev \
        && cd /root/ && tar -xzf librdkafka-0.9.2.tar.gz \
        && cd /root/librdkafka-0.9.2 && make clean && ./configure  && make && make install

RUN     cd  /root && unzip /root/php-rdkafka-php7.zip \
        && cd php-rdkafka-php7 && phpize \
        && ./configure && make all -j 5 && make install \
        && echo extension=rdkafka.so >/usr/local/etc/php/conf.d/rdkafka.ini


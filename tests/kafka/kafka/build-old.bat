cd  %~dp0
docker-compose  up -d  -f docker-compose-build.yml
rem 准备资源
docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\kafka_2.10-0.10.1.0.tgz" kafka_kafka_1:/root/
docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\deb.list" kafka_kafka_1:/etc/apt/sources.list
docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\librdkafka-0.9.2.tar.gz" kafka_php_1:/root/

docker exec kafka_kafka_1 bash -c "rm -f /etc/apt/sources.list.d/*"
docker exec kafka_kafka_1 bash -c "apt-get -y update &&   apt-get -y install net-tools"

docker exec kafka_kafka_1 bash -c "cd /root && tar -xzf /root/kafka_2.10-0.10.1.0.tgz && mv /root/kafka_2.10-0.10.1.0 /usr/local/kafka"
docker exec kafka_kafka_1 bash -c "ls -al /usr/local/kafka"

rem 启动服务
docker exec  -d kafka_kafka_1 bash -c "cd /usr/local/kafka &&  bin/zookeeper-server-start.sh config/zookeeper.properties"
docker exec  -d kafka_kafka_1 bash -c "cd /usr/local/kafka &&  bin/kafka-server-start.sh config/server.properties"
docker exec  kafka_kafka_1 bash -c "ps aux "

docker exec  kafka_kafka_1 bash -c "netstat -an | grep ESTABLISHED"

rem docker run -d --name kafka_php_1  php:7.0.7 tail -f /root/.bashrc

docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\librdkafka-0.9.2.tar.gz" kafka_php_1:/root/
docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\phpunit.phar" kafka_php_1:/usr/bin/phpunit
docker exec -it kafka_php_1 chmod +x /usr/bin/phpunit
docker exec -it kafka_php_1 ls -al /usr/bin/phpunit
docker exec -it kafka_php_1 phpunit --version

docker cp "D:\360\code\xltxlm\verification\tests\kafka\kafka\deb.list" kafka_php_1:/etc/apt/sources.list
docker exec kafka_php_1 bash -c "rm -f /etc/apt/sources.list.d/*"
docker exec kafka_php_1 bash -c "apt-get -y update && apt-get -y install build-essential libc6-dev zlib1g-dev python-dev"
docker exec kafka_php_1 bash -c "cd /root/ && tar -xzf librdkafka-0.9.2.tar.gz && cd /root/librdkafka-0.9.2 && make clean && ./configure  && make && make install &&ls -al /root/  "
docker exec kafka_php_1 bash -c "pecl install channel://pecl.php.net/rdkafka-beta"
docker exec kafka_php_1 bash -c "echo extension=rdkafka.so >/usr/local/etc/php/conf.d/rdkafka.ini"
docker exec -it kafka_php_1 bash -c  "php -v"
docker exec -it kafka_php_1 bash -c  "php -m | grep rdkafka"
docker exec -i kafka_php_1 bash -c "php -r 'var_dump(new RdKafka\Producer());die(www);'"
docker exec -i kafka_php_1 bash -c "php -r 'var_dump(new \RdKafka\Consumer);'"
docker ps -a

docker commit kafka_kafka_1 docker-kafka
docker commit kafka_php_1 docker-php
docker images

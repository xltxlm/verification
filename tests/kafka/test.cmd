cd  %~dp0
docker-compose up -d

rem 启动服务
docker exec  -d kafka_kafka_1 bash -c "cd /usr/local/kafka &&  bin/zookeeper-server-start.sh config/zookeeper.properties"
docker exec  -d kafka_kafka_1 bash -c "cd /usr/local/kafka &&  bin/kafka-server-start.sh config/server.properties"
docker exec  kafka_kafka_1 bash -c "ps aux "

docker exec  kafka_kafka_1 bash -c "netstat -an | grep ESTABLISHED"

docker exec -it kafka_php_1 ls -al /source/
docker exec -i kafka_php_1 bash -c "cd /source/ && phpunit --bootstrap  /source/vendor/autoload.php tests/kafka/RdkafkaTest.php"

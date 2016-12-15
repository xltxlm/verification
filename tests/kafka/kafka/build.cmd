cd %~dp0
docker rmi -f docker-kafka:latest
docker build -t docker-kafka:latest .

docker rm -f kafka-test
docker run -d -p 9092:9092 --name kafka-test docker-kafka:latest
docker ps -a
docker exec kafka-test ps aux
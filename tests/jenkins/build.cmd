cd %~dp0
docker build -t docker-jenkins:latest .

docker rm -f jenkins-test
docker run -d -p 9092:9092 --name jenkins-test docker-jenkins:latest
docker ps -a
docker exec jenkins-test ps aux

docker commit jenkins-test docker-jenkins:latest
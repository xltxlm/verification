cd %~dp0
docker rmi -f docker-php:latest
docker build -t docker-php:latest .

docker rm -f php-test
docker run -d  --name php-test docker-php:latest
docker ps -a

rem docker commit php-test docker-php:latest
rem docker rm -f php-test && docker run --rm -it --name php-test php bash
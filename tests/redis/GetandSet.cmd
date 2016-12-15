cd  %~pd0
del *.txt
docker-compose up -d
docker ps -a
docker exec redis_redis_1 redis-cli  del abc
docker exec redis_redis_1 redis-cli  del abcnx
docker exec redis_redis_1 redis-cli  lpush list a b c d e f g
cd ..\..\
vendor\bin\jmeter tests/redis
pause
exit
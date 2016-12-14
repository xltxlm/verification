cd  %~pd0
docker-compose up -d
docker ps -a
docker exec redis_redis_1 redis-cli  del abc
docker exec redis_redis_1 redis-cli  get abc
docker exec redis_redis_1 redis-cli  del abcnx
docker exec redis_redis_1 redis-cli  get abcnx
cd ..\..\
vendor\bin\jmeter tests/redis
pause
exit
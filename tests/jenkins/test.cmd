@echo off
cd  %~pd0
docker-compose down
docker-compose up -d
rem 暂停一会
ping 127.0.0.1 -n 5 > nul
docker ps -a

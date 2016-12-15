@echo off
cd  %~pd0
docker-compose down
docker-compose up -d
ping 127.0.0.1 -n 6 > nul
docker ps -a
docker exec -i etcd_etcd0_1 ./etcdctl member list
rem docker exec -i etcd_etcd0_1 ip addr | grep "inet " | grep -v " lo" | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*"
rem docker logs  etcd_etcd0_1
rem docker exec -i etcd_etcd0_1 netstat -tnlp
rem docker exec -i etcd_etcd0_1 ls -al etcd0.etcd
rem docker exec -i etcd_etcd0_1 bash -c "./etcdctl lease grant 10"
rem docker exec -i etcd_etcd0_1 bash -c "export ETCDCTL_API=3 && ./etcdctl put fooxxx bar222"
rem docker exec -i etcd_etcd0_1 bash -c "export ETCDCTL_API=3 && ./etcdctl --endpoints=127.0.0.1:2379,172.17.0.6:2379 get fooxxx"


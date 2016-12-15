cd %~dp0
docker build -t docker-go:latest .

docker rm -f go-test
docker run -d  --name go-test docker-go:latest
docker exec -i go-test go version
docker exec -i go-test ps aux
docker ps -a

docker exec -i go-test ls -al
docker exec -i go-test ip addr
docker exec -i go-test netstat -tnlp
docker exec -i go-test ./etcdctl member list
docker exec -i go-test bash -c "export ETCDCTL_API=3 && ./etcdctl put fooxxx bar"
docker exec -i go-test bash -c "export ETCDCTL_API=3 && ./etcdctl --endpoints=127.0.0.1:2379,172.17.0.6:2379 get fooxxx"

rem docker run -it --rm  --name go-test1  golang /root/etcd-master/bin/etcd
rem docker run -it --rm  --name go-test1  golang ps aux



docker tag docker-go:latest golang:latest

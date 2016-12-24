+ redis
    + 验证高并发情况下,redis的get不到再set是否会重复set **答案是不安全** (redis/GetandSet.php)
    + 验证高并发情况下,setnx逻辑是否安全 **答案是安全** (redis/GetAndSetNX.php)
    + 高并发下队列读写,是否会重复多读出 **答案是安全**

+ kafka 
    + 搭建单机服务,按照官方demo运行一遍  https://kafka.apache.org/quickstart
    + 测试php 扩展操作 https://github.com/arnaud-lb/php-rdkafka
    + **由于docker php7/7.1 下编译出来的 rdkafka 扩展完全不能用,暂停工程**

+ etcd 
    + 用法参考 http://lisux.me/lishuai/wp-content/2014/10/etcd%E5%AE%9E%E7%8E%B0%E6%9C%8D%E5%8A%A1%E5%8F%91%E7%8E%B0.pdf
    + 客户端采用 光秃秃的 curl 请求分析
    + 做在docker启动脚本上,while(true) { 命令 sleep 1;} 发现和上次有改动,重新生成配置,然后reload服务
    + 配置:-initial-cluster etcd0=http://172.22.0.2:2380,etcd1=http://172.22.0.3:2380 (必须一次性把所有ip列上去)
    + --listen-client-urls http://0.0.0.0:2379 这个必须写成 0.0.0.0
    + 采用Discovery服务,外网服务忙,起不来也不靠谱
    + 客户端直接连接源服务器进行读取,不要加多余的proxy, proxy只支持 v2,完全不能用
    

+ jenkins
    + doceke启动服务,8080端口
    + 安装密码看日志: Please use the following password to proceed to installation:
               c1b963dc7ff146e89a934d103fe57bed
    +
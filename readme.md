+ redis
    + 验证高并发情况下,redis的get不到再set是否会重复set **答案是不安全** (redis/GetandSet.php)
    + 验证高并发情况下,setnx逻辑是否安全 **答案是不安全** (redis/GetAndSetNX.php)
    + 高并发下队列读写,是否会重复
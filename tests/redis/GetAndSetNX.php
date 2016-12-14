<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-12-14
 * Time: 下午 6:20
 */

namespace xltxlm\verification\tests\redis;


use PHPUnit\Framework\TestCase;
use Predis\Client;

class GetAndSetNX extends TestCase
{
    public function test1()
    {
        $key = "abcnx";
        $date = microtime(true);
        $redis = (new Client("tcp://127.0.0.1:6379"));
        if ($redis->setnx($key, $date)) {
            usleep(rand(100000, 5000000));
            file_put_contents(__DIR__ . '/lognx.txt', $date . "\n", FILE_APPEND);
        }
    }
}
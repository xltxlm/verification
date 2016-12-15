<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-12-14
 * Time: 下午 2:15
 */

namespace xltxlm\verification\tests\redis;

use PHPUnit\Framework\TestCase;
use Predis\Client;

class GetandSetTest extends TestCase
{
    public function test1()
    {
        $key = "abc";
        $date = microtime(true);
        $redis = (new Client("tcp://127.0.0.1:6379"));
        if (empty($redis->get($key))) {
            usleep(rand(10000,5000000));
            $redis->set($key, $date);
            file_put_contents(__DIR__ . '/log.txt', $date . "\n", FILE_APPEND);
        }
    }
}

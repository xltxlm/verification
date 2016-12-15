<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-12-14
 * Time: 下午 6:51
 */

namespace xltxlm\verification\tests\redis;

use PHPUnit\Framework\TestCase;
use Predis\Client;

class ListTest extends TestCase
{
    public function test1()
    {
        $key = "list";
        $redis = (new Client("tcp://127.0.0.1:6379"));
        $var = $redis->rpop($key);
        if ($var) {
            file_put_contents(__DIR__ . '/list.txt', $var . "\n", FILE_APPEND);
        }
    }
}

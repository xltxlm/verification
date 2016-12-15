<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-12-15
 * Time: 上午 11:04
 */

namespace xltxlm\verification\tests\kafka;

use PHPUnit\Framework\TestCase;

class RdkafkaTest extends TestCase
{

    public function test0()
    {
        echo "<pre>-->";print_r('aaa');echo "<--@in ".__FILE__." on line ".__LINE__."\n";
    }

    public function test1()
    {
        gc_disable();
        $rk = new \RdKafka\Producer();
        die;
        $rk->setLogLevel(LOG_DEBUG);
        $rk->addBrokers("kafka");
    }
}

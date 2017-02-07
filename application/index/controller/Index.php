<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        echo "Hello world";
    }

    public function test()
    {
        return $this->fetch('test/test2');
    }

    public function test1()
    {
        return $this->fetch('test/test1');
    }
}

<?php

namespace app\admin\controller;
use app\admin\model\Node;
use think\Controller;

class Base extends Controller
{
    //免检测方法
    protected $pubRule = [
        'admin/student/getCourse',
        'admin/student/getClass',
        'admin/student/getRoom',
        'admin/student/getTeacher',
    ];

    public function _initialize()
    {
        if(!session('uid')){
            $this->redirect(url('login/index'));
        }
        
        $auth = new \com\Auth();
    
        $module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action     = strtolower(request()->action());
        $url        = $module."/".$controller."/".$action;

        //跳过检测以及主页权限
        if (session('uid')!=1) {
            if (!in_array($url, ['admin/index/index','admin/index/indexpage'])) {
                if (!$auth->check($url,session('uid')) && !in_array($url, $this->getPubRule())) {
                    $this->error('抱歉，您没有操作权限');
                }
            }
        }
        
        $node = new Node();

        $this->assign([
            'username' => session('username'),
            'menu' => $node->getMenu(session('rule')),
            'rolename' => session('rolename')
        ]);

    }

    private function getPubRule()
    {
        foreach ($this->pubRule as &$value) {
            $value = strtolower($value);
        }
        return $this->pubRule;
    }

    //接口简单信息返回处理
    public function Prompt($code = 1, $message) {
        return [
            'code' => $code,
            'message' => $message,
        ];
    }
}
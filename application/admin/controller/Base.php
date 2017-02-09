<?php

namespace app\admin\controller;
use app\admin\model\Node;
use think\Controller;

class Base extends Controller
{
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
        if(session('uid')!=1){

            if(!in_array($url, ['admin/index/index','admin/index/indexpage'])){
                if(!$auth->check($url,session('uid'))){
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

    public function Prompt($code = 1, $message) {
        return [
            'code' => $code,
            'message' => $message,
        ];
    }
}
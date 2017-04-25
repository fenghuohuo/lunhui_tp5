<?php

namespace app\admin\controller;
use app\admin\model\UserType;
use think\Controller;
use think\Db;
use org\Verify;

class Login extends Controller
{
    //登录页面
    public function index()
    {
        return $this->fetch('/login');
    }

    //登录操作
    public function doLogin()
    {
        $username = input("param.username");
        $password = input("param.password");
        $code = input("param.code");

        $result = $this->validate(compact('username', 'password', "code"), 'AdminValidate');
        if(true !== $result){
            return json(['code' => -5, 'data' => '', 'msg' => $result]);
        }

        //测试阶段 取消校验 验证码
//        $verify = new Verify();
//        if (!$verify->check($code)) {
//
//            return json(['code' => -4, 'data' => '', 'msg' => '验证码错误']);
//        }

        $hasUser = db('admin')->where('username', $username)->find();
        if(empty($hasUser)){
            return json(['code' => -1, 'data' => '', 'msg' => '管理员不存在']);
        }

        if(md5(md5($password) . config('auth_key')) != $hasUser['password']){
            writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：密码错误',2);
            return json(['code' => -2, 'data' => '', 'msg' => '密码错误']);
        }

        if(1 != $hasUser['status']){
            writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：该账号被禁用',2);
            return json(['code' => -6, 'data' => '', 'msg' => '该账号被禁用']);
        }

        //获取该管理员的角色信息
        $user = new UserType();
        $info = $user->getRoleInfo($hasUser['groupid']);

        session('username', $username);
        session('uid', $hasUser['id']);
        session('rolename', $info['title']);  //角色名
        session('rule', $info['rules']);  //角色节点
        session('name', $info['name']);  //角色权限
  
        //更新管理员状态
        $param = [
            'loginnum' => $hasUser['loginnum'] + 1,
            'last_login_ip' => request()->ip(),
            'last_login_time' => time()
        ];

        Db::name('admin')->where('id', $hasUser['id'])->update($param);
        writelog($hasUser['id'],session('username'),'用户【'.session('username').'】登录成功',1);
        return json(['code' => 1, 'data' => url('index/index'), 'msg' => '登录成功']);
    }

    //验证码
    public function checkVerify()
    {
        $verify = new Verify();
        $verify->imageH = 32;
        $verify->imageW = 100;
		$verify->codeSet = '0123456789';
        $verify->length = 4;
        $verify->useNoise = false;
        $verify->fontSize = 14;
        return $verify->entry();
    }

    //退出操作
    public function loginOut()
    {
        session('username', null);
        session('uid', null);
        session('rolename', null);  //角色名
        session('rule', null);  //角色节点
        session('name', null);  //角色权限

        $this->redirect(url('index'));
    }

    //学生身份登陆
    public function loginFree()
    {
        $username = "学生1";
        $password = "123456";
        $code = "1234";
        $result = $this->validate(compact('username', 'password', 'code'), 'AdminValidate');
        if(true !== $result){
            return json(['code' => -5, 'data' => '', 'msg' => $result]);
        }

        $hasUser = db('admin')->where('username', $username)->find();
        if(empty($hasUser)){
            return json(['code' => -1, 'data' => '', 'msg' => '管理员不存在']);
        }

        if(md5(md5($password) . config('auth_key')) != $hasUser['password']){
            writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：密码错误',2);
            return json(['code' => -2, 'data' => '', 'msg' => '密码错误']);
        }

        if(1 != $hasUser['status']){
            writelog($hasUser['id'],$username,'用户【'.$username.'】登录失败：该账号被禁用',2);
            return json(['code' => -6, 'data' => '', 'msg' => '该账号被禁用']);
        }

        //获取该管理员的角色信息
        $user = new UserType();
        $info = $user->getRoleInfo($hasUser['groupid']);

        session('username', $username);
        session('uid', $hasUser['id']);
        session('rolename', $info['title']);  //角色名
        session('rule', $info['rules']);  //角色节点
        session('name', $info['name']);  //角色权限

        //更新管理员状态
        $param = [
            'loginnum' => $hasUser['loginnum'] + 1,
            'last_login_ip' => request()->ip(),
            'last_login_time' => time()
        ];

        Db::name('admin')->where('id', $hasUser['id'])->update($param);
        writelog($hasUser['id'],session('username'),'用户【'.session('username').'】登录成功',1);
        return json(['code' => 1, 'data' => url('index/index'), 'msg' => '登录成功']);
    }
}

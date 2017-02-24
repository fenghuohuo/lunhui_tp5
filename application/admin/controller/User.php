<?php

namespace app\admin\controller;
use app\admin\Model\UserModel;
use app\admin\model\UserType;
use app\admin\model\AuthGroupAccessModel;
use think\Db;

class User extends Base
{

    /**
     * [index 用户列表]
     * @return [type] [description]
     */
    public function index(){

        $key = input('key');
        $map = [];
        if ($key && $key !== "") {
            $map['username'] = ['like',"%" . $key . "%"];          
        }       
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = 10;// 获取总条数
        $count = Db::name('admin')->where($map)->count();//计算总页面
        $allpage = intval(ceil($count / $limits));
        $user = new UserModel();
        $lists = $user->getUsersByWhere($map, $Nowpage, $limits);
        foreach ($lists as $k => $v) {
            $lists[$k]['last_login_time']=date('Y-m-d H:i:s',$v['last_login_time']);
        }    
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('val', $key);
        if (input('get.page')) {
            return json($lists);
        }
        return $this->fetch();
    }


    /**
     * [userAdd 添加用户]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function userAdd()
    {
        if(request()->isAjax()){

            $tmp = [];
            $param = input('post.');
            $param['password'] = md5(md5($param['password']) . config('auth_key'));
            $user = new UserModel();
            $flag = $user->insertUser($param);

            $tmp['id'] = $user['id'];
            $tmp['groupid'] = $param['groupid'];
            $authGroupAccess = new AuthGroupAccessModel();
            $flagAuth = $authGroupAccess->addUser($tmp);

            writelog(session('id'),session('username'),'用户【'.$param['username'].'】添加成功',1);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $role = new UserType();
        $this->assign('role',$role->getRole());
        return $this->fetch();
    }


    /**
     * [userEdit 编辑用户]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function userEdit()
    {
        $user = new UserModel();

        if(request()->isAjax()){

            $param = input('post.');
            if(empty($param['password'])){
                unset($param['password']);
            }else{
                $param['password'] = md5($param['password']);
            }
            $flag = $user->editUser($param);
            writelog(session('id'),session('username'),'用户【'.$param['username'].'】编辑成功',1);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $role = new UserType();
        $this->assign([
            'user' => $user->getOneUser($id),
            'role' => $role->getRole()
        ]);
        return $this->fetch();
    }


    /**
     * [UserDel 删除用户]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function UserDel()
    {
        $id = input('param.id');
        $role = new UserModel();
        $flag = $role->delUser($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }



    /**
     * [user_state 用户状态]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function user_state()
    {
        $id = input('param.id');
        $status = Db::name('admin')->where(array('id'=>$id))->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = Db::name('admin')->where(array('id'=>$id))->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }
        else
        {
            $flag = Db::name('admin')->where(array('id'=>$id))->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    
    }
    


}
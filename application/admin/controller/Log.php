<?php

namespace app\admin\controller;
use app\admin\Model\LogModel;
use think\Db;

class Log extends Base
{

    /**
     * [operate_log 操作日志]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function operate_log()
    {
        $key = input('key');
        $map = [];
        if($key&&$key!=="")
        {
            $map['admin_name'] = ['like',"%" . $key . "%"];          
        }       

        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = 10;// 获取总条数
        $count = Db::name('log')->where($map)->count();//计算总页面
        $allpage = intval(ceil($count / $limits));
        $lists = Db::name('log')->where($map)->page($Nowpage, $limits)->order('add_time desc')->select();
        foreach($lists as $k=>$v)
        {
            $lists[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
        }    
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('count', $count);
        $this->assign('val', $key);
        if(input('get.page'))
        {
            return json($lists);
        }

        return $this->fetch();
    }


    /**
     * [del_log 删除日志]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function del_log()
    {
        $log_id = input('param.log_id');
        $log = new LogModel();
        $flag = $log->delLog($log_id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }


 
}
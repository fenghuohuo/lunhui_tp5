<?php
/**
 * User: ZXB
 * Date: 2017/2/24
 * Time: 18:11
 */

namespace app\admin\model;
use think\Model;

class AuthGroupAccessModel extends Model
{
    protected $name = 'auth_group_access';

    /**
     * @name 添加用户关联
     * @param $param
     * @return array
     */
    public function addUser($param)
    {
        try{
            $result = $this->save($param);
            if(false === $result){
                writelog(session('uid'),session('username'),'用户【'.session('username').'】添加用户关联失败',2);
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                writelog(session('uid'),session('username'),'用户【'.session('username').'】添加用户关联成功',1);
                return ['code' => 1, 'data' => '', 'msg' => '添加用户成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}
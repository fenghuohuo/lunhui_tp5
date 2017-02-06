<?php
/**
 * Created by PhpStorm.
 * User: zxb
 * Date: 2016/11/7
 * Time: 12:13
 */
namespace app\admin\model;
use think\Model;
use think\Db;

class StudentModel extends Model
{
    protected $name = 'student';

    public function getOneCate($id)
    {
        return $this->where('id', $id)->find();
    }

}
<?php
/**
 * User: ZXB
 * Date: 2017/1/18
 * Time: 16:27
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class ClassModel extends Model
{
    protected $name = 'class';

    /**
     * @name 获取班级
     * @return array
     */
    public function getClass()
    {

        $course = $this::column('id,major,class');

        return $course;
    }
}
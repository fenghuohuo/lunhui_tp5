<?php
/**
 * User: ZXB
 * Date: 2017/1/18
 * Time: 13:25
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class TeacherModel extends Model
{
    protected $name = 'Teacher';

    /**
     * @name 获取教师信息
     * @return array
     */
    public function getTeacher($num = '')
    {
        $query = '1=1';
        if (!empty($num)) {
            $tmp = new TeacherCidModel();
            $tid = $tmp->getTNum($num);
            $tid = implode(',', $tid);
            $query .= " AND id IN($tid)";
        }
        $course = $this::where($query)->column('id,name');

        return $course;
    }
}
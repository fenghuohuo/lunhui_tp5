<?php
/**
 * User: ZXB
 * Date: 2017/1/16
 * Time: 14:33
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class TeacherCidModel extends Model
{
    protected $name = 'teacher_cid';

    /**
     * @name 获取教师号
     * @return array
     */
    public function getTNum($num = '')
    {
        $query = "1=1";
        if(!empty($num)) {
            $query .= " AND cid = $num";
        }
        $teachers = $this::where($query)->column('tnum');

        return array_unique($teachers);
    }

    /**
     * @name 获取课程号
     * @return array
     */
    public function getCNum($teacher = '')
    {
        $query = "1=1";
        if(!empty($teacher)) {
            $query .= " AND tnum = $teacher";
        }
        $teachers = $this::where($query)->column('cid');

        return array_unique($teachers);
    }
}
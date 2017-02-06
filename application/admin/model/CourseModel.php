<?php
/**
 * User: ZXB
 * Date: 2017/1/13
 * Time: 14:53
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class CourseModel extends Model
{
    protected $name = 'course';

    /**
     * @name 获取课程
     * @return array
     */
    public function getCourse($teacher = '')
    {
        $query = '1=1';
        if (!empty($teacher)) {
            $tmp = new TeacherCidModel();
            $cid = $tmp->getCNum($teacher);
            $cid = implode(',', $cid);
            $query .= " AND cid IN($cid)";
        }
        $course = $this::where($query)->column('cid,cname');

        return $course;
    }
}
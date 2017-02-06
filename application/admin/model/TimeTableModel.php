<?php
/**
 * User: ZXB
 * Date: 2017/1/18
 * Time: 17:43
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class TimeTableModel extends Model
{
    protected $name = 'timetables';

    /**
     * @name 课程表信息
     * @return array
     */
    public function getTimeTables()
    {
        $timetables = $this::column('id,name');

        return $timetables;
    }
}
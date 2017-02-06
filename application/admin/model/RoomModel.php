<?php
/**
 * User: ZXB
 * Date: 2017/1/18
 * Time: 18:29
 */

namespace app\admin\model;

use think\Model;
use think\Db;

class RoomModel extends Model
{
    protected $name = 'room';

    /**
     * @name 课程表信息
     * @return array
     */
    public function getRooms()
    {
        $rooms = $this::column('id,room');

        return $rooms;
    }
}
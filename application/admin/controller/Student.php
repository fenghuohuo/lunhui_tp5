<?php
/**
 * Created by PhpStorm.
 * User: zxb
 * Date: 2016/11/7
 * Time: 12:23
 */
namespace app\admin\controller;

use app\admin\model\ClassModel;
use app\admin\model\CourseModel;
use app\admin\model\RoomModel;
use app\admin\model\TeacherModel;
use app\admin\model\TimeTableModel;
use think\Db;

class Student extends Base
{
    /**
     * @return mixed
     * @name课程列表
     */
    public function index()
    {
        $classid = isset($_GET['class']) ? $_GET['class'] : '';
        $class = $classid;
        if ($classid) {
            $class = Classmodel::get($classid);
            $class = $class->major . $class->class;
        }

        $this->getTimeTable($classid);
        $this->assign('class', $class);
        $this->assign('classid', $classid);

        return $this->fetch('student/index');
    }

    private function getTimeTable($class)
    {
        $list = [];
        if ($class) {
            $timetable = TimeTablemodel::all(['classid' => $class]);

            foreach ($timetable as $value) {
                $cid = $value['cid'];
                $roomid = $value['room'];
                $room = Roommodel::where('id', $roomid)->column('room');
                $cname = Coursemodel::where('cid', $cid)->column('cname');

                $list[] = [
                    'week' => $value['week'],
                    'num' => $value['num'],
                    'room' => $room[0],
                    'cname' => $cname[0],
                ];
            }
            $list = $this::toTable($list);
        }

        $this->assign('list', $list);
    }

    public function insertView()
    {
        return $this->fetch('insert');
    }

    public function insert()
    {
        $course = $_POST['course'];
        $week = $_POST['week'];
        $parts = $_POST['part'];
        $teacher = $_POST['teacher'];
        $room = $_POST['room'];
        $isDouble = $_POST['isDouble'];//暂时未添加
        $class = $_POST['class'];

        foreach ($week as $value) {
            foreach ($parts as $part) {
                $timetable = new TimeTablemodel();
                $timetable->cid = $course;
                $timetable->classid = $class;
                $timetable->room = $room;
                $timetable->num = $part;
                $timetable->week = $value;
                $timetable->tid = $teacher;
                try {
                    $ret = $timetable->save();
                } catch (\Exception $e) {
                    return $this->Prompt(-1, "保存失败：" . $e->getMessage());
                }
            }
        }

        return $this->Prompt(1, "保存成功!");
    }

    /**
     * @name 修改视图
     * @return mixed
     */
    public function editView()
    {
        $time = $_GET['time'];
        $time = explode(" ", $time);

        if (count($time) != 2) {
            return $this->Prompt(-1, "time异常!");
        }

        $week = $time[0];
        $num = $time[1];

        $timeTable = new TimeTablemodel();
        $timeTable = $timeTable
            ->where('week', $week)
            ->where('num', $num)
            ->find();

        if ($timeTable) {
            $cid = $timeTable->cid;
            $cname = Coursemodel::get(['cid' => $cid]);
            $classid = $timeTable->classid;
            $class = Classmodel::get(['id' => $classid]);
            $roomid = $timeTable->room;
            $room = Roommodel::get(['id' => $roomid]);
            $tid = $timeTable->tid;
            $teacher = Teachermodel::get(['id' => $tid]);
            $list = [
                'course' => [
                    'id' => $timeTable->cid,
                    'text' => $cname->cname,
                ],
                'class' => [
                    'id' => $timeTable->classid,
                    'text' => $class->major . $class->class,
                ],
                'room' => [
                    'id' => $timeTable->room,
                    'text' => $room->room,
                ],
                'teacher' => [
                    'id' => $timeTable->tid,
                    'text' => $teacher->name,
                ],
            ];
        } else {
            return $this->Prompt(-1, "该时间无课程，请先添加!");
        }

        $this->assign('list', json_encode($list));
        return $this->fetch('edit');
    }

    /**
     * @name 课程修改
     * @return array
     */
    public function edit()
    {
        $time = isset($_POST['time']) ? $_POST['time'] : '';
        $course = isset($_POST['course']) ? $_POST['course'] : '';
        $teacher = isset($_POST['teacher']) ? $_POST['teacher'] : '';
        $room = isset($_POST['room']) ? $_POST['room'] : '';
        $isDouble = isset($_POST['isDouble']) ? $_POST['isDouble'] : '';//暂时未添加
        $class = isset($_POST['class']) ? $_POST['class'] : '';
        $time = explode(" ", $time);

        if (count($time) != 2) {
            return $this->Prompt(-1, "time异常!");
        }

        $week = $time[0];
        $num = $time[1];

        $timeTable = new TimeTablemodel();
        $timeTable = $timeTable
            ->where('week', $week)
            ->where('num', $num)
            ->find();

        if($timeTable->classid != $class) {
            return $this->Prompt(-1, "该教室已经被占用!");
        }

        $timeTable->cid = $course;
        $timeTable->room = $room;
        $timeTable->tid = $teacher;


        try {
            $ret = $timeTable->save();
        } catch (\Exception $e) {
            return $this->Prompt(-1, "保存失败");
        }

        return $this->Prompt(1, "保存成功");
    }

    /**
     * @name 课程删除
     * @throws \think\Exception
     */
    public function delete()
    {
        $time = $_POST['time'];
        $classid = $_POST['class'];

        $time = explode(" ", $time);
        if (count($time) != 2) {
            return $this->Prompt(-1, "time异常!");
        }

        $week = $time[0];
        $num = $time[1];

        $timeTable = new TimeTablemodel();
        $id = $timeTable
            ->where('week', $week)
            ->where('num', $num)
            ->where('classid', $classid)
            ->delete();

        if ($id) {
            return $this->Prompt(1, "删除成功");
        } else {
            return $this->Prompt(-1, "删除失败");
        }
    }

    /**
     * @name 学生查看课表
     */
    public function timetableStudent()
    {
        $classid = isset($_GET['class']) ? $_GET['class'] : '';
        $getclass = isset($_GET['getclass']) ? $_GET['getclass'] : 0;

        if ($getclass) {
            return $this->getCourse();
        }

        if ($classid) {
            $this->getTimeTable($classid);
            $class = Classmodel::get($classid);
            $this->assign('class', $class->major . $class->class);
            return $this->fetch('student/timetablestudent');
        } else {
            $this->assign('list', '');
            return $this->fetch('student/timetablestudent');
        }

    }

    /**
     * @name 获取课程
     * @return array
     */
    public function getCourse()
    {
        $course = new Coursemodel();
        $result = [];
        $table = $course->getCourse();

        foreach ($table as $key => $value) {
            $result[] = [
                'id' => $key,
                'text' => $value
            ];
        }

        return $result;
    }

    /**
     * @name 获取班级
     * @return array
     */
    public function getClass()
    {
        $course = new Classmodel();
        $result = [];
        $table = $course->getClass();

        foreach ($table as $key => $value) {
            $id = $value['id'];
            $value = "" . $value['major'] . $value['class'] . "";
            $result[] = [
                'id' => $id,
                'text' => $value
            ];
        }

        return $result;
    }

    /**
     * @name 获取教室
     * @return array
     */
    public function getRoom()
    {
        $course = new Roommodel();
        $table = $course->getRooms();
        $result = [];

        foreach ($table as $key => $value) {
            $result[] = [
                'id' => $key,
                'text' => $value
            ];
        }

        return $result;
    }

    /**
     * @name 获取教师
     * @return array
     */
    public function getTeacher()
    {
        $tmp = new Teachermodel();
        $num = $_GET['num'];
        $teachers = $tmp->getTeacher($num);
        $result = [];

        foreach ($teachers as $key => $value) {
            $result[] = [
                'id' => $key,
                'text' => $value
            ];
        }

        return $result;
    }

    /**
     * @name 数据转化为表格
     * @param $array
     * @return array
     */
    static function toTable($array)
    {
        $table = [];
        for ($j = 1; $j <= 5; $j++) {//节数
            for ($i = 1; $i <= 7; $i++) {//星期
                foreach ($array as $key => $value) {
                    if ($value['week'] == $i && (($value['num'] + 1) / 2) == $j) {
                        $table[$j][$i] = $array[$key];
                        break;
                    } else {
                        $table[$j][$i] = '';
                    }
                }
            }
        }

        return $table;
    }


    /**
     * 获取课程表(备用方案)
     */
    public function getTable()
    {
//        $url = 'http://sc.jwc.zjxu.edu.cn/xs_main.aspx?xh=201345509122';
//        $result = $this->curl_request($url,'',"ASP.NET_SessionId=q2hjgo0qyypea0mb5kdc135w");  //我们保存的cookies

        $data['vxn'] = "2016-2017";
        $data['vxq'] = "1";
        $data['vnj'] = "2013";
        $data['vxy'] = "南湖学院数理与信息工程系";
        $data['vbj'] = "网络N131";
        $data['vzyfx'] = '';
        $url = 'http://sc.jwc.zjxu.edu.cn/public/zykbcx.asp?';
        $url = $this->url_handle($url, $data);
        $result = $this->curl_request($url,'',"ASP.NET_SessionId=q2hjgo0qyypea0mb5kdc135w");

        $table_regular = '/<table.*?>[\s\S]*?<\/table>/';
        preg_match_all($table_regular, $result, $matches);
        $table = $matches[0][0];

        $data_regular = '/<td [\w\W]*?>([\w\W]*?)<\/td>/';
        preg_match_all($data_regular, $table, $data);

        $course = $data[1];

        $length = count($course);

        for ($i=0; $i < $length; $i++) {
            $course[$i] = str_replace("<br>", "", $course[$i]);
            $course[$i] = str_replace("</a>", "", $course[$i]);
            $course[$i] = str_replace("<a href=\"http://210.33.28.180/public/map.asp?xq=1&lh=\" target=\"_blank\">", "", $course[$i]);
            $course[$i] = str_replace("<a href=\"http://210.33.28.180/public/map.asp?xq=1&lh=3\" target=\"_blank\">", "", $course[$i]);
            $course[$i] = str_replace("<a href=\"http://210.33.28.180/public/map.asp?xq=1&lh=4\" target=\"_blank\">", "", $course[$i]);
        }

        $course = $this->converttoTable($course);
        foreach ($course as &$value) {
            foreach ($value as &$v) {
                if ($v) {
                    if (is_array($v)) {
                        foreach ($v as &$v1) {
                            $encode  = mb_detect_encoding($v1, ['ASCII','UTF-8','GB2312','GBK','BIG5']);
                            if ($encode == 'EUC-CN'){
                                $v1 = iconv('gb2312', 'utf-8' , $v1);
                            }
                        }
                        unset($v1);
                    } else {
                        $encode  = mb_detect_encoding($v, ['ASCII','UTF-8','GB2312','GBK','BIG5']);
                        if ($encode == 'EUC-CN'){
                            $v = iconv('gb2312', 'utf-8' , $v);
                        }
                    }
                }
            }
            unset($v);
        }
        unset($value);
        $this->assign('list', $course);
        return json_encode($course);
    }

    /**
     * @name url请求
     * @param $url
     * @param string $post(不填则为GET)
     * @param string $cookie(提交的$cookies)
     * @param int $returnCookie(是否返回$cookies)
     * @return mixed|string
     */
    public function curl_request($url,$post='',$cookie='', $returnCookie=0){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36');
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        curl_setopt($curl, CURLOPT_REFERER, $url);
        if($post) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post));
        }
        if($cookie) {
            curl_setopt($curl, CURLOPT_COOKIE, $cookie);
        }
        curl_setopt($curl, CURLOPT_HEADER, $returnCookie);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($curl);
        if (curl_errno($curl)) {
            return curl_error($curl);
        }
        curl_close($curl);
        if($returnCookie){
            list($header, $body) = explode("\r\n\r\n", $data, 2);
            preg_match_all("/Set\-Cookie:([^;]*);/", $header, $matches);
            $info['cookie']  = substr($matches[1][0], 1);
            $info['content'] = $body;
            return $info;
        }else{
            return $data;
        }
    }

    /**
     * @name url处理
     * @param $url
     * @param $data
     * @return string
     */
    public function url_handle($url, $data)
    {
        $result = $url;

        foreach($data as $key => $value) {
            $value = mb_convert_encoding ( $value , 'gb2312', 'utf-8' );
            $value = urlencode($value);
            $result = $result . $key . "=" . $value ."&";
        }

        return rtrim($result, '&');
    }

    /**
     * @name 数据转化成数组
     * @param $table
     * @return array
     */
    function converttoTable($table)
    {
        $week = ["mon"=>"","tues"=>"","wed"=>"","thur"=>"","fri"=>"","sat"=>"","sun"=>""];
        $order = ['1,2','3,4','5,6','7,8','9,10'];
        $list = [];

        //创建课程表
        foreach ($order as $key) {
            $list = array_merge($list, [$key => $week]);
        }

        $table = array_slice($table, 10, -1);  //删除表头
        array_splice($table, 42, 10);  //删除晚上一行
        array_splice($table, 33, 1);  //7 8 节
        array_splice($table, 15, 11); //删除中午
        array_splice($table, 7, 1);  //删除3 4节

        foreach($table as $key => $value) {
            $hr = '<hr>';
            if(strpos($value, $hr)) {
                $table[$key] = explode($hr, $value);
            }
        }

        $i = 0;
        foreach($list as $key => &$value) {
            $j = 0;
            foreach($value as $key1 => &$value1) {
                $value1 = $table[$i*7+$j];
                $j++;
            }
            unset($value1);
            $i++;
        }
        unset($value);

        return $list;
    }

}

<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\student\index.html";i:1488787521;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\header.html";i:1488787521;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\footer.html";i:1488787521;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/static/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/admin/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="/static/admin/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="/static/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="__CSS__/select2.css" rel="stylesheet">
    <link href="__CSS__/toastr.min.css" rel="stylesheet">
    <link href="__CSS__/bootstrap-switch/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">

    <style type="text/css">
    .long-tr th{
        text-align: center
    }
    .long-td td{
        text-align: center
    }
    </style>
</head>

<body class="gray-bg">
    <div class="form-group" style="width: 200px; background-color: gray;">
        <div class="input-group">
            <div class="input-group-addon" >班级</div>
            <select id="getClass" class="select2-search__field form-control" name="class">
            </select>
        </div>
    </div>
    <div class="text-left">
        <h1 class="text-center">
            课程表
        </h1>
        <h3>
            <?php if(!empty($class)): ?>
                <?php echo $class; endif; ?>
        </h3>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight" name="timetable">
    <div class="ibox float-e-margins">
        <div class="example-wrap">
            <div class="example">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="long-tr">
                        <th colspan="2" ></th>
                        <th colspan="2">星期一</th>
                        <th colspan="2">星期二</th>
                        <th colspan="2">星期三</th>
                        <th colspan="2">星期四</th>
                        <th colspan="2">星期五</th>
                        <th colspan="2">星期六</th>
                        <th colspan="2">星期日</th>
                    </tr>
                    </thead>
                    <tbody id="timetables">
                        <tr>
                            <td rowspan="2" width="20px">上午</td>
                            <td >第12节</td>
                            <?php if(!empty($list)): if(is_array($list[1]) || $list[1] instanceof \think\Collection): if( count($list[1])==0 ) : echo "" ;else: foreach($list[1] as $key=>$vo): if(!empty($vo)): ?>
                                        <td>
                                            <?php echo $vo['room']; ?><br/>
                                            <?php echo $vo['cname']; ?>
                                            <div style="display: none" name="time"><?php echo $vo['week'] . " " . $vo['num']; ?></div>
                                        </td>
                                        <td class="text-left" style="width: 50px">
                                            <button type="button" name="edit" class="btn btn-warning"  value="1">修改</button>
                                            <button type="button" name="delete" class="btn btn-danger">删除</button>
                                        </td>
                                    <?php endif; if(empty($vo)): ?>
                                        <td colspan="2"></td>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; if(empty($list)): ?>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                            <?php endif; ?>
                        </tr>
                        <tr>
                            <td width="20px" class="">第34节</td>
                            <?php if(!empty($list)): if(is_array($list[2]) || $list[2] instanceof \think\Collection): if( count($list[2])==0 ) : echo "" ;else: foreach($list[2] as $key=>$vo): if(!empty($vo)): ?>
                                        <td>
                                            <?php echo $vo['room']; ?><br/>
                                            <?php echo $vo['cname']; ?>
                                            <div style="display: none" name="time"><?php echo $vo['week'] . " " . $vo['num']; ?></div>
                                        </td>
                                        <td class="text-right" style="width: 50px">
                                            <button type="button" name="edit" class="btn btn-warning">修改</button>
                                            <button type="button" name="delete" class="btn btn-danger">删除</button>
                                        </td>
                                    <?php endif; if(empty($vo)): ?>
                                        <td colspan="2"></td>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; if(empty($list)): ?>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                            <?php endif; ?>
                        </tr>
                        <tr>
                            <td rowspan="2" width="20px">下午</td>
                            <td >第56节</td>
                            <?php if(!empty($list)): if(is_array($list[3]) || $list[3] instanceof \think\Collection): if( count($list[3])==0 ) : echo "" ;else: foreach($list[3] as $key=>$vo): if(!empty($vo)): ?>
                                        <td>
                                            <?php echo $vo['room']; ?><br/>
                                            <?php echo $vo['cname']; ?>
                                            <div style="display: none" name="time"><?php echo $vo['week'] . " " . $vo['num']; ?></div>
                                        </td>
                                        <td class="text-right" style="width: 50px">
                                            <button type="button" name="edit" class="btn btn-warning">修改</button>
                                            <button type="button" name="delete" class="btn btn-danger">删除</button>
                                        </td>
                                    <?php endif; if(empty($vo)): ?>
                                        <td colspan="2"></td>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; if(empty($list)): ?>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                            <?php endif; ?>
                        </tr>
                        <tr>
                            <td width="20px" class="">第78节</td>
                            <?php if(!empty($list)): if(is_array($list[4]) || $list[4] instanceof \think\Collection): if( count($list[4])==0 ) : echo "" ;else: foreach($list[4] as $key=>$vo): if(!empty($vo)): ?>
                                        <td>
                                            <?php echo $vo['room']; ?><br/>
                                            <?php echo $vo['cname']; ?>
                                            <div style="display: none" name="time"><?php echo $vo['week'] . " " . $vo['num']; ?></div>
                                        </td>
                                        <td class="text-right" style="width: 50px">
                                            <button type="button" name="edit" class="btn btn-warning">修改</button>
                                            <button type="button" name="delete" class="btn btn-danger">删除</button>
                                        </td>
                                    <?php endif; if(empty($vo)): ?>
                                        <td colspan="2"></td>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; if(empty($list)): ?>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                            <?php endif; ?>
                        </tr>
                        <tr>
                            <td colspan="2">晚上</td>
                            <?php if(!empty($list)): if(is_array($list[5]) || $list[5] instanceof \think\Collection): if( count($list[5])==0 ) : echo "" ;else: foreach($list[5] as $key=>$vo): if(!empty($vo)): ?>
                                        <td>
                                            <?php echo $vo['room']; ?><br/>
                                            <?php echo $vo['cname']; ?>
                                            <div style="display: none" name="time"><?php echo $vo['week'] . " " . $vo['num']; ?></div>
                                        </td>
                                        <td class="text-right" style="width: 50px">
                                            <button type="button" name="edit" class="btn btn-warning">修改</button>
                                            <button type="button" name="delete" class="btn btn-danger">删除</button>
                                        </td>
                                    <?php endif; if(empty($vo)): ?>
                                        <td colspan="2"></td>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; if(empty($list)): ?>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                            <?php endif; ?>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

<script src="/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/static/admin/js/content.min.js?v=1.0.0"></script>
<script src="/static/admin/js/plugins/chosen/chosen.jquery.js"></script>
<script src="/static/admin/js/plugins/iCheck/icheck.min.js"></script>
<script src="/static/admin/js/plugins/layer/laydate/laydate.js"></script>
<script src="/static/admin/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="/static/admin/js/plugins/switchery/switchery.js"></script><!--IOS开关样式-->
<script src="/static/admin/js/jquery.form.js"></script>
<script src="/static/admin/js/layer/layer.js"></script>
<script src="/static/admin/js/laypage/laypage.js"></script>
<script src="/static/admin/js/laytpl/laytpl.js"></script>
<script src="/static/admin/js/select2.full.js"></script>
<script src="/static/admin/js/select2.js"></script>
<script src="/static/admin/js/i18n/es.js"></script>
<script src="/static/admin/js/i18n/zh-CN.js"></script>
<script src="__JS__/bootstrap-switch.js"></script>
<script src="__JS__/toastr.min.js"></script>
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>

<script type="text/javascript">

    $(function () {
        toastr.options.positionClass = 'toast-bottom-center';

        $('#getClass').select2({
            multiple: false,
            placeholder: '选择班级',
            tags: true,
            ajax: {
                url: '<?php echo url("student/getClass"); ?>',
                dataType: 'json',
                delay: 50,
                data: function (item) {
                    return item
                },
                processResults: function (data, page) {
                    return {
                        results: data
                    }
                },
                cache: true
            },
            minimumInputLength: 0,
            templateResult: function(item){ return '<span style="font-size:8px">' + item .text + '</span>'},
            templateSelection: function(item) { return item.text },
            escapeMarkup: function (markup) { return markup;},
        });

        $('#getClass').change(function () {
            var Class = $(this).val();
            var text = $(this).text();
            $.ajax({
                url: '<?php echo url("student/index"); ?>',
                type: 'get',
                dataType: 'json',
                data: {
                    class: Class,
                },
                success: function(data) {
                    $('body').html(data);
                }
            });
        });

        //修改按钮
        $("[name='edit']").click( function (){
            var time = $(this).parent().prev().find("[name='time']").text();//格式：星期 节数
            var url = '<?php echo url("student/editView"); ?>' + "?time=" + time;

            layer.open({
                type:2,
                area:['600px','350px'],
                title:'修改课程',
                shade:0.6,
                anim:2,
                btn: ['确定', '取消'],
                content:url,
                yes : function(index, layero) {
                    var data = $(layero).find("iframe")[0].contentWindow.getData();
                    console.log(data);
                    function error(code){
                        $(layero).find("iframe")[0].contentWindow.error(code);
                    } 
                    if (data['course'] && data['teacher'] && data['class'] && data['room']) {
                        $.ajax({
                            url: '<?php echo url("student/edit"); ?>',
                            type: 'post',
                            dataType: 'json',
                            asycn: 'true',
                            data: {
                                'time' : time,
                                'course': data['course'],
                                'teacher': data['teacher'],
                                'isDouble': data['isDouble'],
                                'class': data['class'],
                                'room': data['room'],
                            },
                            success: function(data) {
                                if (data.code < 0) {
                                    error(data);
                                } else {
                                    layer.close(index);
                                    toastr.success(data.message);
                                    console.log('<?php echo $class; ?>');
                                    setTimeout(function () {
                                        $.ajax({
                                            url: '<?php echo url("student/index"); ?>',
                                            type: 'get',
                                            dataType: 'json',
                                            data: {
                                                class: parseInt('<?php echo $class; ?>'),
                                            },
                                            success: function(data) {
                                                $("body").html(data);
                                            }
                                        });
                                    }, 500);
                                }
                            },
                            error: function(data) {
                                return data;
                            }
                        });
                    } else {
                        var error_data = new Array();
                        error_data['code'] = -1 ;
                        error_data['message'] = "请输入数据！";
                        error(error_data);
                    }

                },
                no : function (index, layero) {
                    layer.close(layero);
                }
            });

        });

        //删除按钮
        $("[name='delete']").click(function (){
            var time = $(this).parent().prev().find("[name='time']").text();
            $.ajax({
                url: '<?php echo url("student/delete"); ?>',
                type: 'post',
                dataType: 'json',
                data: {
                    'class': parseInt('<?php echo $classid; ?>'),
                    'time': time,
                },
                success: function(data) {
                    if (data.code > 0)
                        toastr.success(data.message);
                    else 
                        toastr.error(data.message);
                    var class_id = parseInt('<?php echo $classid; ?>');
                    console.log(class_id);
                    setTimeout(function () {
                        $.ajax({
                            url: '<?php echo url("student/index"); ?>',
                            type: 'get',
                            dataType: 'json',
                            data: {
                                class: class_id,
                                time: time,
                            },
                            success: function(data) {
                                $("body").html(data);
                            }
                        });
                    }, 500);
                },
                error: function(data){
                    toastr.error(data.code, data.message);
                }
            });
        })

    })

</script>


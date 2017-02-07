<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\WWW\lunhui_tp5\public/../application/admin\view\student\insert.html";i:1486454085;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\header.html";i:1484803729;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\footer.html";i:1484803761;}*/ ?>
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
    <div class="wrapper wrapper-content animated fadeInRight">
        <form class="form" role="form" >
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">课程</div>
                    <select id="getCourse" class="select2-search__field form-control" name="course" >
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">班级</div>
                    <select id="getClass" class="select2-search__field form-control" name="class">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">星期</div>
                    <select id="getTime" class="select2-search__field form-control" name="week" multiple="multiple" >
                        <option value="0">选择时间</option>
                        <option value="1">星期一</option>
                        <option value="2">星期二</option>
                        <option value="3">星期三</option>
                        <option value="4">星期四</option>
                        <option value="5">星期五</option>
                        <option value="6">星期六</option>
                        <option value="7">星期日</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">节数</div>
                    <select id="getPart" class="select2-search__field form-control" name="part" multiple="multiple" >
                        <option value="0">选择节数</option>
                        <option value="1">1，2</option>
                        <option value="3">3，4</option>
                        <option value="5">5，6</option>
                        <option value="7">7，8</option>
                        <option value="9">晚自修</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">教室</div>
                    <select id="getRoom" class="select2-search__field form-control" name="room">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">教师</div>
                    <select id="getTeacher" class="select2-search__field form-control" name="teacher">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">是否单双周</div>
                    <div class="switch"  >
                        <input id="isDouble" type="checkbox" name="isDouble" value="true"/>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-info">确定</button>
        </form>
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
    /**
     * @name 课程选择
     */
    $("#getCourse").select2({
        placeholder: "选择课程",
        multiple: false,
        tags: true,
        ajax: {
            url: '<?php echo url("student/getCourse"); ?>',
            dataType: 'json',
            delay: 50,
            data: function (item) {
                return {
                    item: item,
                }
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

    $("#getClass").select2({
        placeholder: "选择班级",
        multiple: false,
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

    $("#getTime").select2({
        placeholder: "选择时间",
        tags: true,
    });

    $("#getPart").select2({
        placeholder: "选择节数",
        tags: true,
    });

    $("#getTeacher").select2({
        placeholder: "选择教师",
        multiple: false,
        tags: true,
        ajax: {
            url: '<?php echo url("student/getTeacher"); ?>',
            dataType: 'json',
            delay: 50,
            type: 'get',
            data: function (item) {
                return {
                    item: item,
                    num: $("#getCourse").val()
                }
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

    $("#getRoom").select2({
        placeholder: "选择教室",
        multiple: false,
        tags: true,
        ajax: {
            url: '<?php echo url("student/getRoom"); ?>',
            dataType: 'json',
            delay: 50,
            type: 'get',
            data: function (item) {
                return {
                    item: item,
                    weeks: $("[name = 'week']").select2('val'),
                    parts: $("[name = 'part']").select2('val'),
                }
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

    $("#isDouble").bootstrapSwitch({
        onText:"单周",
        offText:"双周",
        onColor:"info",
        offColor:"success",
        onSwitchChange:function(event, state){
            if(state==true){
                $(this).val(false);
            }else{
                $(this).val(true);
            }
        }
    })

    $("button").click(function() {
        $.ajax({
            url: '<?php echo url("student/insert"); ?>',
            type: 'post',
            dataType: 'json',
            asycn: 'true',
            data: {
                'course': $("[name = 'course']").val(),
                'week': $("[name = 'week']").select2('val'),
                'part': $("[name = 'part']").select2('val'),
                'teacher': $("[name = 'teacher']").val(),
                'isDouble': $("[name = 'isDouble']").val(),
                'class': $("[name = 'class']").val(),
                'room': $("[name = 'room']").val(),
            },
            success: function(data) {
                toastr.error(data.code, data.message);
            },
            error: function(data) {
                return data;
            }
        });
    });

})
</script>

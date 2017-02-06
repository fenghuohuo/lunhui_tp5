<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"D:\WWW\lunhui_tp5\public/../application/admin\view\data\index.html";i:1477648368;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\header.html";i:1477268745;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\footer.html";i:1477268745;}*/ ?>
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

    <style type="text/css">
    .long-tr th{
        text-align: center
    }
    .long-td td{
        text-align: center
    }
    </style>
</head>
<link href="__CSS__/plugins/iCheck/custom.css" rel="stylesheet">
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>数据库备份</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-9 m-b-xs">
                        <button class="btn btn-outline btn-primary" href="javascript:;" id="export">立即备份</button>
                        <button id="optimize" class="btn btn-outline btn-info " url="<?php echo url('optimize'); ?>" >优化表</button>
                        <button id="repair" class="btn btn-outline btn-danger" url="<?php echo url('repair'); ?>" >修复表</button>
                    </div>
                </div>
                <form id="export-form" method="post" action="<?php echo url('export'); ?>">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><input class="i-checks checkbox check-all" checked="chedked" type="checkbox"></th>
                                <th>表名</th>
                                <th>数据量</th>
                                <th>数据大小</th>
                                <th>创建时间</th>
                                <th>备份状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(!(empty($data) || ($data instanceof \think\Collection && $data->isEmpty()))): if(is_array($data) || $data instanceof \think\Collection): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                <tr>
                                    <td><input class="ids i-checks" checked="chedked" type="checkbox" name="ids[]" value="<?php echo $vo['name']; ?>"></td>
                                    <td><?php echo $vo['name']; ?></td>
                                    <td>【<?php echo $vo['rows']; ?>】 条记录</td>
                                    <td><?php echo format_bytes($vo['data_length']); ?></td>
                                    <td><?php echo $vo['create_time']; ?></td>
                                    <td id="info">等待备份...</td>
                                    <td>
                                        <a class="btn btn-primary btn-xs btn-outline" href="<?php echo url('optimize',['ids'=>$vo['name']]); ?>">优化表</a>
                                        <a class="btn btn-danger btn-xs btn-outline" href="<?php echo url('repair',['ids'=>$vo['name']]); ?>">修复表</a>
                                    </td>
                                </tr>
                                <?php endforeach; endif; else: echo "" ;endif; else: ?>
                                <td colspan="7" class="text-center"> 暂未发现数据库表! </td>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Panel Other -->
</div>

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
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>

<script type="text/javascript">

//全选的实现
$('.check-all').on('ifChecked', function (event) {
    $('input[name="ids[]"]').iCheck('check');
});
$('.check-all').on('ifUnchecked', function (event) {
    $('input[name="ids[]"]').iCheck('uncheck');
});
    $(function () {
     
        (function ($) {
            var $form = $("#export-form"), $export = $("#export"), tables, $optimize = $("#optimize"), $repair = $("#repair");
            $optimize.add($repair).click(function () {
                $.post($(this).attr('url'), $form.serialize(), function (data) {
                    if (data.code) {
                        layer.msg(data.msg,{icon:1,time:2000,shade: 0.1,});
                    } else {
                        layer.msg(data.msg,{icon:2,time:2000,shade: 0.1,});
                    }
                });
                return false;
            });

            $export.click(function () {
                $export.parent().children().prop('disabled', true);
                $export.html("正在发送备份请求...");
                $.post(
                        $form.attr("action"),
                        $form.serialize(),
                        function (data) {
                            if (data.code) {
                                tables = data.data.tables;
                                $export.html(data.msg + "开始备份，请不要关闭本页面！");
                                backup(data.data.tab);
                                window.onbeforeunload = function () {
                                    return "正在备份数据库，请不要关闭！";
                                };
                            } else {
                                layer.msg(data.msg,{icon:2,time:2000,shade: 0.1,});
                                $export.html("立即备份");
                                setTimeout(function () {
                                    $export.parent().children().prop('disabled', false);
                                }, 1500);
                            }
                        });
                return false;
            });

            function backup(tab, status) {
                status && showmsg(tab.id, "开始备份...(0%)");
                $.get($form.attr("action"), tab, function (data) {
                    if (data.code) {
                        showmsg(tab.id, data.msg);
                        if (!$.isPlainObject(data.data.tab)) {
                            $export.parent().children().prop('disabled', false);
                            $export.html("备份完成，点击重新备份");
                            window.onbeforeunload = function () {
                                return null;
                            };
                            return;
                        }
                        backup(data.data.tab, tab.id != data.data.tab.id);
                    } else {
                        layer.msg(data.msg, 0);
                        $export.html("立即备份");
                        setTimeout(function () {
                            $export.parent().children().prop('disabled', false);
                        }, 1500);
                    }
                });
            }

            function showmsg(id, msg) {
                $form.find("input[value=" + tables[id] + "]").closest("tr").find("#info").html(msg);
            }
        })(jQuery);
    });

</script>
</body>
</html>
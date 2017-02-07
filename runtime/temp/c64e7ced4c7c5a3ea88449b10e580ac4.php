<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\WWW\lunhui_tp5\public/../application/admin\view\article\index_cate.html";i:1478507489;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\header.html";i:1484803729;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\footer.html";i:1484803761;}*/ ?>
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
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <!--<div class="ibox-title">-->
            <!--<h5>分类列表</h5>-->
        <!--</div>-->
        <!--<div class="ibox-content">-->
            <!--&lt;!&ndash;搜索框开始&ndash;&gt;           -->
            <!--<div class="row">-->
                <!--<div class="col-sm-12">   -->
                <!--<div  class="col-sm-2" style="width: 100px">-->
                    <!--<div class="input-group" >  -->
                        <!--<a href="<?php echo url('add_cate'); ?>"><button class="btn btn-outline btn-primary" type="button">添加分类</button></a> -->
                    <!--</div>-->
                <!--</div>                                                                    -->
                <!--</div>-->
            <!--</div>-->
            <!--&lt;!&ndash;搜索框结束&ndash;&gt;-->
            <!--<div class="hr-line-dashed"></div>-->

            <div class="example-wrap">
                <div class="example">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr class="long-tr">
                                <th>ID</th>
                                <th>名称</th>
                                <th>排序</th>
                                <th>状态</th>
                                <th width="15%">添加时间</th>
                                <th width="15%">更新时间</th>
                                <th width="20%">操作</th>
                            </tr>
                        </thead>
                        <tbody id="article_list">
                            <?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                                <tr class="long-td">
                                    <td><?php echo $vo['id']; ?></td>
                                    <td><?php echo $vo['name']; ?></td>
                                    <td><?php echo $vo['orderby']; ?></td>                                                              
                                    <td>
                                        <?php if($vo['status'] == 1): ?>
                                            <a href="javascript:;" onclick="cate_state(<?php echo $vo['id']; ?>);">
                                                <div id="zt<?php echo $vo['id']; ?>"><span class="label label-info">开启</span></div>
                                            </a>
                                        <?php else: ?>    
                                            <a href="javascript:;" onclick="cate_state(<?php echo $vo['id']; ?>);">
                                                <div id="zt<?php echo $vo['id']; ?>"><span class="label label-danger">禁用</span></div>
                                            </a>
                                        <?php endif; ?>   
                                    </td>
                                    <td><?php echo date('Y-m-d H:i:s',$vo['create_time']); ?></td>
                                    <td><?php echo date('Y-m-d H:i:s',$vo['update_time']); ?></td>
                                    <td>
                                        <a href="<?php echo url('edit_cate',['id'=>$vo['id']]); ?>" class="btn btn-primary btn-xs">
                                            <i class="fa fa-paste"></i> 编辑</a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="del_cate(<?php echo $vo['id']; ?>)" class="btn btn-danger btn-xs">
                                            <i class="fa fa-trash-o"></i> 删除</a>   
                                    </td>
                                </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
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

/**
 * [del 删除用户]
 * @Author[田建龙 864491238@qq.com]
 * @param   {[type]}    id [用户id]
 */
function del_cate(id){
    layer.confirm('确认删除此分类?', {icon: 3, title:'提示'}, function(index){
        //do something
        $.getJSON('./del_cate', {'id' : id}, function(res){
            if(res.code == 1){
                layer.msg(res.msg,{icon:1,time:1500,shade: 0.1},function(){
                    window.location.href="<?php echo url('article/index_cate'); ?>";
                });               
            }else{
                layer.msg(res.msg,{icon:0,time:1500,shade: 0.1});
            }
        });

        layer.close(index);
    })

}

/**
 * [user_state 用户状态]
 * @param  {[type]} val [description]
 * @Author[田建龙 864491238@qq.com]
 */
function cate_state(val){
    $.post('<?php echo url("cate_state"); ?>',
    {id:val},
    function(data){
         
        if(data.code==1){
            var a='<span class="label label-danger">禁用</span>'
            $('#zt'+val).html(a);
            layer.msg(data.msg,{icon:2,time:1500,shade: 0.1,});
            return false;
        }else{
            var b='<span class="label label-info">开启</span>'
            $('#zt'+val).html(b);
            layer.msg(data.msg,{icon:1,time:1500,shade: 0.1,});
            return false;
        }         
        
    });
    return false;
}


</script>
</body>
</html>
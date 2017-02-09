<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"D:\WWW\lunhui_tp5\public/../application/admin\view\role\index.html";i:1477470181;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\header.html";i:1484803729;s:69:"D:\WWW\lunhui_tp5\public/../application/admin\view\public\footer.html";i:1484803761;}*/ ?>
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
        <div class="ibox-title">
            <h5>角色列表</h5>
        </div>
        <div class="ibox-content">
            <!--搜索框开始-->           
            <div class="row">
                <div class="col-sm-12">   
                <div  class="col-sm-2" style="width: 100px">
                    <div class="input-group" >  
                        <a href="<?php echo url('roleAdd'); ?>"><button class="btn btn-outline btn-primary" type="button">添加角色</button></a> 
                    </div>
                </div>                                            
                    <form name="admin_list_sea" class="form-search" method="post" action="<?php echo url('index'); ?>">
                        <div class="col-sm-3">
                            <div class="input-group">
                                <input type="text" id="key" class="form-control" name="key" value="<?php echo $val; ?>" placeholder="输入需查询的角色名" />   
                                <span class="input-group-btn"> 
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button> 
                                </span>
                            </div>
                        </div>
                    </form>                         
                </div>
            </div>
            <!--搜索框结束-->
            <div class="hr-line-dashed"></div>

            <div class="example-wrap">
                <div class="example">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr class="long-tr">
                                <th>ID</th>
                                <th>角色名称</th>
                                <th>状态</th>
                                <th width="15%">添加时间</th>
                                <th width="15%">更新时间</th>
                                <th width="25%">操作</th>
                            </tr>
                        </thead>
                        <script id="arlist" type="text/html">
                            {{# for(var i=0;i<d.length;i++){  }}
                                <tr class="long-td">
                                    <td>{{d[i].id}}</td>
                                    <td>{{d[i].title}}</td>  
                                    <td>
                                        {{# if(d[i].id!==1){ }}
                                            {{# if(d[i].status==1){ }}
                                                <a href="javascript:;" onclick="role_state({{d[i].id}});">
                                                    <div id="zt{{d[i].id}}"><span class="label label-info">开启</span></div>
                                                </a>
                                            {{# }else{ }}
                                                <a href="javascript:;" onclick="role_state({{d[i].id}});">
                                                    <div id="zt{{d[i].id}}"><span class="label label-danger">禁用</span></div>
                                                </a>
                                            {{# } }}
                                        {{# } }}
                                    </td>                                
                                    <td>{{d[i].create_time}}</td>
                                    <td>{{d[i].update_time}}</td>                                                            
                                    <td>
                                        {{# if(d[i].id!==1){ }}
                                            <a href="javascript:;" onclick="giveQx({{d[i].id}})" class="btn btn-info btn-xs">
                                                <i class="fa fa-paste"></i> 权限分配</a>&nbsp;&nbsp;
                                            <a href="javascript:;" onclick="roleEdit({{d[i].id}})" class="btn btn-primary btn-xs">
                                                <i class="fa fa-paste"></i> 编辑</a>&nbsp;&nbsp;
                                            <a href="javascript:;" onclick="roleDel({{d[i].id}})" class="btn btn-danger btn-xs">
                                                <i class="fa fa-trash-o"></i> 删除</a>
                                        {{# } }}    
                                    </td>
                                </tr>
                            {{# } }}
                        </script>
                        <tbody id="article_list"></tbody>
                    </table>
                    <div id="AjaxPage" style=" text-align: right;"></div>
                    <div id="allpage" style=" text-align: right;"></div>
                </div>
            </div>
            <!-- End Example Pagination -->
        </div>
    </div>
</div>
<!-- End Panel Other -->
</div>

<!-- 加载动画 -->
<div class="spiner-example">
    <div class="sk-spinner sk-spinner-three-bounce">
        <div class="sk-bounce1"></div>
        <div class="sk-bounce2"></div>
        <div class="sk-bounce3"></div>
    </div>
</div>

<!-- 角色分配 -->
<div class="zTreeDemoBackground left" style="display: none" id="role">
    <input type="hidden" id="nodeid">
    <div class="form-group">
        <div class="col-sm-5 col-sm-offset-2">
            <ul id="treeType" class="ztree"></ul>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-4 col-sm-offset-4" style="margin-bottom: 15px">
            <input type="button" value="确认分配" class="btn btn-primary" id="postform"/>
        </div>
    </div>
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
<link rel="stylesheet" href="/static/admin/js/plugins/zTree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="/static/admin/js/plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/admin/js/plugins/zTree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="/static/admin/js/plugins/zTree/jquery.ztree.exedit-3.5.js"></script>

<script type="text/javascript">
   
    /**
     * [Ajaxpage laypage分页]
     * @param[curr]  [当前页]
     */
    function Ajaxpage(curr){
        var key=$('#key').val();
        $.getJSON('<?php echo url("Role/index"); ?>', {
            page: curr || 1,key:key
        }, function(data){      //data是后台返回过来的JSON数据
            $(".spiner-example").css('display','none'); //数据加载完关闭动画 
            if(data==''){
                $("#article_list").html('<td colspan="20" style="padding-top:10px;padding-bottom:10px;font-size:16px;text-align:center">暂无数据</td>');
            }else{
                article_list(data); //模板赋值
                laypage({
                    cont: $('#AjaxPage'),//容器。值支持id名、原生dom对象，jquery对象,
                    pages:'<?php echo $allpage; ?>',//总页数
                    skip: true,//是否开启跳页
                    skin: '#1AB5B7',//分页组件颜色
                    curr: curr || 1,
                    groups: 3,//连续显示分页数
                    jump: function(obj, first){

                        if(!first){
                            Ajaxpage(obj.curr)
                        }
                        $('#allpage').html('第'+ obj.curr +'页，共'+ obj.pages +'页');
                    }
                });
            }
        });
    }

    Ajaxpage();

    /**
     * [article_list 接收异步获取的数据渲染到模板]
     * @param  {[type]} list [description]
     * @return {[type]}      [description]
     */
    function article_list(list){

        var tpl = document.getElementById('arlist').innerHTML;
        laytpl(tpl).render(list, function(html){
            document.getElementById('article_list').innerHTML = html;
        });
    }


    /**
     * [edit 编辑角色]
     * @Author[田建龙 864491238@qq.com]
     * @param  {[type]} id [角色id]
     */ 
    function roleEdit(id){

        location.href = './roleEdit/id/'+id+'.html';
    }


    /**
     * [del 删除角色]
     * @Author[田建龙 864491238@qq.com]
     * @param   {[type]}    id [角色id]
     */
    function roleDel(id){
        layer.confirm('确认删除此角色?', {icon: 3, title:'提示'}, function(index){
            //do something
            $.getJSON('./roleDel', {'id' : id}, function(res){
                if(res.code == 1){
                    layer.msg(res.msg,{icon:1,time:1500});
                    Ajaxpage(1,5)
                }else{
                    layer.msg(res.msg,{icon:0,time:1500});
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
    function role_state(val){
        $.post('<?php echo url("role_state"); ?>',
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

    zNodes = '';
    var index = '';
    var index2 = '';
    //分配权限
    function giveQx(id){
        $("#nodeid").val(id);
        //加载层
        index2 = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
        //获取权限信息
        $.getJSON('./giveAccess', {'type' : 'get', 'id' : id}, function(res){
            layer.close(index2);
            if(res.code == 1){
                zNodes = JSON.parse(res.data);  //将字符串转换成obj

                //页面层
                index = layer.open({
                    type: 1,
                    area:['350px', '600px'],
                    title:'权限分配',
                    skin: 'layui-layer-demo', //加上边框
                    content: $('#role')
                });
                //设置位置
                layer.style(index, {
                    top: '150px'
                });

                //设置zetree
                var setting = {
                    check:{
                        enable:true
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    }
                };

                $.fn.zTree.init($("#treeType"), setting, zNodes);
                var zTree = $.fn.zTree.getZTreeObj("treeType");
                zTree.expandAll(true);

            }else{
                layer.alert(res.msg);
            }

        });
    }

    //确认分配权限
    $("#postform").click(function(){
        var zTree = $.fn.zTree.getZTreeObj("treeType");
        var nodes = zTree.getCheckedNodes(true);
        var NodeString = '';
        $.each(nodes, function (n, value) {
            if(n>0){
                NodeString += ',';
            }
            NodeString += value.id;
        });
        var id = $("#nodeid").val();
        //写入库
        $.post('./giveAccess', {'type' : 'give', 'id' : id, 'rule' : NodeString}, function(res){
            layer.close(index);
            if(res.code == 1){
                layer.msg(res.msg,{icon:1,time:1500,shade: 0.1}, function(){
                    Ajaxpage(1,5)
                });
            }else{
                layer.msg(res.msg);
            }

        }, 'json')
    })
</script>
</body>
</html>









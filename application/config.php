<?php

return [

    'url_route_on' => true,
    'app_trace' =>  false,// 开启应用Trace调试
    'trace' => [
        'type' => 'html',// 在当前Html页面显示Trace信息,显示方式console、html
    ],
    'sql_explain' => false,// 是否需要进行SQL性能分析  
    'extra_config_list' => ['database', 'route', 'validate'],//各模块公用配置
    //临时关闭日志写入
    'log' => [
        'type' => 'test',
    ],

    'app_debug' => true,
	'default_module' => 'admin',//默认模块	
    'default_filter' => ['strip_tags', 'htmlspecialchars'],

    // +----------------------------------------------------------------------
    // | 缓存设置
    // +----------------------------------------------------------------------
    'cache' => [
        
        'type'   => 'file',// 驱动方式        
        'path'   => CACHE_PATH,// 缓存保存目录        
        'prefix' => '',// 缓存前缀       
        'expire' => 0,// 缓存有效期 0表示永久缓存
        'host'   => '127.0.0.1',
        'port'   => 11211,
    ],


    // +----------------------------------------------------------------------
    // | 缓存设置
    // +----------------------------------------------------------------------
    'auth_key' => 'JUD6FCtZsqrmVXc2apev4TRn3O8gAhxbSlH9wfPN', //默认数据加密KEY
    'pages'    => '10',//分页数 
    'salt'     => 'wZPb~yxvA!ir38&Z',//加密串 


    // +----------------------------------------------------------------------
    // | 数据库设置
    // +----------------------------------------------------------------------
    'data_backup_path'     => '../data/',   //数据库备份路径必须以 / 结尾；
    'data_backup_part_size' => '20971520',  //该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M
    'data_backup_compress' => '1',          //压缩备份文件需要PHP环境支持gzopen,gzwrite函数        0:不压缩 1:启用压缩
    'data_backup_compress_level' => '9',    //压缩级别   1:普通   4:一般   9:最高


];
/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : lunhui_tp5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-03-06 17:02:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES ('1', 'admin', 'ebbd202c239d6fc65061ae22a13c1b69', '179', '127.0.0.1', '1488785384', 'admin', '1', '1');
INSERT INTO `think_admin` VALUES ('9', 'tjl', 'e10adc3949ba59abbe56e057f20f883e', '18', '0.0.0.0', '1477140627', 'admin', '1', '2');
INSERT INTO `think_admin` VALUES ('15', 'test123', 'ebbd202c239d6fc65061ae22a13c1b69', '0', '', '0', 'dddd', '1', '3');
INSERT INTO `think_admin` VALUES ('16', '主任', '218dbb225911693af03a713581a7227f', '7', '127.0.0.1', '1488788687', '主任', '1', '9');
INSERT INTO `think_admin` VALUES ('30', '学生1', '218dbb225911693af03a713581a7227f', '1', '127.0.0.1', '1488784013', '111', '1', '11');

-- ----------------------------
-- Table structure for think_article
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` varchar(64) DEFAULT '' COMMENT '文章图片',
  `remark` varchar(256) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '文章类型',
  `is_tui` int(1) DEFAULT '0' COMMENT '是否推荐',
  `from` varchar(16) NOT NULL DEFAULT '' COMMENT '来源',
  `writer` varchar(64) NOT NULL COMMENT '作者',
  `ip` varchar(16) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('62', 'scdscs', '1', '/images/2016-02-27/56d14bae6ec97.jpg', 'csdc', 'dcsd', '<p><br/></p><pre class=\"brush:php;toolbar:false;\">&lt;?phpheader(&quot;Content-type:application/pdf&quot;);//&nbsp;文件将被称为&nbsp;downloaded.pdfheader(&quot;Content-Disposition:attachment;filename=&#39;downloaded.pdf&#39;&quot;);//&nbsp;PDF&nbsp;源在&nbsp;original.pdf&nbsp;中readfile(&quot;original.pdf&quot;);\n?&gt;</pre><p><br/></p>', '3', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1456557063', '1456557063');
INSERT INTO `think_article` VALUES ('63', '20120', '11', '', '12', '0120', '<p>0120</p>', '2', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1456557673', '1456557673');
INSERT INTO `think_article` VALUES ('64', '545', '13', '', '5245', '454', '<p>5425</p>', '2', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1456557765', '1456557765');
INSERT INTO `think_article` VALUES ('5', 'PHP初学者必须掌握的10个知识点', '5', './images/2016-01-04/5689cee8cf466.jpg', '这里总结了PHP初学者容易感到困惑的10个问题，供大家参考。', 'PHP', '<p style=\"text-align:center\"><img alt=\"a8d43f7egw1evreghrn9sj20rs0eon1u.jpg\" src=\"/Upload/20150905/1441435048306230.jpg\" title=\"1441435048306230.jpg\"/></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这里总结了PHP初学者容易感到困惑的10个问题，供大家参考。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">1、页面之间无法传递变量</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">get,post,session在最新的php版本中自动全局变量是关闭的，所以要从上一页面取得提交过来得变量要使用$_GET[&#39;foo&#39;],$_POST[&#39;foo&#39;],$_SESSION[&#39;foo&#39;]来得到。当然也可以修改自动全局变量为开(php.ini改为register_globals = On);考虑到兼容性，还是强迫自己熟悉新的写法比较好。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">注：PHP中的超全局变量</strong></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">从PHP 4.2.0 开始，register_globals 的默认值为 off，这样一来，以前的很多可以直接使用的变量，如 $PHP_SELF 或者你设定的SESSION变量都不能用 “$变量名”的形式访问了，这可能会给你带来很多不变，但却有助于安全性的提高。访问这些变量，你需要使用PHP 超全局变量，如下：</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_SERVER</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">变量由 Web 服务器设定或者直接与当前脚本的执行环境相关联。类似于旧数组 $HTTP_SERVER_VARS 数组。以前的$PHP_SELF对应$_SERVER[&#39;PHP_SELF&#39;]，你可以使用phpinfo来查看你的$_SERVER变量。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_GET</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP GET 方法提交至脚本的变量。类似于旧数组 $HTTP_GET_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_POST</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP POST 方法提交至脚本的变量。类似于旧数组 $HTTP_POST_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_COOKIE</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP Cookies 方法提交至脚本的变量。类似于旧数组 $HTTP_COOKIE_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_SESSION</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当前注册给脚本会话的变量。类似于旧数组 $HTTP_SESSION_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP POST 文件上传而提交至脚本的变量。类似于旧数组 $HTTP_POST_FILES 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_ENV</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">执行环境提交至脚本的变量。类似于旧数组 $HTTP_ENV_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">对于$_FILES变量：(文件域字段为“myfile”)</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;name&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">客户端机器文件的原名称(包括路径)。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;type&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">文件的 MIME 类型，需要浏览器提供该信息的支持，例如“image/gif”。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;size&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">已上传文件的大小，单位为字节。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;tmp_name&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">文件被上传后在服务端储存的临时文件名(包括路径)。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;error&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">和该文件上传相关的错误代码。[&#39;error&#39;] 是在 PHP 4.2.0 版本中增加的。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当 php.ini 中的 register_globals 被设置为 on 时，$myfile_name 等价于 $_FILES[&#39;myfile&#39;][&#39;name&#39;]，$myfile_type 等价于 $_FILES[&#39;myfile&#39;][&#39;type&#39;]等。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">2、win32下的session不能正常工作</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">php.ini默认的session.save_path = /tmp</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这显然是linux下的配置，win32下php无法读写session文件导致session无法使用，把它改成一个绝对路径就可以了，例如session.save_path = c:windowstemp。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">3、显示错误信息</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当php.ini的display_errors = On并且error_reporting = E_ALL时，将显示所有的错误和提示，调试的时候最好打开以便纠错，如果你用以前php写法错误信息多半是关于未定义变量的。变量在赋值以前调用会有提示，解决办法是探测或者屏蔽，例如显示$foo，可以if(isset($foo)) echo$foo 或者echo @$foo</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">4、header already sent</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这个错误通常会在你使用HEADER的时候出现，他可能是几种原因：1，你在使用HEADER前PRING或者ECHO了2.你当前文件前面有空行3.你可能INCLUDE了一个文件,该文件尾部有空行或者输出也会出现这种错误。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">5、更改php.ini后没有变化</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">重新启动web server，比如IIS，Apache等等，然后才会应用最新的设置。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">6、有时候sql语句不起作用，对数据库操作失败。最简便的调试方法，echo那句sql，看看变量的值是否能得到。</strong></p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">7、include和require的区别</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">两者没有太大的区别，如果要包含的文件不存在，include提示notice，然后继续执行下面的语句，require提示致命错误并且退出。根据测试，win32平台下它们都是先包含后执行，所以被包含文件里最好不要再有include或require语句，这样会造成目录混乱。或许*nux下情况不同，暂时还没测试。如果一个文件不想被包含多次可以使用include_once或require_once## 读取，写入文档数据：</p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">function&nbsp;r($file_name)&nbsp;{\r\n$filenum=@fopen($file_name,&quot;r&quot;);\r\n@flock($filenum,LOCK_SH);\r\n$file_data=@fread($filenum,filesize($file_name));\r\n@fclose($filenum);\r\nreturn&nbsp;$file_data;\r\n}\r\nfunction&nbsp;w($file_name,$data,$method=&quot;w&quot;){\r\n$filenum=@fopen($file_name,$method);\r\nflock($filenum,LOCK_EX);\r\n$file_data=fwrite($filenum,$data);\r\nfclose($filenum);\r\nreturn&nbsp;$file_data;\r\n}</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">8、isset和empty的区别</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">两者都是测试变量用的，但是isset是测试变量是否被赋值，而empty是测试一个已经被赋值的变量是否为空。如果一个变量没被赋值就引用在php里是被允许的,但会有notice提示。如果一个变量被赋空值，$foo=”&quot;或者$foo=0或者 $foo=false,那么empty($foo)返回真，isset($foo)也返回真，就是说赋空值不会注销一个变量。要注销一个变量，可以用 unset($foo)或者$foo=NULL。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">9、mysql查询语句包含有关键字</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">php查询mysql的时候，有时候mysql表名或者列名会有关键字，这时候查询会有错误。例如表名是order,查询时候会出错，简单的办法是sql语句里表名或者列名加上`[tab键上面]来加以区别，例如select * from `order`。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">10、通过HTTP协议一次上传多个文件的方法</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">有两个思路，是同一个方法的两种实现。具体程序还需自己去设计</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">1. 在form中设置多个文件输入框，用数组命名他们的名字，如下：</strong></p><pre class=\"brush: html; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\"><br/></pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">这样，在服务器端做以下测试</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">echo&nbsp;&quot;&quot;;\r\nprint_r($_FILES);\r\necho&nbsp;&quot;&quot;;</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">2. 在form中设置多个文件输入框，但名字不同，如下：</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\"><br/></pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">在服务器端做同样测试：</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: \" courier=\"\" border-width:=\"\" 1px=\"\" border-style:=\"\" border-color:=\"\" background-color:=\"\" color:=\"\" letter-spacing:=\"\" text-align:=\"\" text-indent:=\"\" text-transform:=\"\" word-spacing:=\"\">echo&nbsp;&quot;&quot;;\r\nprint_r($_FILES);\r\necho&nbsp;&quot;&quot;;</pre>', '441', '1', '1', 'Win 8.1', '轮回', '124.152.7.106', '1441435103', '1452229136');
INSERT INTO `think_article` VALUES ('11', '编写高质量的代码，从命名入手', '1', './images/2016-01-04/5689ce8fcd0e2.jpg', '笔者从事开发多年，有这样一种感觉，查看一些开源项目，如Spring、Apache Common等源码是一件赏心悦目的事情，究其原因，无外两点：1）代码质量非常高；2）命名特别规范（这可能跟老外的英语水平有关）。', '代码', '<p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者从事开发多年，有这样一种感觉，查看一些开源项目，如Spring、Apache Common等源码是一件赏心悦目的事情，究其原因，无外两点：1）代码质量非常高；2）命名特别规范（这可能跟老外的英语水平有关）。</p><p style=\"text-align:center\"><br/></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">要写高质量的代码，不是一件容易的事，需要长年累月的锻炼，是一个量变到质变的过程，但要写好命名，只需要有比较好的英语语法基础和一种自我意识即可轻松达到。<strong style=\"margin: 0px; padding: 0px;\">本博文将会结合本人的开发经验，总结出若干命名规则，这些命名规则纯属个人的使用习惯，不代表是一种理想的规则，在这里列举出来，供大家交流讨论。</strong></p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">1.切忌使用没有任何意义的英语字母进行命名</h2><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">&nbsp;for(int&nbsp;i=0;&nbsp;i&lt;10;&nbsp;i++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这是在很多教Java基本语法的书上常见的代码片断，作为教学材料，这样写无可厚非，但作为真正的代码编写，<span class=\"wp_keywordlink\"><a href=\"http://www.codeceo.com/\" title=\"程序员\" target=\"_blank\" style=\"color: rgb(0, 136, 219); text-decoration: none; cursor: pointer;\">程序员</a></span>必须要养成良好的习惯，不要使用这种没有任何含义的命名方式，这里可以使用“index”。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">2.切忌使用拼音，甚至是拼音首字母组合</h2><pre class=\"brush: c; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">cishu&nbsp;=5;&nbsp;//&nbsp;循环的次数\r\nzzje&nbsp;=&nbsp;1000.00&nbsp;//&nbsp;转账金额</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者在做代码检查的时候，无数次遇到过这样的命名，使人哭笑不得</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">3.要使用英文，而且要使用准确的英语，无论是拼写还是语法</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>名词单数，必须使用单数英文，如Account、Customer。</p></li><li><p>对于数组，列表等对象集合的命名，必须使用复数，而且最好按照英文的语法基础知识使用准确的复数形式，如 List<account>accounts、Set<strategy>strategies。</strategy></account></p></li><li><p>对于boolean值的属性，很多开发人员习惯使用isXXX，如isClose（是否关闭），但这里有两点建议：1）最好不要带“is”，因为JavaBean的规范，为属性生成get/set方法的时候，会用“get/set/is”，上面的例子，生成get/set方法就会变成“getIsClose/isIsClose/getIsClose”，非常别扭；2）由于boolean值通常反映“是否”，所以准确的用法，应该是是用“形容词”，上面的例子，最终应该被改为 closed，那么get/set方法就是“getClosed/isColsed/setClosed”，非常符合英语阅读习惯。</p></li></ul><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">4.方法名的命名，需要使用“动宾结构短语”或“是动词+表语结构短语”</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾看到过千奇百怪的方法命名，有些使用名词，有些甚至是“名词+动词”，而且，如果宾语是一个对象集合，还是最好使用复数：</p><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">createOrder(Order&nbsp;order)&nbsp;//good\r\norderCreate(Order&nbsp;order)&nbsp;//bad\r\nremoveOrders(List&nbsp;orders)&nbsp;//good\r\nremoveOrder(List&nbsp;order)&nbsp;//bad</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">5.对于常见的“增删改查”方法，命名最好要谨慎：</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>增加：最常见使用create和add，但最好根据英语的语义进行区分，这有助于理解，create代表创建，add代表增加。比如，要创建一个Student，用createStudent要比用addStudent好，为什么？想想如果有个类叫Clazz(班级，避开Java关键字），现在要把一个Student加入到一个Clazz，Clazz很容易就定义了一个 addStudent（Student student)的方法，那么就比较容易混淆。</p></li><li><p>修改：常见的有alter、update、modify，个人觉得modify最准确。</p></li><li><p>查询：对于获取单个对象，可以用get或load，但个人建议用get，解释请见第7点的说明，对于不分条件列举，用list，对于有条件查询，用search（最好不要用find，find在英文了强调结果，是“找到”的意思，你提供一个“查询”方法，不保证输入的条件总能“找到”结果）。</p></li><li><p>删除：常见的有delete和remove，但删除建议用delete，因为remove有“移除”的意思，参考Clazz的例子就可以理解，从班级移除一个学生，会用removeStudent。</p></li></ul><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">6.宁愿方法名冗长，也不要使用让人费解的简写</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾经遇到一个方法，判断“支付账户是否与收款账户相同”，结果我看到一个这样的命名：</p><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">checkIsOrderingAccCollAccSame(...)&nbsp;//&nbsp;很难理解，我马上把它改为：\r\nisOrderingAccountSameAsCollectionAccount(...)&nbsp;//&nbsp;虽然有点长，但非常容易阅读，而且这种情况总是出现得比较少。</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">7.如果你在设计业务系统，最好不要使用技术化的术语去命名</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾经工作的公司曾经制订这样的命名规则，接口必须要以“I”开头，数据传输对象必须以“DTO”作为后缀，数据访问对象必须以“DAO”作为后缀，领域对象必须以“DO”作为后缀，我之所以不建议这种做法，是希望设计人员从一开始就引导开发人员，要从“业务”出发考虑问题，而不要从“技术”出发。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">所以，接口不需要非得以“I”开头，只要其实现类以“Impl”结尾即可（注：笔者认为接口是与细节无关的，与技术无关，但实现类是实现相关的，用技术化术语无可口非），而数据传输对象，其实无非就是保存一个对象的信息，因此可以用“**Info”，如CustomerInfo，领域对象本身就是业务的核心，所以还是以其真实名称出现，比如Account、Customer，至于“DAO”，这一个词来源于J2ee的<span class=\"wp_keywordlink\"><a href=\"http://www.codeceo.com/article/category/develop/design-patterns\" title=\"设计模式\" target=\"_blank\" style=\"color: rgb(0, 136, 219); text-decoration: none; cursor: pointer;\">设计模式</a></span>，笔者在之前的项目使用“***Repository”命名，意味“***的仓库”，如AccountRepository.</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">关于“Repository”这个词的命名，是来源于Eric Evans的《Domain-Driven Design》一书的仓库概念，Eric Evans对Repository的概念定义是：领域对象的概念性集合，个人认为这个命名非常的贴切，它让程序员完全从技术的思维中摆脱出来，站在业务的角度思考问题。说到这里，可能有人会反驳：像Spring、Hibernate这些优秀的框架，不是都在用“I”作为接口开头，用“DAO”来命名数据访问对象吗？没错！但千万别忽略了语义的上下文，Spring、Hibernate框架都是纯技术框架，我这里所说的场景是设计业务系统。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">8.成员变量不要重复类的名称</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">例如，很多人喜欢在Account对象的成员变量中使用accountId，accountNumber等命名，其实没有必要，想想成员变量不会鼓孤立的存在，你引用accountId，必须是account.accountId，用account.id已经足够清晰了。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">“勿以善小而不为，勿以恶小而为之”、“细节决定成败”，有太多的名言告诉我们，要注重细节。一个优秀的程序员，必须要有坚实的基础，而对于命名规则这样容易掌握的基础，我们何不现行？</p><p><br/></p>', '377', '1', '1', 'Win 8.1', '轮回', '124.152.7.106', '1441598331', '1451871892');
INSERT INTO `think_article` VALUES ('60', '242542', '1', '/images/2016-02-02/56b0a567d8572.jpg', '2452', '5245', '<p>2452452</p>', '5', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1454417258', '1454417258');

-- ----------------------------
-- Table structure for think_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `think_article_cate`;
CREATE TABLE `think_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article_cate
-- ----------------------------
INSERT INTO `think_article_cate` VALUES ('1', '学习笔记', '1', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('2', '生活随笔', '2', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('3', '热点分享', '3', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('4', '.NET', '4', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('5', 'PHP', '5', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('6', 'Java', '6', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('9', '11', '11', '1477140627', '1477316133', '1');
INSERT INTO `think_article_cate` VALUES ('10', '22', '22', '1477140627', '1477316141', '1');

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '1', '', '1446535750', '1446535750');
INSERT INTO `think_auth_group` VALUES ('2', '内容管理员', '1', '1,2,9,10,11,12,3,4,5,6,7,8,13,14,22,24,25,26', '1446535750', '1477322342');
INSERT INTO `think_auth_group` VALUES ('3', '系统维护员', '1', '1,2,9,10,11,12,3,4,5,6,7,8,13,14,22,24,25,26', '1446535750', '1477322335');
INSERT INTO `think_auth_group` VALUES ('9', '主任', '1', '24,33,31,38,39,40,32,41,34,35,36,37', '1486624259', '1488789331');
INSERT INTO `think_auth_group` VALUES ('11', '学生', '1', '24,33', '1488783008', '1488783016');

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('9', '2');
INSERT INTO `think_auth_group_access` VALUES ('14', '3');
INSERT INTO `think_auth_group_access` VALUES ('16', '9');
INSERT INTO `think_auth_group_access` VALUES ('30', '11');

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', 'fa fa-gear', '', '0', '0', '1446535750', '0');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/user/index', '用户管理', '1', '1', '', '', '1', '0', '1446535750', '0');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '1', '', '', '1', '0', '1446535750', '0');
INSERT INTO `think_auth_rule` VALUES ('4', 'admin/menu/index', '菜单管理', '1', '1', '', '', '1', '0', '1446535750', '0');
INSERT INTO `think_auth_rule` VALUES ('5', '#', '数据库管理', '1', '1', 'fa fa-database', '', '0', '0', '1446535750', '0');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '1', '', '', '5', '0', '1446535750', '1477639754');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/data/optimize', '优化表', '1', '1', '', '', '6', '0', '0', '1477639789');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/data/repair', '修复表', '1', '1', '', '', '6', '0', '0', '1477639800');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/user/useradd', '添加用户', '1', '1', '', '', '2', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/user/useredit', '编辑用户', '1', '1', '', '', '2', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/user/userdel', '删除用户', '1', '1', '', '', '2', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/user/user_state', '用户状态更改', '1', '1', '', '', '2', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('13', '#', '日志管理', '1', '1', 'fa fa-tasks', '', '0', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/log/operate_log', '操作日志', '1', '1', '', '', '13', '0', '0', '0');
INSERT INTO `think_auth_rule` VALUES ('24', '#', '课程表管理', '1', '1', 'fa fa-paste', '', '0', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/student/timetablestudent', '课程表查看【学生】', '1', '1', '', '', '24', '50', '1486625380', '1486625380');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/data/import', '数据库还原', '1', '1', '', '', '5', '50', '1477639870', '1477639870');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/data/revert', '还原', '1', '1', '', '', '27', '50', '1477639972', '1477639972');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/data/del', '删除', '1', '1', '', '', '27', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/student/index', '课程表查看【管理员】', '1', '1', '', '', '24', '50', '1478494458', '1486625218');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/student/insertView', '添加课程菜单', '1', '1', '', '', '24', '50', '1478509817', '1488784702');
INSERT INTO `think_auth_rule` VALUES ('38', 'admin/student/editView', '修改课程', '1', '1', '', '', '31', '50', '1488789207', '1488789207');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/student/delete', '删除课程', '1', '1', '', '', '31', '50', '1488789238', '1488789238');
INSERT INTO `think_auth_rule` VALUES ('40', 'admin/student/edit', '修改课程方法', '1', '1', '', '', '31', '50', '1488789268', '1488789268');
INSERT INTO `think_auth_rule` VALUES ('41', 'admin/student/insert', '添加课程方法', '1', '1', '', '', '32', '50', '1488789293', '1488789293');

-- ----------------------------
-- Table structure for think_class
-- ----------------------------
DROP TABLE IF EXISTS `think_class`;
CREATE TABLE `think_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(30) NOT NULL COMMENT '系别',
  `major` varchar(30) NOT NULL COMMENT '专业',
  `grade` int(4) NOT NULL COMMENT '年级',
  `class` varchar(10) NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of think_class
-- ----------------------------
INSERT INTO `think_class` VALUES ('1', '数理系', '网络工程', '2013', 'N131');
INSERT INTO `think_class` VALUES ('2', '数理系', '计算机科学', '2013', 'N132');

-- ----------------------------
-- Table structure for think_course
-- ----------------------------
DROP TABLE IF EXISTS `think_course`;
CREATE TABLE `think_course` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `cname` varchar(30) NOT NULL DEFAULT '无',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='课程-课程号';

-- ----------------------------
-- Records of think_course
-- ----------------------------
INSERT INTO `think_course` VALUES ('1', '1', '数据库');
INSERT INTO `think_course` VALUES ('2', '2', '数据结构');
INSERT INTO `think_course` VALUES ('3', '3', 'web开发');
INSERT INTO `think_course` VALUES ('4', '4', '高等数学');

-- ----------------------------
-- Table structure for think_log
-- ----------------------------
DROP TABLE IF EXISTS `think_log`;
CREATE TABLE `think_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_log
-- ----------------------------
INSERT INTO `think_log` VALUES ('146', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477067453');
INSERT INTO `think_log` VALUES ('147', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477067743');
INSERT INTO `think_log` VALUES ('148', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477067880');
INSERT INTO `think_log` VALUES ('149', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068084');
INSERT INTO `think_log` VALUES ('150', '1', 'admin', '用户【admin】登录失败：验证码错误', '0.0.0.0', '2', '1477068155');
INSERT INTO `think_log` VALUES ('151', '1', 'admin', '用户【admin】登录失败：密码错误', '0.0.0.0', '2', '1477068161');
INSERT INTO `think_log` VALUES ('152', '1', 'admin', '用户【admin】登录失败：验证码错误', '0.0.0.0', '2', '1477068166');
INSERT INTO `think_log` VALUES ('153', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068172');
INSERT INTO `think_log` VALUES ('154', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068497');
INSERT INTO `think_log` VALUES ('155', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068668');
INSERT INTO `think_log` VALUES ('156', '0', 'tjl', '用户【tjl】登录失败：密码错误', '0.0.0.0', '2', '1477068701');
INSERT INTO `think_log` VALUES ('157', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068713');
INSERT INTO `think_log` VALUES ('158', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068785');
INSERT INTO `think_log` VALUES ('159', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068837');
INSERT INTO `think_log` VALUES ('160', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068859');
INSERT INTO `think_log` VALUES ('161', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068896');
INSERT INTO `think_log` VALUES ('162', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068930');
INSERT INTO `think_log` VALUES ('163', '1', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068945');
INSERT INTO `think_log` VALUES ('164', '1', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068967');
INSERT INTO `think_log` VALUES ('165', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477069125');
INSERT INTO `think_log` VALUES ('166', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477069183');
INSERT INTO `think_log` VALUES ('167', '1', 'admin', '用户【admin】登录失败：密码错误', '0.0.0.0', '2', '1477069400');
INSERT INTO `think_log` VALUES ('278', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1477971632');
INSERT INTO `think_log` VALUES ('279', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1478484184');
INSERT INTO `think_log` VALUES ('280', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1478484199');
INSERT INTO `think_log` VALUES ('281', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1478485927');
INSERT INTO `think_log` VALUES ('282', '1', 'admin', '用户【admin】删除管理员成功(ID=13)', '127.0.0.1', '1', '1478490391');
INSERT INTO `think_log` VALUES ('283', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1478491280');
INSERT INTO `think_log` VALUES ('284', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1478491326');
INSERT INTO `think_log` VALUES ('285', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1478491481');
INSERT INTO `think_log` VALUES ('286', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1478494421');
INSERT INTO `think_log` VALUES ('287', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1478494458');
INSERT INTO `think_log` VALUES ('288', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1478509817');
INSERT INTO `think_log` VALUES ('289', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1478510091');
INSERT INTO `think_log` VALUES ('290', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1483682656');
INSERT INTO `think_log` VALUES ('291', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1484022299');
INSERT INTO `think_log` VALUES ('292', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1484545556');
INSERT INTO `think_log` VALUES ('293', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1484546158');
INSERT INTO `think_log` VALUES ('294', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486364972');
INSERT INTO `think_log` VALUES ('295', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486365232');
INSERT INTO `think_log` VALUES ('296', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486456611');
INSERT INTO `think_log` VALUES ('297', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1486625144');
INSERT INTO `think_log` VALUES ('298', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1486625218');
INSERT INTO `think_log` VALUES ('299', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1486625380');
INSERT INTO `think_log` VALUES ('300', null, 'admin', '用户【主任】添加成功', '127.0.0.1', '1', '1486633360');
INSERT INTO `think_log` VALUES ('301', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1486633416');
INSERT INTO `think_log` VALUES ('302', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1486633574');
INSERT INTO `think_log` VALUES ('303', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486633608');
INSERT INTO `think_log` VALUES ('304', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1486633639');
INSERT INTO `think_log` VALUES ('305', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486692756');
INSERT INTO `think_log` VALUES ('306', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1486694116');
INSERT INTO `think_log` VALUES ('307', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1486700017');
INSERT INTO `think_log` VALUES ('308', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1487667322');
INSERT INTO `think_log` VALUES ('309', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1487667390');
INSERT INTO `think_log` VALUES ('310', null, 'admin', '用户【学生】添加成功', '127.0.0.1', '1', '1487907470');
INSERT INTO `think_log` VALUES ('311', null, 'admin', '用户【tjl】编辑成功', '127.0.0.1', '1', '1487907485');
INSERT INTO `think_log` VALUES ('312', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1487907519');
INSERT INTO `think_log` VALUES ('313', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1487908031');
INSERT INTO `think_log` VALUES ('314', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1488782613');
INSERT INTO `think_log` VALUES ('315', '18', '1234', '用户【1234】登录失败：密码错误', '127.0.0.1', '2', '1488782716');
INSERT INTO `think_log` VALUES ('316', null, 'admin', '用户【1234】编辑成功', '127.0.0.1', '1', '1488782726');
INSERT INTO `think_log` VALUES ('317', '18', '1234', '用户【1234】登录失败：密码错误', '127.0.0.1', '2', '1488782731');
INSERT INTO `think_log` VALUES ('318', '18', '1234', '用户【1234】登录失败：密码错误', '127.0.0.1', '2', '1488782747');
INSERT INTO `think_log` VALUES ('319', '18', '1234', '用户【1234】登录失败：密码错误', '127.0.0.1', '2', '1488782754');
INSERT INTO `think_log` VALUES ('320', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488782760');
INSERT INTO `think_log` VALUES ('321', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488782771');
INSERT INTO `think_log` VALUES ('322', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488782789');
INSERT INTO `think_log` VALUES ('323', '1', 'admin', '用户【admin】删除管理员成功(ID=20)', '127.0.0.1', '1', '1488782991');
INSERT INTO `think_log` VALUES ('324', '1', 'admin', '用户【admin】删除管理员成功(ID=18)', '127.0.0.1', '1', '1488782994');
INSERT INTO `think_log` VALUES ('325', '1', 'admin', '用户【admin】添加用户关联成功', '127.0.0.1', '1', '1488783684');
INSERT INTO `think_log` VALUES ('326', null, 'admin', '用户【学生1】添加成功', '127.0.0.1', '1', '1488783684');
INSERT INTO `think_log` VALUES ('327', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488783696');
INSERT INTO `think_log` VALUES ('328', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488783874');
INSERT INTO `think_log` VALUES ('329', '17', '学生', '用户【学生】登录成功', '127.0.0.1', '1', '1488783960');
INSERT INTO `think_log` VALUES ('330', '30', '学生1', '用户【学生1】登录成功', '127.0.0.1', '1', '1488784013');
INSERT INTO `think_log` VALUES ('331', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1488784177');
INSERT INTO `think_log` VALUES ('332', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488784461');
INSERT INTO `think_log` VALUES ('333', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488784602');
INSERT INTO `think_log` VALUES ('334', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1488784702');
INSERT INTO `think_log` VALUES ('335', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1488784711');
INSERT INTO `think_log` VALUES ('336', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488784812');
INSERT INTO `think_log` VALUES ('337', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1488784824');
INSERT INTO `think_log` VALUES ('338', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1488785384');
INSERT INTO `think_log` VALUES ('339', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488785640');
INSERT INTO `think_log` VALUES ('340', '16', '主任', '用户【主任】登录成功', '127.0.0.1', '1', '1488788687');
INSERT INTO `think_log` VALUES ('341', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488789207');
INSERT INTO `think_log` VALUES ('342', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488789238');
INSERT INTO `think_log` VALUES ('343', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488789268');
INSERT INTO `think_log` VALUES ('344', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1488789293');
INSERT INTO `think_log` VALUES ('345', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1488789362');
INSERT INTO `think_log` VALUES ('346', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1488789368');
INSERT INTO `think_log` VALUES ('347', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1488789372');
INSERT INTO `think_log` VALUES ('348', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1488789377');

-- ----------------------------
-- Table structure for think_member
-- ----------------------------
DROP TABLE IF EXISTS `think_member`;
CREATE TABLE `think_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `password` char(32) DEFAULT NULL,
  `face` varchar(128) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `reg_ip` varchar(15) DEFAULT NULL COMMENT '注册IP',
  `last_time` int(11) DEFAULT NULL COMMENT '最后一次登录',
  `last_ip` varchar(15) DEFAULT NULL COMMENT '最后一次登录IP',
  `status` tinyint(1) DEFAULT NULL COMMENT '1激活  0 未激活',
  `closed` tinyint(1) DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `token` char(32) DEFAULT '0' COMMENT '令牌',
  `session_id` varchar(20) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `birthday` varchar(255) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=212065 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_member
-- ----------------------------
INSERT INTO `think_member` VALUES ('212061', '1217037610', 'd41d8cd98f00b204e9800998ecf8427e', '', 'XiMi丶momo', '300', '200', '1476779394', '0.0.0.0', '1476779394', '0.0.0.0', '1', '1', '18809321956', '0', '', '2', '1997-10-17', '');
INSERT INTO `think_member` VALUES ('1', '18809321929', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476762873/1321.jpg', '醉凡尘丶Wordly', '92960', '73', '1476762875', '0.0.0.0', '1476762875', '0.0.0.0', '1', '0', '18809321929', '0', '', '1', '2016-10-17', '');
INSERT INTO `think_member` VALUES ('212039', '1217037610', 'd41d8cd98f00b204e9800998ecf8427e', '', '紫陌轩尘', '400', '434', '1476676516', '0.0.0.0', '1476676516', '0.0.0.0', '1', '1', '49494', '0', '', '1', '2021-10-13', '');
INSERT INTO `think_member` VALUES ('212044', '', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476425832/1464073670790.jpg', 'fag', '24', '424', '1476425833', '0.0.0.0', '1476425833', '0.0.0.0', '0', '1', '242', '0', '', '1', '1995-10-27', '');
INSERT INTO `think_member` VALUES ('212045', '18809321928', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476676463/1464073638442.jpg', '空谷幽兰', '53', '3636', '1476676464', '0.0.0.0', '1476676464', '0.0.0.0', '1', '0', '3636', '0', '', '2', '2016-10-13', '');
INSERT INTO `think_member` VALUES ('212049', '', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476425748/20160624012046361.jpg', '787367373', '414', '9', '1476425750', '0.0.0.0', '1476425750', '0.0.0.0', '0', '1', '73737373', '0', '', '1', '2003-10-13', '');
INSERT INTO `think_member` VALUES ('212051', '18809321929', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476692253/215358np33w7nw7u4o4536.jpg', 'XMi丶呵呵', '373373', '33', '1476692255', '0.0.0.0', '1476692255', '0.0.0.0', '1', '0', '73', '0', '', '2', '1995-10-14', '');
INSERT INTO `think_member` VALUES ('212052', '1246470984', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476692121/1464073670790.jpg', 'XY', '7383', '73737373', '1476692123', '0.0.0.0', '1476692123', '0.0.0.0', '1', '1', '7373', '0', '', '1', '2011-10-14', '');
INSERT INTO `think_member` VALUES ('212053', '18793189097', 'd41d8cd98f00b204e9800998ecf8427e', '', '25773', '7373737', '77', '1476433452', '0.0.0.0', '1476433452', '0.0.0.0', '1', '1', '7373733', '0', '', '1', '2016-10-10', '');
INSERT INTO `think_member` VALUES ('212060', '1246470984', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/face/1476694804/20090106103716418.jpg', 'XiYu', '100', '100', '1476694831', '0.0.0.0', '1476694831', '0.0.0.0', '1', '1', '18793189091', '0', '', '2', '1996-10-17', '');
INSERT INTO `think_member` VALUES ('212064', '', '', 'http://wx.qlogo.cn/mmopen/WS5af6DwbzhvoKlOnV589huTP4nBWhMAEVzVI4gdCUQF0Kpc3FVXrkibWudHhYch2hPaXI4Jrs4ibppBGlSquM4x7abIdibnHgf/0', '烟勤话少脾气好', '0', '0', '0', '', '0', '', '0', '0', '', '0', '', '0', '', 'o0n73s5lR1WClmv3ujC0XU22IRnc');

-- ----------------------------
-- Table structure for think_room
-- ----------------------------
DROP TABLE IF EXISTS `think_room`;
CREATE TABLE `think_room` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `room` varchar(255) CHARACTER SET gbk NOT NULL COMMENT '教室名',
  `week` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '表示星期几  位1，2，3...，7    1表示有课 0 表示无',
  PRIMARY KEY (`id`,`room`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='教室状态表';

-- ----------------------------
-- Records of think_room
-- ----------------------------
INSERT INTO `think_room` VALUES ('1', '教2A100', '0');
INSERT INTO `think_room` VALUES ('2', '教2A102', '0');
INSERT INTO `think_room` VALUES ('3', '教2A104', '0');
INSERT INTO `think_room` VALUES ('4', '教2A106', '0');

-- ----------------------------
-- Table structure for think_student
-- ----------------------------
DROP TABLE IF EXISTS `think_student`;
CREATE TABLE `think_student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `snum` char(12) NOT NULL DEFAULT '' COMMENT '学号',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '邮箱 接收通知',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of think_student
-- ----------------------------
INSERT INTO `think_student` VALUES ('1', '201345509122', '朱鑫飚', '446100702@qq.com');

-- ----------------------------
-- Table structure for think_teacher
-- ----------------------------
DROP TABLE IF EXISTS `think_teacher`;
CREATE TABLE `think_teacher` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET gbk NOT NULL,
  `phone` char(11) CHARACTER SET gbk NOT NULL,
  `address` varchar(255) CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='教师信息表';

-- ----------------------------
-- Records of think_teacher
-- ----------------------------
INSERT INTO `think_teacher` VALUES ('1', '张三', '12345678910', '地球');
INSERT INTO `think_teacher` VALUES ('2', '李四', '11111111111', '中国');
INSERT INTO `think_teacher` VALUES ('3', '王五', '22222222222', '浙江省');

-- ----------------------------
-- Table structure for think_teacher_cid
-- ----------------------------
DROP TABLE IF EXISTS `think_teacher_cid`;
CREATE TABLE `think_teacher_cid` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tnum` int(11) NOT NULL DEFAULT '-1' COMMENT '教师号',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程号',
  PRIMARY KEY (`Id`),
  KEY `tnum` (`tnum`,`cid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tnum`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='教师-课程';

-- ----------------------------
-- Records of think_teacher_cid
-- ----------------------------
INSERT INTO `think_teacher_cid` VALUES ('1', '1', '1');
INSERT INTO `think_teacher_cid` VALUES ('2', '2', '2');
INSERT INTO `think_teacher_cid` VALUES ('3', '3', '3');
INSERT INTO `think_teacher_cid` VALUES ('4', '3', '4');
INSERT INTO `think_teacher_cid` VALUES ('5', '3', '2');

-- ----------------------------
-- Table structure for think_timetables
-- ----------------------------
DROP TABLE IF EXISTS `think_timetables`;
CREATE TABLE `think_timetables` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程号',
  `tid` int(11) NOT NULL COMMENT '教师id',
  `classid` int(30) unsigned zerofill NOT NULL DEFAULT '000000000000000000000000000000' COMMENT '班级ID',
  `room` int(255) unsigned zerofill NOT NULL COMMENT '教室id',
  `num` tinyint(1) NOT NULL DEFAULT '0' COMMENT '节数 1，3，5，7，9:晚自修',
  `week` int(1) NOT NULL DEFAULT '0' COMMENT '星期',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `class` (`classid`,`num`,`week`) USING BTREE COMMENT '保持班级时间唯一性',
  UNIQUE KEY `teacher` (`tid`,`num`,`week`) USING BTREE COMMENT '保持教师时间唯一性',
  UNIQUE KEY `room` (`room`,`num`,`week`) USING BTREE COMMENT '保持教室时间唯一性',
  KEY `tid_cid` (`tid`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of think_timetables
-- ----------------------------
INSERT INTO `think_timetables` VALUES ('2', '2', '3', '000000000000000000000000000001', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002', '3', '2');
INSERT INTO `think_timetables` VALUES ('3', '3', '3', '000000000000000000000000000002', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003', '5', '3');
INSERT INTO `think_timetables` VALUES ('4', '1', '1', '000000000000000000000000000001', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002', '1', '4');
INSERT INTO `think_timetables` VALUES ('5', '3', '3', '000000000000000000000000000001', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001', '1', '2');
INSERT INTO `think_timetables` VALUES ('9', '1', '1', '000000000000000000000000000002', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002', '9', '1');
INSERT INTO `think_timetables` VALUES ('10', '1', '1', '000000000000000000000000000001', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001', '1', '1');

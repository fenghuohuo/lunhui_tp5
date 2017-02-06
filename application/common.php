<?php
use taobao\AliSms;


	/**
	 * 字符串截取，支持中文和其他编码
	 */
	function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = true) {
		if (function_exists("mb_substr"))
			$slice = mb_substr($str, $start, $length, $charset);
		elseif (function_exists('iconv_substr')) {
			$slice = iconv_substr($str, $start, $length, $charset);
			if (false === $slice) {
				$slice = '';
			}
		} else {
			$re['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
			$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
			$re['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
			$re['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
			preg_match_all($re[$charset], $str, $match);
			$slice = join("", array_slice($match[0], $start, $length));
		}
		return $suffix ? $slice . '...' : $slice;
	}

	
	//发送短信(参数：签名,模板（数组）,模板ID，手机号)
	function sms($signname='',$param=[],$code='',$phone)
	{
        $alisms = new AliSms();
        $result = $alisms->sign($signname)->data($param)->code($code)->send($phone);
        return $result['info'];
	}
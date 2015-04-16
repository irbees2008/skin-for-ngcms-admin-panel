<?php

// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

error_reporting(E_ALL);
ini_set("error_log", "log.txt");
ini_set("log_errors", true);
ini_set("default_charset","windows-1251");

// Load skin language
function LoadLang_askin($what, $area = '') {
	global $config;
	$filename = root.'skins/default/lang/'.$config['default_lang'].'/skin.ini';
	
	if (!$content = parse_ini_file($filename, true)) {
		$filename = root.'skins/default/lang/english/skin.ini';
		$content = parse_ini_file($filename, true);
	}
	if (!is_array($lang_askin)) { $lang_askin = array(); }
	if ($area) {
		$lang_askin[$area] = $content;
	} else {
		$lang_askin = array_merge($lang_askin, $content);
	}
	return $lang_askin;
}
$lang = array_merge (LoadLang('index', 'admin'), LoadLang_askin());

/*if(isset($_POST['param1'])) {
	function example_post() {
		global $config;
		
		echo 'Привет';
	}
	echo "I get param1 = ".$_POST['param1']." and param2 = ".$_POST['param2'];
}


/*
$path_parts['dirname']
$path_parts['basename']
$path_parts['extension']
$path_parts['filename'] // начиная с PHP 5.2.0

//$arr = parse_ini_file( "test.ini" , TRUE );print_r( $arr );


$message="";

if(isset($_REQUEST["creattpl"])) {
	$filename_sms = $_REQUEST["creattpl"];
	$path_parts = pathinfo(parse_url($filename_sms, PHP_URL_PATH));
	$filename = '../../../../templates/'.$filename_sms;
	$text ='<p>Пустой шаблон</p>';

	if (!file_exists('../../../../templates/'.$path_parts['dirname'])) {
		if (mkdir('../../../../templates/'.$path_parts['dirname'], 0644, true)) {
			$message=$message. 'Папка создана.<br/>';
	   }
	}

	if( file_exists($filename)) {
		$message=$message."Такой файл уже существует.<br/>";
		if(!is_writeable($filename)) {
			$message=$message."Вы не можете записать в этот файл.<br/>";
		}
	} else {
		if(!touch($filename)) {
			$message=$message."Нельзя создать файл.<br/>";
		} else {
			$f = fopen($filename , "w");
			fwrite($f , $text);
			fclose($f);
			$message=$message.'Файл <b>'.$filename_sms.'</b> успешно создан!<br/>';
		}
	}
	$sms="MyCallback(\"$message\");";
	echo $sms;
}

if(isset($_REQUEST["deltpl"])) {
	$filename_sms = $_REQUEST["deltpl"];
	$path_parts = pathinfo(parse_url($filename_sms, PHP_URL_PATH));
	$filename = '../../../../templates/'.$filename_sms;
	unlink($filename);
	$message=$message.'Файл <b>'.$filename_sms.'</b> удален.<br/>';
	$sms="MyCallback(\"$message\");";
	echo $sms;
}*/
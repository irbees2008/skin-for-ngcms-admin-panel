<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

@include_once root.'skins/default/inc/functions.php';
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

//Загрузка языка скина админ панели
function LoadLang_askin($what, $area = '') {
	global $config;
	$filename = 'lang/'.$config['default_lang'].'/skin.ini';
	
	if (!$content = parse_ini_file($filename, true)) {
		$filename = 'lang/english/skin.ini';
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

if (is_array($userROW)) {
	$newpm = $mysql->result("SELECT count(pmid) FROM ".prefix."_users_pm WHERE to_id = ".db_squote($userROW['id'])." AND viewed = '0'");
	$newpm = ($newpm != "0") ? '<b>'.$newpm.'</b>' : '0';

	// Calculate number of un-approved news
	$unapproved = '';
	if ($userROW['status'] == 1 || $userROW['status'] == 2) {
		$unapp = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '0'");
		if ($unapp)
			$unapproved = ' [ <a href="?mod=news&amp;status=2"><font color="red"><b>'.$unapp.'</b></font></a> ] ';
	}
}

$skins_url = skins_url;

$mod = $_REQUEST['mod'];
$action = isset($_REQUEST['action'])?$_REQUEST['action']:'';

$h_active_options = (in_array($mod, array('options', 'categories', 'static')))?' class="active"':'';
$h_active_extras = (($mod=='extra-config')||($mod=='extras'))?' class="active"':'';
$h_active_addnews = (($mod=='news')&&($action=='add'))?' class="active"':'';
$h_active_editnews = (($mod=='news')&&($action!='add'))?' class="active"':'';
$h_active_images = ($mod=='images')?' class="active"':'';
$h_active_files = ($mod=='files')?' class="active"':'';
$h_active_pm = ($mod=='pm')?' class="active"':'';

$skin_header = <<<HTML
<!DOCTYPE html>
<html lang="$lang[langcode]">
<head>
 <meta charset="$lang[encoding]">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
 <title>$config[home_title] - $lang[adminpanel]</title>
 <link rel="stylesheet" href="$skins_url/css/style.css">
 <link rel="stylesheet" href="$config[home_url]/lib/jqueryui/jquery-ui-1.9.0.custom.css">
 <link rel="stylesheet" href="$config[home_url]/lib/jquery-ui-timepicker-addon.css">
 <link rel="stylesheet" href="$config[home_url]/lib/jquery.multiselect.css">
 <link rel="stylesheet" href="$skins_url/font-awesome/4.3.0/css/font-awesome.min.css">
 <script src="$config[home_url]/lib/jquery-1.8.2.min.js"></script>
 <script src="$config[home_url]/lib/jquery-ui-1.9.0.custom.min.js"></script>
 <script src="$config[home_url]/lib/jquery-ui-timepicker-addon.js"></script>
 <script src="$config[home_url]/lib/jquery.multiselect.min.js"></script>
 <script src="$config[home_url]/lib/functions.js"></script>
 <script src="$config[home_url]/lib/admin.js"></script>
 <script src="$skins_url/js/custom.js"></script>
	<script type="text/javascript">
	$(function () {
    $('.navbar-toggle').click(function () {
        $('.navbar-nav').toggleClass('slide-in');
        $('.side-body').toggleClass('body-slide-in');        
    });
});


navHover = function() {
        var lis = document.getElementById("navmenu-v").getElementsByTagName("li");
        for (var i=0; i<lis.length; i++) {
                lis[i].onmouseover=function() {
                        this.className+=" iehover";
                }
                lis[i].onmouseout=function() {
                        this.className=this.className.replace(new RegExp(" iehover\\b"), "");
                }
        }
}
if (window.attachEvent) window.attachEvent("onload", navHover);

$(document).ready(function(){
	$('.navbar a, .navbutton').each(function () {
		var location = window.location.href;
		var link = this.href; 
		if(location == link) {
			$(this).addClass('active');
		}
	});
	
	$('.navbutton').click(function(){
		$('.navbutton').each(function () {
			$('.navbutton').removeClass('active')
		});
		$(this).addClass('active');
	});
});
</script>
</head>
<body>
<div id="loading-layer"><i class="fa fa-spinner fa-pulse"></i> $lang[loading]</div>
    <nav class="navbar" role="navigation">
		<div class="navbar-header">
			<span class="navbar-toggle"><i class="fa fa-bars"></i></span>
			<a class="navbar-brand fl" href="$config[home_url]" title="$lang[mainpage_t]" target="_blank"><span class="mobile-hide-480">$config[home_title]</span> <i class="fa fa-external-link"></i></a>
			<a class="navbar-brand fr" href="$PHP_SELF?action=logout" title="$lang[logout_t]"><i class="fa fa-sign-out"></i></a>
			<a class="navbar-brand fr" href="$PHP_SELF?mod=pm" title="$lang[pm_t]"><i class="fa fa-envelope-o"></i> ($newpm)</a>
			<a class="navbar-brand fr" href="?mod=news&action=add" title="$lang[addnews_t]"><i class="fa fa-file-o"></i></a>
		</div>
	<div class="side-menu-container">
        <ul class="navbar-nav" id="navmenu-v">
			<li><a href="$PHP_SELF?mod=news"$h_active_addnews><i class="fa fa-newspaper-o"></i> Новости<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=news">Все новости</a></li>
					<li><a href="$PHP_SELF?mod=news&action=add">Добавить новость</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=categories"><i class="fa fa-folder-open-o"></i> Категории<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=categories">Все категории</a></li>
					<li><a href="$PHP_SELF?mod=categories&action=add">Добавить категорию</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=static"><i class="fa fa-file-text-o"></i> Статьи<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=static">Все статьи</a></li>
					<li><a href="$PHP_SELF?mod=static&action=addForm">Добавить статью</a></li>
				</ul>
			</li>
			<!--li><a href="$PHP_SELF?mod=files"><i class="fa fa-file-image-o"></i> Медиафайлы<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=files">Файлы</a></li>
					<li><a href="$PHP_SELF?mod=images">Изображения</a></li>
				</ul>
			</li-->

			<li><a href="$PHP_SELF?mod=images"><i class="fa fa-file-image-o"></i> Изображения<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=images&action=list">Список</a></li>
					<li><a href="$PHP_SELF?mod=images&action=uploadnew">Загрузить</a></li>
					<li><a href="$PHP_SELF?mod=images&action=categories">Категории</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=files"><i class="fa fa-file-archive-o"></i> Файлы<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=files&action=list">Список</a></li>
					<li><a href="$PHP_SELF?mod=files&action=uploadnew">Загрузить</a></li>
					<li><a href="$PHP_SELF?mod=files&action=categories">Категории</a></li>
				</ul>
			</li>

			<li><a href="$PHP_SELF?mod=users"><i class="fa fa-users"></i> Пользователи<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=users">Управление</a></li>
					<li><a href="$PHP_SELF?mod=ipban">Блокировка</a></li>
					<li><a href="$PHP_SELF?mod=ugroup">Группы</a></li>
					<li><a href="$PHP_SELF?mod=perm">Права доступа</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=extras" $h_active_extras><i class="fa fa-puzzle-piece"></i> $lang[extras]<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=extras&action=all">$lang[extras_list_all]</a></li>
					<li><a href="$PHP_SELF?mod=extras&action=active">$lang[extras_list_active]</a></li>
					<li><a href="$PHP_SELF?mod=extras&action=inactive">$lang[extras_list_inactive]</a></li>
					<li><a href="$PHP_SELF?mod=extras&action=uninstalled">$lang[extras_list_needinstall]</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=templates"><i class="fa fa-th-large"></i> Шаблоны</a></li>
			<li><a href="$PHP_SELF?mod=options"><i class="fa fa-cogs"></i> Настройки<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=options">Все настройки</a></li>
					<li><a href="$PHP_SELF?mod=dbo">База данных</a></li>
					<li><a href="$PHP_SELF?mod=rewrite">Форматы ссылок</a></li>
					<li><a href="$PHP_SELF?mod=cron">Планировщик задач</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=configuration"><i class="fa fa-wrench"></i> Настройка системы</a></li>
			<li><a href="$PHP_SELF?mod=statistics"><i class="fa fa-line-chart"></i> Статистика</a></li>
			<li><a href="http://ngcms.ru/forum/" target="_blank"><i class="fa fa-heartbeat"></i> Форум поддержки</a></li>
			<li><a href="$config[home_url]/readme/docs/index.html" target="_blank"><i class="fa fa-leanpub"></i> Документация</a></li>
		
	
</nav>
<div id="adminDataBlock" class="side-body">
HTML;


$skin_footer = <<<HTML
</div>
	<footer class="footer">
				<div>
					<p>&copy;  2008-2015 <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a></p>
				</div>
	</footer>
</body>
</html>
HTML;
?>
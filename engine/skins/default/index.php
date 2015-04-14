<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

// Load skin language
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
	$newpm = ($newpm != "0") ? $newpm : '0';

	// Calculate number of un-approved news
	$unapproved = '';
	if ($userROW['status'] == 1 || $userROW['status'] == 2) {
		$unapp = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '0'");
		if ($unapp)
			$unapproved = '<a class="navbar-brand fr" href="?mod=news&amp;status=2" title="�� ���������"><i class="fa fa-file-o"></i> ('.$unapp.')</a>';
	}
}

$skins_url = skins_url;

$mod = $_REQUEST['mod'];
$action = isset($_REQUEST['action'])?$_REQUEST['action']:'';

$h_active_pm = ($mod=='pm')?' class="active"':'';

$h_active_news = (($mod=='news'))?' class="active"':'';
$h_active_categories = (($mod=='categories'))?' class="active"':'';
$h_active_static = (($mod=='static'))?' class="active"':'';
$h_active_images = ($mod=='images')?' class="active"':'';
$h_active_files = ($mod=='files')?' class="active"':'';
$h_active_users = (($mod=='users')||($mod=='ipban')||($mod=='ugroup')||($mod=='perm'))?' class="active"':'';
$h_active_extras = (($mod=='extra-config')||($mod=='extras'))?' class="active"':'';
$h_active_templates = ($mod=='templates')?' class="active"':'';
$h_active_options = (($mod=='options')||($mod=='dbo')||($mod=='rewrite')||($mod=='cron'))?' class="active"':'';
$h_active_configuration = ($mod=='configuration')?' class="active"':'';
$h_active_statistics = ($mod=='statistics')?' class="active"':'';

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
	</head>
<body>
<div id="loading-layer"><i class="fa fa-spinner fa-pulse"></i> $lang[loading]</div>
    <nav class="navbar" role="navigation">
		<div class="navbar-header">
			<span class="navbar-toggle"><i class="fa fa-bars"></i></span>
			<a class="navbar-brand fl" href="$config[home_url]" title="$lang[mainpage_t]" target="_blank"><span class="mobile-hide-480">$config[home_title]</span> <i class="fa fa-external-link"></i></a>
			<a class="navbar-brand fr mobile-hide-320" href="$PHP_SELF?action=logout" title="$lang[logout_t]"><i class="fa fa-sign-out"></i></a>
			<a class="navbar-brand fr" href="$PHP_SELF?mod=pm" title="$lang[pm_t]"><i class="fa fa-envelope-o"></i> ($newpm)</a>
			$unapproved
		</div>
	<div class="side-menu-container">
		<ul class="navbar-nav" id="navmenu-v">
			<li><a href="$PHP_SELF?mod=news"$h_active_news><i class="fa fa-newspaper-o"></i> �������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=news">��� �������</a></li>
					<li><a href="$PHP_SELF?mod=news&action=add">�������� �������</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=categories"$h_active_categories><i class="fa fa-folder-open-o"></i> ���������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=categories">��� ���������</a></li>
					<li><a href="$PHP_SELF?mod=categories&action=add">�������� ���������</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=static"$h_active_static><i class="fa fa-file-text-o"></i> ������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=static">��� ������</a></li>
					<li><a href="$PHP_SELF?mod=static&action=addForm">�������� ������</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=images"$h_active_images><i class="fa fa-file-image-o"></i> �����������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=images&action=list">��� �����������</a></li>
					<li><a href="$PHP_SELF?mod=images&action=uploadnew">��������� �����������</a></li>
					<li><a href="$PHP_SELF?mod=images&action=categories">��������� �����������</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=files"$h_active_files><i class="fa fa-file-archive-o"></i> �����<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=files&action=list">��� �����</a></li>
					<li><a href="$PHP_SELF?mod=files&action=uploadnew">��������� ����</a></li>
					<li><a href="$PHP_SELF?mod=files&action=categories">��������� ������</a></li>
				</ul>
			</li>

			<li><a href="$PHP_SELF?mod=users"$h_active_users><i class="fa fa-users"></i> ������������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=users">����������</a></li>
					<li><a href="$PHP_SELF?mod=ipban">����������</a></li>
					<li><a href="$PHP_SELF?mod=ugroup">������</a></li>
					<li><a href="$PHP_SELF?mod=perm">����� �������</a></li>
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
			<li><a href="$PHP_SELF?mod=templates"$h_active_templates><i class="fa fa-th-large"></i> �������</a></li>
			<li><a href="$PHP_SELF?mod=options"$h_active_options><i class="fa fa-cogs"></i> ���������<i class="fa fa-angle-right fr"></i></a>
				<ul> 
					<li><a href="$PHP_SELF?mod=options">��� ���������</a></li>
					<li><a href="$PHP_SELF?mod=dbo">���� ������</a></li>
					<li><a href="$PHP_SELF?mod=rewrite">������� ������</a></li>
					<li><a href="$PHP_SELF?mod=cron">����������� �����</a></li>
				</ul>
			</li>
			<li><a href="$PHP_SELF?mod=configuration"$h_active_configuration><i class="fa fa-wrench"></i> ��������� �������</a></li>
			<li><a href="$PHP_SELF?mod=statistics"$h_active_statistics><i class="fa fa-line-chart"></i> ����������</a></li>
			<li><a href="http://ngcms.ru/forum/" target="_blank"><i class="fa fa-heartbeat"></i> ����� ���������</a></li>
			<li><a href="$config[home_url]/readme/docs/index.html" target="_blank"><i class="fa fa-leanpub"></i> ������������</a></li>
		</ul>
	</div>
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
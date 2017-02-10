<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

if ( !in_array($config['default_lang'], array('russian', 'english'))) {
	$config['default_lang'] = 'english';
}

// Load skin language
function LoadLang_Askin() {
	global $config;
	
	$filename = root . 'skins/default/lang/' . $config['default_lang'] . '/admin/index.ini';
	
	if (!$content = parse_ini_file($filename, true)) {
		$filename = root . 'skins/default/lang/english/admin/index.ini';
		$content = parse_ini_file($filename, true);
	}
	
	return $content;
}

$lang = array_merge(LoadLang('index', 'admin'), LoadLang_Askin());

$skins_url = skins_url;

//////////////
LoadPluginLibrary('uprofile', 'lib');
$skin_UAvatar = ( isset($userROW['avatar']) and !empty($userROW['avatar']) and function_exists('userGetAvatar'))? userGetAvatar($userROW)[1] : $skins_url . '/assets/img/default-avatar.jpg';
$skin_UStatus = $UGROUP[$userROW['status']]['langName'][$config['default_lang']];
///////////////////

// switchTheme
if ( isset($_COOKIE['theme-style'] )
	and $_COOKIE['theme-style'] != 'default'
	and $_COOKIE['theme-style'] != 'undefined'
	and !empty($_COOKIE['theme-style']) ) {
	$themeStyle = $skins_url . '/assets/css/themes/' . $_COOKIE["theme-style"] . '.css';
} else {
	$themeStyle = $skins_url . '/assets/css/bootstrap.css';
}

$year = date("Y");

if (is_array($userROW)) {
	$unnAppCount = '0';
	$newpm = '';
	$unapp1 = '';
	$unapp2 = '';
	
	$newpm = $mysql->result("SELECT count(pmid) FROM ".prefix."_users_pm WHERE to_id = ".db_squote($userROW['id'])." AND viewed = '0'");
	$newpmText = ($newpm != "0") ? $newpm . ' ' . Padeg($newpm, $lang['head_pm_skl']) : $lang['head_pm_no'];
	
	// Calculate number of un-approved news
	if ( $userROW['status'] == 1 || $userROW['status'] == 2 ) {
		$unapp1 = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '-1'");
		$unapp2 = $mysql->result("SELECT count(id) FROM ".prefix."_news WHERE approve = '0'");
		$unapp3 = $mysql->result("SELECT count(id) FROM ".prefix."_static WHERE approve = '0'");
		if ($unapp1)
			$unapproved1 = '<li><a href="'.$PHP_SELF.'?mod=news&status=1"><i class="fa fa-ban"></i> ' . $unapp1 . ' ' . Padeg($unapp1, $lang['head_news_draft_skl']) . '</a></li>';
		if ($unapp2)
			$unapproved2 = '<li><a href="'.$PHP_SELF.'?mod=news&status=2"><i class="fa fa-times"></i> ' . $unapp2 . ' ' . Padeg($unapp2, $lang['head_news_pending_skl']) . '</a></li>';
		if ($unapp3)
			$unapproved3 = '<li><a href="'.$PHP_SELF.'?mod=static"><i class="fa fa-times"></i> ' . $unapp3 . ' ' . Padeg($unapp3, $lang['head_stat_pending_skl']) . '</a></li>';
	}
	
	$unnAppCount = (int)$newpm + (int)$unapp1 + (int)$unapp2 + (int)$unapp3;
	$unnAppLabel = ($unnAppCount != "0" ) ? '<span class="label label-danger">' . $unnAppCount . '</span>' : '';
	$unnAppText = $lang['head_notify'] . (($unnAppCount != "0") ? $unnAppCount . ' ' . Padeg($unnAppCount, $lang['head_notify_skl']) : $lang['head_notify_no'] );
}

$mod = $_REQUEST['mod']? $_REQUEST['mod'] : 'statistics';
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';

$h_active_pm = ($mod=='pm')?' active':'';
$h_active_content = ( $mod=='news' || $mod=='categories' || $mod=='static' || $mod=='images' || $mod=='files' )?' class="active"':'';

$h_active_users = (($mod=='users')||($mod=='ipban')||($mod=='ugroup')||($mod=='perm'))?' class="active"':'';
$h_active_extras = (($mod=='extra-config')||($mod=='extras'))?' class="active"':'';
$h_active_templates = ($mod=='templates')?' class="active"':'';
$h_active_options = (($mod=='')||($mod=='options')||($mod=='configuration')||($mod=='statistics')||($mod=='dbo')||($mod=='rewrite')||($mod=='cron'))?' class="active"':'';

$skin_header = <<<HTML
<!DOCTYPE html>
<html lang="$lang[langcode]">
<head>
	<meta charset="$lang[encoding]">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>$config[home_title] - $lang[$mod] ($lang[adminpanel])</title>
	<link href="$skins_url/assets/css/fontawesome.css" rel="stylesheet">
	<link href="$themeStyle" rel="stylesheet">
	<link href="$skins_url/css/style.css" rel="stylesheet">

	<script src="$skins_url/assets/js/jquery-2.1.4.min.js"></script>
	<script src="$skins_url/assets/js/bootstrap.js"></script>
	<script src="$skins_url/assets/js/notify.js"></script>
	<script src="$skins_url/js/script.js"></script>
	<script src="$config[home_url]/lib/functions.js"></script>
	<script src="$config[home_url]/lib/admin.js"></script>
</head>
<body>
	
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle sidebar-toggle">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand hidden-xs" href="admin.php" title="$lang[mainpage_t]">Next Generation CMS</a>
			</div>
			
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-plus"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="$PHP_SELF?mod=news&action=add">$lang[head_add_news]</a></li>
							<li><a href="$PHP_SELF?mod=categories&action=add">$lang[head_add_cat]</a></li>
							<li><a href="$PHP_SELF?mod=static&action=addForm">$lang[head_add_stat]</a></li>
							<li><a href="$PHP_SELF?mod=users" class="add_form">$lang[head_add_user]</a></li>
						</ul>
					</li>
					<li class="dropdown notifications-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>$unnAppLabel
						</a>
						<ul class="dropdown-menu">
							<li class="header">$unnAppText</li>
							$unapproved1
							$unapproved2
							$unapproved3
							<li><a href="$PHP_SELF?mod=pm" title="$lang[pm_t]"><i class="fa fa-envelope-o"></i> $newpmText</a></li>
						</ul>
					</li>
					<li class="dropdown user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="$skin_UAvatar" class="img-circle" alt="User Image" width="25" height="25"> <span class="hidden-xs">$userROW[name]</span></a>
						<ul class="dropdown-menu">
							<li class="user-header">
								<!--img src="http://lorempixel.com/output/nature-q-c-280-100-5.jpg"-->
							</li>
							<li class="user-avatar">
								<img src="$skin_UAvatar" class="img-circle" alt="User Image">
							</li>
							<li class="user-body">
								<p><b>$userROW[name]</b><br>$skin_UStatus</p>
							</li>
							<li class="user-footer">
							<div class="pull-left"><a href="?mod=users&action=editForm&id=$userROW[id]" class="btn btn-default btn-flat">$lang[my_profile]</a></div>
								<div class="pull-right"><a href="$PHP_SELF?action=logout" title="$lang[logout_t]" class="btn btn-default btn-flat">Выход</a></div></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="side-menu-container navbar navbar-inverse">
		<ul class="nav navbar-nav">
			
			<li><a href="$config[home_url]" target="_blank"><i class="fa fa-external-link"></i> $lang[mainpage]</a></li>
			
			<li>
				<a href="#active_content" data-toggle="collapse" $h_active_content>
					<i class="fa fa-newspaper-o"></i> $lang[content] <span class="caret"></span></a>
				<ul id="active_content" class="navbar-nav panel-collapse collapse">
					<li><a href="$PHP_SELF?mod=news">$lang[content_news]</a></li>
					<li><a href="$PHP_SELF?mod=categories">$lang[content_categories]</a></li>
					<li><a href="$PHP_SELF?mod=static">$lang[content_static]</a></li>
					<li><a href="$PHP_SELF?mod=images">$lang[content_images]</a></li>
					<li><a href="$PHP_SELF?mod=files">$lang[content_files]</a></li>
				</ul>
			</li>
			
			<li>
				<a href="#h_active_users" data-toggle="collapse" $h_active_users>
					<i class="fa fa-users"></i> $lang[users] <span class="caret"></span></a>
				<ul id="h_active_users" class="navbar-nav panel-collapse collapse">
					<li><a href="$PHP_SELF?mod=users">$lang[users_management]</a></li>
					<li><a href="$PHP_SELF?mod=ipban">$lang[users_blocked]</a></li>
					<li><a href="$PHP_SELF?mod=ugroup">$lang[users_groups]</a></li>
					<li><a href="$PHP_SELF?mod=perm">$lang[users_perm]</a></li>
				</ul>
			</li>
			
			<li><a href="$PHP_SELF?mod=extras" $h_active_extras><i class="fa fa-puzzle-piece"></i> $lang[extras]</a></li>
			
			<li><a href="$PHP_SELF?mod=templates" $h_active_templates><i class="fa fa-th-large"></i> $lang[templates]</a></li>
			
			<li>
				<a href="#h_active_options" data-toggle="collapse" $h_active_options>
					<i class="fa fa-cogs"></i> $lang[options] <span class="caret"></span></a>
				<ul id="h_active_options" class="navbar-nav panel-collapse collapse">
					<li><a href="$PHP_SELF?mod=options">$lang[options_all]</a></li>
					<li><a href="$PHP_SELF?mod=configuration">$lang[options_system]</a></li>
					<li><a href="$PHP_SELF?mod=dbo">$lang[options_database]</a></li>
					<li><a href="$PHP_SELF?mod=rewrite">$lang[options_rewrite]</a></li>
					<li><a href="$PHP_SELF?mod=cron">$lang[options_cron]</a></li>
					<li><a href="$PHP_SELF?mod=statistics">$lang[options_statistics]</a></li>
				</ul>
			</li>

			<li>
				<a href="#active_help" data-toggle="collapse" $active_help>
					<i class="fa fa-leanpub"></i> $lang[help] <span class="caret"></span></a>
				<ul id="active_help" class="navbar-nav panel-collapse collapse">
					<li><a href="http://ngcms.ru/forum/" target="_blank"> Форум поддержки</a></li>
					<li><a href="http://wiki.ngcms.ru/" target="_blank"> Wiki NG CMS</a></li>
					<li><a href="http://ngcms.ru/" target="_blank"> Официальный сайт</a></li>
				</ul>
			</li>
        </ul>
	</div>
	
	<main id="adminDataBlock" class="side-body">
		
		<noscript>
			<div class="alert alert-danger" role="alert">Внимание! В вашем браузере отключен <b>JavaScript</b></div>
			<div class="alert alert-info" role="alert">Для полноценной работы с админ. панелью <b>включите его</b></div>
		</noscript>
HTML;


$skin_footer = <<<HTML
	</main>
	
	<footer class="footer">
		&copy;  2008-$year <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a>
	</footer>
	
	<div id="modal-dialog" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div id="loading-layer" class="col-md-3"><i class="fa fa-spinner fa-pulse"></i> $lang[loading]</div>
	<div id="scrollup" class="fa fa-angle-up"></div>
	<div id="sidenav-overlay"></div>
</body>
</html>
HTML;

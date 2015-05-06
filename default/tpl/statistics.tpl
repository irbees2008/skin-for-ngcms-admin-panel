<h2 class="content-head">Статистика системы</h2>
<style type="text/css"> 
.statistic-box { font-size: 80%; width: 48%; float: left; margin-right: 2%; margin-bottom: 2%;}
.statistic-box, .content-sidebar-right {background: #fff; border: 1px solid #ddd; box-shadow: 0 0 4px #ccc; padding: 0 1.5em 2em;}
.statistic-box ul {margin: 0; padding: 0;}
.statistic-box span {float: right;}
.content-sidebar-right textarea {min-height: 301px;}
@media only screen and (max-width: 768px), (min-device-width: 480px) and (max-device-width: 768px)  {.statistic-box { width: 100%; argin-right: 0;}}
#modalmsgDialog { position: absolute; left: 0; top: 0; width: 100%; height: 100%; display: none;}
#modalmsgWindow { margin: 5px; padding: 5px; border: 1px solid #ccc; background-color: #F0F0F0; width: 400px; position: absolute; left: 40%; top: 40%; }
#modalmsgWindowText { background-color: #fff; }
#modalmsgWindowButton { background-color: #fff; text-align: center; padding: 5px; }
</style>
<div class="content-main-left">
	<div class="statistic-box">
		<h3>{{ lang['server'] }}</h3>
		<ul>
			<li class="clear">
				{{ lang['os'] }}
				<span>{{ php_os }}</span>
			</li>
			<li class="clear">
				{{ lang['php_version'] }} / {{ lang['mysql_version'] }}
				<span>{{ php_version }} / {{ mysql_version }}</span>
			</li>
			<li class="clear">
				{{ lang['gd_version'] }}
				<span>{{ gd_version }}</span>
			</li>
		</ul>
	</div>
	
	<div class="statistic-box">
		<h3>Next Generation CMS</h3>
		<ul>
			<li class="clear">
				{{ lang['current_version'] }}
				<span style="font-weight: bold; color: #6cb7ef;">{{ currentVersion }}</span>
			</li>
			<li class="clear">
				{{ lang['last_version'] }}
				<span id="syncLastVersion">loading..</span>
			</li>
			<li class="clear">
				{{ lang['svn_version'] }}
				<span id="syncSVNVersion">loading..</span>
			</li>
		</ul>
	<script type="text/javascript" language="JavaScript" src="{{versionNotifyURL }}"></script>
	</div>
	
	<div class="statistic-box">
		<h3>{{ lang['system'] }}</h3>
		<ul>
			<li class="clear">
				{{ lang['all_cats'] }}
				<span>{{ categories }}</span>
			</li>
			<li class="clear">
				{{ lang['all_news'] }}
				<span><a href="?mod=news&status=1">{{ news_draft }}</a> / <a href="?mod=news&status=2">{{ news_unapp }}</a> / <a href="?mod=news&status=3">{{ news }}</a></span>
			</li>
			<li class="clear">
				{{ lang['all_comments'] }}
				<span>{{ comments }}</span>
			</li>
			<li class="clear">
				{{ lang['all_users'] }}
				<span>{{ users }}</span>
			</li>
			<li class="clear">
				{{ lang['all_users_unact'] }}
				<span>{{ users_unact }}</span>
			</li>
			<li class="clear">
				{{ lang['all_images'] }}
				<span>{{ images }}</span>
			</li>
			<li class="clear">
				{{ lang['all_files'] }}
				<span>{{ files }}</span>
			</li>
		</ul>
	</div>
	
	<div class="statistic-box">
		<h3>{{ lang['size'] }}</h3>
		<ul>
			<li class="clear">
				{{ lang['allowed_size'] }}
				<span>{{ allowed_size }}</span>
			</li>
			<li class="clear">
				{{ lang['mysql_size'] }}
				<span>{{ mysql_size }}</span>
			</li>
		</ul>
		<table>
			<tr>
				<td>{{ lang['group'] }}</td>
				<td align="right">{{ lang['amount'] }}</td>
				<td align="right">{{ lang['volume'] }}</td>
				<td> &nbsp; {{ lang['permissions'] }}</td>
			</tr>
			<tr>
				<td>{{ lang['group_images'] }}</td>
				<td align="right">{{ image_amount }}</td>
				<td align="right">{{ image_size }}</td>
				<td> &nbsp; {{ image_perm }}</td>
			</tr>
			<tr>
			<td>{{ lang['group_files'] }}</td><td align="right">{{ file_amount }}</td><td align="right">{{ file_size }}</td><td> &nbsp; {{ file_perm }}</td></tr>
			<tr>
			<td>{{ lang['group_photos'] }}</td><td align="right">{{ photo_amount }}</td><td align="right">{{ photo_size }}</td><td>&nbsp; {{ photo_perm }}</td></tr>
			<tr><td>{{ lang['group_avatars'] }}</td><td align="right">{{ avatar_amount }}</td><td align="right">{{ avatar_size }}</td><td> &nbsp; {{ avatar_perm }}</td></tr>
			<tr><td>{{ lang['group_backup'] }}</td><td align="right">{{ backup_amount }}</td><td align="right">{{ backup_size }}</td><td> &nbsp; {{ backup_perm }}</td>
			</tr>
		</table>
	</div>
		 
	<table>
		<tr>
			<td width="50%" style="padding-left:10px;" valign="top">
			{% if (flags.confError) %}
				<!-- Configuration errors -->
				 <table border="0" width="100%" cellspacing="0" cellpadding="0">
					 <tr>
						 <td colspan="2" class="contentHead"><img src="{{ skins_url }}/images/nav.gif" hspace="8" alt="" /><font color="red">{{ lang['pconfig.error'] }}</font></td>
					</tr>
					<tr>
						<td>
							<table width="100%">
								<thead>
								<tr>
									<td>{{ lang['perror.parameter'] }}</td><td>{{ lang['perror.shouldbe'] }}</td><td>{{ lang['perror.set'] }}</td>
								</tr>
								</thead>
								<tr><td>Register Globals</td><td>Отключено</td><td>{{ flags.register_globals }}</td></tr>
								<tr><td>Magic Quotes GPC</td><td>Отключено</td><td>{{ flags.magic_quotes_gpc }}</td></tr>
								<tr><td>Magic Quotes Runtime</td><td>Отключено</td><td>{{ flags.magic_quotes_runtime }}</td></tr>
								<tr><td>Magic Quotes Sybase</td><td>Отключено</td><td>{{ flags.magic_quotes_sybase }}</td></tr>
							</table>
							<br/>
							&nbsp;<a style="cursor: pointer; color: red;" onclick="document.getElementById('perror_resolve').style.display='block';">{{ lang['perror.howto'] }}</a><br/>
							<div id="perror_resolve" style="display: none;">
							{{ lang['perror.descr'] }}
							</div>
						 </td>
					 </tr>
				 </table>
			{% endif %}
			</td>
		</tr>
	</table>
</div>

<div class="content-sidebar-right clear">
		<h3>{{ lang['note'] }}</h3>
		<form method="post" action="{{ php_self }}?mod=statistics">
			<input type="hidden" name="action" value="save" />
			<textarea name="note">{{ admin_note }}</textarea>
			<input class="fr" type="submit" value="{{ lang['save_note'] }}" />
		</form>
</div>

<div id="modalmsgDialog" onclick="_modal_close();">
	<span id="modalmsgWindow">
		<div id="modalmsgWindowText"></div>
		<div id="modalmsgWindowButton">
			<input type="button" value="OK"/>
		</div>
	</span>
</div>
<script>
function showModal(text) {
 document.getElementById('modalmsgDialog').style.display='block';
 document.getElementById('modalmsgWindowText').innerHTML = text;
}
function _modal_close() {
 document.getElementById('modalmsgDialog').style.display='none';
}
</script>
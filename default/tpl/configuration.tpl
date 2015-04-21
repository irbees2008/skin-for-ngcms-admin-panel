<h2 class="content-head">{{ lang['configuration_title'] }}</h2>

<div class="content tabs clear" id="userTabs">
<form method="post" action="{{ php_self }}">
	<input type="hidden" name="mod" value="configuration" />
	<input type="hidden" name="token" value="{{ token }}"/>
	<input type="hidden" name="selectedOption" id="selectedOption" />
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>{{ lang['db'] }}</li>
		<li>{{ lang['security'] }}</li>
		<li>{{ lang['syst'] }}</li>
		<li>{{ lang['sn'] }}</li>
		<li>{{ lang['users'] }}</li>
		<li>{{ lang['files'] }}/{{ lang['img'] }}</li>
		<li>{{ lang['cache'] }}</li>
		<li>{{ lang['multi'] }}</li>
	</ul>
	<!-- /Navigation bar -->
	
	<!-- ########################## DB TAB ########################## -->
	<div class="tabs-content" id="userTabs-db">
		<!-- TABLE DB//Connection -->
		<h3 class="content-title">{{ lang['db_connect'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['dbhost'] }}</h4>
					<p>{{ lang['example'] }} localhost</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[dbhost]" value="{{ config['dbhost'] }}" id="db_dbhost" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['dbname'] }}</h4>
					<p>{{ lang['example'] }} ng</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[dbname]" value="{{ config['dbname'] }}" id="db_dbname" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['dbuser'] }}</h4>
					<p>{{ lang['example'] }} root</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[dbuser]" value="{{ config['dbuser'] }}" id="db_dbuser" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['dbpass'] }}</h4>
					<p>{{ lang['example'] }} password</p>
				</div>
				<div class="config-var"><input type="password" name="save_con[dbpasswd]" value="{{ config['dbpasswd'] }}" id="db_dbpasswd" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['dbprefix'] }}</h4>
					<p>{{ lang['example'] }} ng</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[prefix]" value="{{ config['prefix'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title"></h4>
					<p></p>
				</div>
				<div class="config-var"><input class="fr" type="button" value="{{ lang['btn_checkDB'] }}" onclick="ngCheckDB(); return false;"/></div>
			</li>
		</ul>
		<!-- END: TABLE DB//Connection -->
		
		<!-- TABLE DB//Backup -->
		<h3 class="content-title">{{ lang['db_backup'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['auto_backup'] }}</h4>
					<p>{{ lang['auto_backup_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[auto_backup]', 'value' : config['auto_backup'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['auto_backup_time'] }}</h4>
					<p>{{ lang['auto_backup_time_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[auto_backup_time]" value="{{ config['auto_backup_time'] }}" maxlength="5" /></div>
			</li>
		</ul>
		<!-- END: TABLE DB//Backup -->
	</div>
	
	<!-- ########################## SECURITY TAB ########################## -->
	<div class="tabs-content" id="userTabs-security">
	<h3 class="content-title">{{ lang['logging'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['x_ng_headers'] }}</h4>
					<p>{{ lang['x_ng_headers#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[x_ng_headers]', 'value' : config['x_ng_headers'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['syslog'] }}</h4>
					<p>{{ lang['syslog_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[syslog]', 'value' : config['syslog'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['load'] }}</h4>
					<p>{{ lang['load_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[load_analytics]', 'value' : config['load_analytics'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['load_profiler'] }}</h4>
					<p>{{ lang['load_profiler_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[load_profiler]" value="{{ config['load_profiler'] }}" /></div>
			</li>
		</ul>
	<h3 class="content-title">{{ lang['security'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['flood_time'] }}</h4>
					<p>{{ lang['flood_time_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[flood_time]" value="{{ config['flood_time'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_captcha'] }}</h4>
					<p>{{ lang['use_captcha_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_captcha]', 'value' : config['use_captcha'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['captcha_font'] }}</h4>
					<p>{{ lang['captcha_font_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[captcha_font]', 'value' : config['captcha_font'], 'values' : list['captcha_font'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_cookies'] }}</h4>
					<p>{{ lang['use_cookies_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_cookies]', 'value' : config['use_cookies'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_sessions'] }}</h4>
					<p>{{ lang['use_sessions_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_sessions]', 'value' : config['use_sessions'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['sql_error'] }}</h4>
					<p>{{ lang['sql_error_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[sql_error_show]', 'value' : config['sql_error_show'], 'values' : { 0 : lang['sql_error_0'], 1 : lang['sql_error_1'], 2 : lang['sql_error_2'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['multiext_files'] }}</h4>
					<p>{{ lang['multiext_files_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[allow_multiext]', 'value' : config['allow_multiext'] }) }}</div>
			</li>
		</ul>
		<h3 class="content-title">{{ lang['debug_generate'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['debug'] }}</h4>
					<p>{{ lang['debug_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[debug]', 'value' : config['debug'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['debug_queries'] }}</h4>
					<p>{{ lang['debug_queries_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[debug_queries]', 'value' : config['debug_queries'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['debug_profiler'] }}</h4>
					<p>{{ lang['debug_profiler_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[debug_profiler]', 'value' : config['debug_profiler'] }) }}</div>
			</li>
		</ul>
	</div>
	
	<!-- ########################## SYSTEM TAB ########################## -->
	<div class="tabs-content" id="userTabs-system">
	<h3 class="content-title">{{ lang['syst'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['home_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[home_url]" value="{{ config['home_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['admin_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/engine</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[admin_url]" value="{{ config['admin_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['home_title'] }}</h4>
					<p>{{ lang['example'] }} NGcms</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[home_title]" value="{{ config['home_title']|escape }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['admin_mail'] }}</h4>
					<p>{{ lang['example'] }} admin@server.com</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[admin_mail]" value="{{ config['admin_mail'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['lock'] }}</h4>
					<p>{{ lang['lock_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[lock]', 'value' : config['lock'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['lock_reason'] }}</h4>
					<p>{{ lang['lock_reason_desc'] }}</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[lock_reason]" value="{{ config['lock_reason'] }}" maxlength="200" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['meta'] }}</h4>
					<p>{{ lang['meta_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[meta]', 'value' : config['meta'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['description'] }}</h4>
					<p>{{ lang['description_desc'] }}</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[description]" value="{{ config['description'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['keywords'] }}</h4>
					<p>{{ lang['keywords_desc'] }}</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[keywords]" value="{{ config['keywords'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['theme'] }}</h4>
					<p>{{ lang['theme_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[theme]', 'value' : config['theme'], 'values' : list['theme'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['lang'] }}</h4>
					<p>{{ lang['lang_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[default_lang]', 'value' : config['default_lang'], 'values' : list['default_lang'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_gzip'] }}</h4>
					<p>{{ lang['use_gzip_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_gzip]', 'value' : config['use_gzip'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['404_mode'] }}</h4>
					<p>{{ lang['404_mode_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[404_mode]', 'value' : config['404_mode'], 'values' : { 0 : lang['404.int'], 1 : lang['404.ext'], 2 : lang['404.http'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['libcompat'] }}</h4>
					<p>{{ lang['libcompat_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[libcompat]', 'value' : config['libcompat'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['url_external_nofollow'] }}</h4>
					<p>{{ lang['url_external_nofollow_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[url_external_nofollow]', 'value' : config['url_external_nofollow'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['url_external_target_blank'] }}</h4>
					<p>{{ lang['url_external_target_blank_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[url_external_target_blank]', 'value' : config['url_external_target_blank'] }) }}</div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['email_configuration'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['mailfrom_name'] }}</h4>
					<p>{{ lang['example'] }} Administrator</p>
				</div>
				<div class="config-var"><input type="text" id="mail_fromname" name="save_con[mailfrom_name]" value="{{ config['mailfrom_name'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['mailfrom'] }}</h4>
					<p>{{ lang['example'] }} mailbot@server.com</p>
				</div>
				<div class="config-var"><input type="text" id="mail_frommail" name="save_con[mailfrom]" value="{{ config['mailfrom'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['mail_mode'] }}</h4>
					<p>{{ lang['mail_mode#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[mail_mode]', 'id' : 'mail_mode', 'value' : config['mail_mode'], 'values' : { 'mail' : 'mail', 'sendmail' : 'sendmail', 'smtp' : 'smtp' } }) }}</div>
			</li>
		</ul>

		<h3 class="useSMTP content-title">{{ lang['smtp_config'] }}</h3>
		<ul class="useSMTP config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_host'] }}</h4>
					<p>{{ lang['example'] }} smtp.mail.ru</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[mail][smtp][host]" id="mail_smtp_host" value="{{ config['mail']['smtp']['host'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_port'] }}</h4>
					<p>{{ lang['example'] }} 25</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[mail][smtp][port]" id="mail_smtp_port" value="{{ config['mail']['smtp']['port'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_auth'] }}</h4>
					<p>{{ lang['smtp_auth#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[mail][smtp][auth]', 'id' : 'mail_smtp_auth', 'value' : config['mail']['smtp']['auth'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_secure'] }}</h4>
					<p>{{ lang['smtp_secure#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[mail][smtp][secure]', 'id' : 'mail_smtp_secure', 'value' : config['mail']['smtp']['secure'], 'values' : { '' : 'None', 'tls' : 'TLS', 'ssl' : 'SSL' } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_auth_login'] }}</h4>
					<p>{{ lang['example'] }} email@mail.ru</p>
				</div>
				<div class="config-var"><input class="mailfrom" type="text" id="mail_smtp_login" name="save_con[mail][smtp][login]" value="{{ config['mail']['smtp']['login'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smtp_auth_pass'] }}</h4>
					<p>{{ lang['example'] }} mySuperPassword</p>
				</div>
				<div class="config-var"><input class="mailfrom" type="text" name="save_con[mail][smtp][pass]" id="mail_smtp_pass" value="{{ config['mail']['smtp']['pass'] }}" /></div>
			</li>
		</ul>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['btn_checkSMTP'] }}</h4>
					<p>¬ведите e-mail, на который будет отправлено проверочное сообщени€ с сайта</p>
				</div>
				<div class="config-var"><input id="mail_tomail" type="email" name="" value="" /><input type="button" value="ѕроверить" onclick="ngCheckEmail(); return false;"/></div>
			</li>
		</ul>
	</div>

	<!-- ########################## NEWS TAB ########################## -->
	<div class="tabs-content" id="userTabs-news">
		<h3 class="content-title">{{ lang['sn'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['number'] }}</h4>
					<p> </p>
				</div>
				<div class="config-var"><input type="number" name="save_con[number]" value="{{ config['number'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['news_multicat_url'] }}</h4>
					<p>{{ lang['news_multicat_url#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[news_multicat_url]', 'value' : config['news_multicat_url'], 'values' : { 0 : lang['news_multicat:0'], 1 : lang['news_multicat:1'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['nnavigations'] }}</h4>
					<p>{{ lang['nnavigations_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[newsNavigationsCount]" value="{{ config['newsNavigationsCount'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['category_counters'] }}</h4>
					<p>{{ lang['category_counters_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[category_counters]', 'value' : config['category_counters'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['news_view_counters'] }}</h4>
					<p>{{ lang['news_view_counters#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[news_view_counters]', 'value' : config['news_view_counters'], 'values' : { 1 : lang['yesa'], 0 : lang['noa'], 2 : lang['news_view_counters#2'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['news.edit.split'] }}</h4>
					<p>{{ lang['news.edit.split#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[news.edit.split]', 'value' : config['news.edit.split'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['news_without_content'] }}</h4>
					<p>{{ lang['news_without_content_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[news_without_content]', 'value' : config['news_without_content'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['date_adjust'] }}</h4>
					<p>{{ lang['date_adjust_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[date_adjust]" value="{{ config['date_adjust'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['timestamp_active'] }}</h4>
					<p>{{ lang['date_now'] }} <b>{{ timestamp_active_now }}</b><br>{{ lang['date_help'] }}</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[timestamp_active]" value="{{ config['timestamp_active'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['timestamp_updated'] }}</h4>
					<p>{{ lang['date_now'] }} <b>{{ timestamp_updated_now }}</b><br>{{ lang['date_help'] }}</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[timestamp_updated]" value="{{ config['timestamp_updated'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['smilies'] }}</h4>
					<p>{{ lang['smilies_desc'] }} (<b>,</b>)</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[smilies]" value="{{ config['smilies'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['blocks_for_reg'] }}</h4>
					<p>{{ lang['blocks_for_reg_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[blocks_for_reg]', 'value' : config['blocks_for_reg'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['extended_more'] }}</h4>
					<p>{{ lang['extended_more_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[extended_more]', 'value' : config['extended_more'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_smilies'] }}</h4>
					<p>{{ lang['use_smilies_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_smilies]', 'value' : config['use_smilies'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_bbcodes'] }}</h4>
					<p>{{ lang['use_bbcodes_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_bbcodes]', 'value' : config['use_bbcodes'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_htmlformatter'] }}</h4>
					<p>{{ lang['use_htmlformatter_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_htmlformatter]', 'value' : config['use_htmlformatter'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['default_newsorder'] }}</h4>
					<p>{{ lang['default_newsorder_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[default_newsorder]', 'value' : config['default_newsorder'], 'values' : { 'id desc' : lang['order_id_desc'], 'id asc' : lang['order_id_asc'], 'postdate desc' : lang['order_postdate_desc'], 'postdate asc' : lang['order_postdate_asc'], 'title desc' : lang['order_title_desc'], 'title asc' : lang['order_title_asc'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['template_mode'] }}</h4>
					<p>{{ lang['template_mode#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[template_mode]', 'value' : config['template_mode'], 'values' : { 1 : lang['template_mode.1'], 2 : lang['template_mode.2'] } }) }}</div>
			</li>
		</ul>
	</div>
	
	<!-- ########################## USERS TAB ########################## -->
	<div class="tabs-content" id="userTabs-users">
		<h3 class="content-title">{{ lang['users'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['users_selfregister'] }}</h4>
					<p>{{ lang['users_selfregister_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[users_selfregister]', 'value' : config['users_selfregister'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['register_type'] }}</h4>
					<p>{{ lang['register_type_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[register_type]', 'value' : config['register_type'], 'values' : { 0 : lang['register_extremly'], 1 : lang['register_simple'], 2 : lang['register_activation'], 3 : lang['register_manual'], 4 : lang['register_manual_confirm']  } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['user_aboutsize'] }}</h4>
					<p>{{ lang['user_aboutsize_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[user_aboutsize]" value="{{ config['user_aboutsize'] }}"  /></div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['auth'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['remember'] }}</h4>
					<p>{{ lang['remember_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[remember]', 'value' : config['remember'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['auth_module'] }}</h4>
					<p>{{ lang['auth_module_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[auth_module]', 'value' : config['auth_module'], 'values' : list['auth_module'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['auth_db'] }}</h4>
					<p>{{ lang['auth_db_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[auth_db]', 'value' : config['auth_db'], 'values' : list['auth_db'] }) }}</div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['users.avatars'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_avatars'] }}</h4>
					<p>{{ lang['use_avatars_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_avatars]', 'value' : config['use_avatars'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['avatars_gravatar'] }}</h4>
					<p>{{ lang['avatars_gravatar_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[avatars_gravatar]', 'value' : config['avatars_gravatar'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['avatars_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/uploads/avatars</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[avatars_url]" value="{{ config['avatars_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['avatars_dir'] }}</h4>
					<p>{{ lang['example'] }} /home/servercom/public_html/uploads/avatars/</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[avatars_dir]" value="{{ config['avatars_dir'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['avatar_wh'] }}</h4>
					<p>{{ lang['avatar_wh_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[avatar_wh]" value="{{ config['avatar_wh'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['avatar_max_size'] }}</h4>
					<p>{{ lang['avatar_max_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[avatar_max_size]" value="{{ config['avatar_max_size'] }}" /></div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['users.photos'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['use_photos'] }}</h4>
					<p>{{ lang['use_photos_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectYN({'name' : 'save_con[use_photos]', 'value' : config['use_photos'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['photos_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/uploads/photos</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[photos_url]" value="{{ config['photos_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['photos_dir'] }}</h4>
					<p>{{ lang['example'] }} /home/servercom/public_html/uploads/photos/</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[photos_dir]" value="{{ config['photos_dir'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['photos_max_size'] }}</h4>
					<p>{{ lang['photos_max_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[photos_max_size]" value="{{ config['photos_max_size'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['photos_thumb_size'] }}</h4>
					<p>{{ lang['photos_thumb_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[photos_thumb_size_x]" value="{{ config['photos_thumb_size_x'] }}" placeholder="”кажите ширину" /><input type="number" name="save_con[photos_thumb_size_y]" value="{{ config['photos_thumb_size_y'] }}" placeholder="”кажите высоту"/></div>
			</li>
		</ul>
	</div>
	
	<!-- ########################## IMAGES TAB ########################## -->
	<div class="tabs-content" id="userTabs-imgfiles">
		<h3 class="content-title">{{ lang['files'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['files_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/uploads/files</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[files_url]" value="{{ config['files_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['files_dir'] }}</h4>
					<p>{{ lang['example'] }} /home/servercom/public_html/uploads/files/</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[files_dir]" value="{{ config['files_dir'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['attach_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/uploads/dsn</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[attach_url]" value="{{ config['attach_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['attach_dir'] }}</h4>
					<p>{{ lang['example'] }} /home/servercom/public_html/uploads/dsn/</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[attach_dir]" value="{{ config['attach_dir'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['files_ext'] }}</h4>
					<p>{{ lang['files_ext_desc'] }}</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[files_ext]" value="{{ config['files_ext'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['files_max_size'] }}</h4>
					<p>{{ lang['files_max_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[files_max_size]" value="{{ config['files_max_size'] }}" /></div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['img'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_url'] }}</h4>
					<p>{{ lang['example'] }} http://server.com/uploads/images</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[images_url]" value="{{ config['images_url'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_dir'] }}</h4>
					<p>{{ lang['example'] }} /home/servercom/public_html/uploads/images/</p>
				</div>
				<div class="config-var"><input type="text" name="save_con[images_dir]" value="{{ config['images_dir'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_ext'] }}</h4>
					<p>{{ lang['images_ext_desc'] }}</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[images_ext]" value="{{ config['images_ext'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_max_size'] }}</h4>
					<p>{{ lang['images_max_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[images_max_size]" value="{{ config['images_max_size'] }}" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_dim_action'] }}</h4>
					<p>{{ lang['images_dim_action#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[images_dim_action]', 'value' : config['images_dim_action'], 'values' : { 0 : lang['images_dim_action#0'], 1 : lang['images_dim_action#1'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['images_max_dim'] }}</h4>
					<p>{{ lang['images_max_dim#desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[images_max_x]" value="{{ config['images_max_x'] }}" placeholder="”кажите ширину"/><input type="number" name="save_con[images_max_y]" value="{{ config['images_max_y'] }}" placeholder="”кажите высоту"/></div>
			</li>
		</ul>
		<!-- IMAGE transform control -->
		<h3 class="content-title">{{ lang['img.thumb'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['thumb_mode'] }}</h4>
					<p>{{ lang['thumb_mode_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[thumb_mode]', 'value' : config['thumb_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['thumb_size'] }}</h4>
					<p>{{ lang['thumb_size_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[thumb_size_x]" value="{{ config['thumb_size_x'] }}" placeholder="”кажите ширину" /><input type="number" name="save_con[thumb_size_y]" value="{{ config['thumb_size_y'] }}" placeholder="”кажите высоту" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['thumb_quality'] }}</h4>
					<p>{{ lang['thumb_quality_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[thumb_quality]" value="{{ config['thumb_quality'] }}" /></div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['img.shadow'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['shadow_mode'] }}</h4>
					<p>{{ lang['shadow_mode_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[shadow_mode]', 'value' : config['shadow_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['shadow_place'] }}</h4>
					<p>{{ lang['shadow_place_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[shadow_place]', 'value' : config['shadow_place'], 'values' : { 0 : lang['mode_orig'], 1 : lang['mode_copy'], 2 : lang['mode_origcopy'] } }) }}</div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['img.stamp'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['stamp_mode'] }}</h4>
					<p>{{ lang['stamp_mode_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[stamp_mode]', 'value' : config['stamp_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['stamp_place'] }}</h4>
					<p>{{ lang['stamp_place_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[stamp_place]', 'value' : config['stamp_place'], 'values' : { 0 : lang['mode_orig'], 1 : lang['mode_copy'], 2 : lang['mode_origcopy'] } }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['wm_image'] }}</h4>
					<p>{{ lang['wm_image_desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelect({'name' : 'save_con[wm_image]', 'value' : config['wm_image'], 'values' : list['wm_image'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['wm_image_transition'] }}</h4>
					<p>{{ lang['wm_image_transition_desc'] }}</p>
				</div>
				<div class="config-var"><input type="number" name="save_con[wm_image_transition]" value="{{ config['wm_image_transition'] }}" /></div>
			</li>
		</ul>
		<!-- END: IMAGE transform control -->
	</div>
	
	<!-- ########################## CACHE TAB ########################## -->
	<div class="tabs-content" id="userTabs-cache">
		<h3 class="content-title">Memcached</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['memcached_enabled'] }}</h4>
					<p>{{ lang['memcached_enabled#desc'] }}</p>
				</div>
				<div class="config-var">{{ mkSelectNY({'name' : 'save_con[use_memcached]', 'value' : config['use_memcached'] }) }}</div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['memcached_ip'] }}</h4>
					<p>{{ lang['example'] }} localhost</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[memcached_ip]" value="{{ config['memcached_ip'] }}" id="memcached_ip" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['memcached_port'] }}</h4>
					<p>{{ lang['example'] }} 11211</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[memcached_port]" value="{{ config['memcached_port'] }}" id="memcached_port" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['memcached_prefix'] }}</h4>
					<p>{{ lang['example'] }} ng</p>
				</div>
				<div class="config-var"><input class="important" type="text" name="save_con[memcached_prefix]" value="{{ config['memcached_prefix'] }}" id="memcached_prefix" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title"></h4>
					<p></p>
				</div>
				<div class="config-var"><input class="fr" type="button" value="{{ lang['btn_checkMemcached'] }}" onclick="ngCheckMemcached(); return false;"/></div>
			</li>
		</ul>

	</div>
		
	<!-- ########################## MULTI TAB ########################## -->
	<div class="tabs-content" id="userTabs-multi">
		<h3 class="content-title">{{ lang['multi_info'] }}</h3>
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['mydomains'] }}</h4>
					<p>{{ lang['mydomains_desc'] }}</p>
				</div>
				<div class="config-var"><textarea name="save_con[mydomains]">{{ config['mydomains'] }}</textarea></div>
			</li>
		</ul>
		
		<h3 class="content-title">{{ lang['multisite'] }}</h3>
		<table class="hover odd">
			<thead>
				<tr>
					<th>{{ lang['status'] }}</th>
					<th>{{ lang['title'] }}</th>
					<th>{{ lang['domains'] }}</th>
					<th>{{ lang['flags'] }}</th>
				</tr>
			</thead>
			{% for MR in multiConfig %}
			<tbody>
				<tr class="contentEntry1">
					<td>{% if (MR['active']) %}On{% else %}Off{% endif %}</td>
					<td>{{ MR['key'] }}</td>
					<td>
						{% for domain in MR['domains'] %}
							{{ domain }}<br/>
						{% else %}- не указано -{% endfor %}</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
			{% else %}
			<tfoot>
				<tr class="contentEntry1"><td colspan="4">- не используетс€ -</td></tr>
			</tfoot>
			{% endfor %}
			
		</table>
	</div>
	
	<div class="content-footer clear">
		<input type="hidden" name="subaction" value="save" />
		<input type="hidden" name="save" value="" />
		<input class="button-success fr" type="submit" value="{{ lang['save'] }}" />
	</div>
	
</form>
</div>




<script type="text/javascript" language="javascript">
// Check DB connection
function ngCheckDB() {
	ngShowLoading();
	$.post('/engine/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.dbCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'dbhost' : $("#db_dbhost").val(),
					'dbname' : $("#db_dbname").val(),
					'dbuser' : $("#db_dbuser").val(),
					'dbpasswd' : $("#db_dbpasswd").val(),
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { ngNotifyWindow('{{ lang['rpc_jsonError'] }} '+data, '{{ lang['notifyWindowError'] }}'); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		} else {
			ngNotifyWindow(resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('{{ lang['rpc_httpError'] }}', '{{ lang['notifyWindowError'] }}'); });
}

// Check MEMCached connection
function ngCheckMemcached() {
	ngShowLoading();
	$.post('/engine/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.memcachedCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'ip' : $("#memcached_ip").val(),
					'port' : $("#memcached_port").val(),
					'prefix' : $("#memcached_prefix").val(),
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { ngNotifyWindow('{{ lang['rpc_jsonError'] }} '+data, '{{ lang['notifyWindowError'] }}'); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		} else {
			ngNotifyWindow(resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('{{ lang['rpc_httpError'] }}', '{{ lang['notifyWindowError'] }}'); });
}

// Send test e-mail message
function ngCheckEmail() {
	ngShowLoading();
	$.post('/engine/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.emailCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'mode'  : $("#mail_mode").val(),
					'from'  : {
						'name'	: $("#mail_fromname").val(),
						'email' : $("#mail_frommail").val(),
					},
					'to'	: {
						'email' : $("#mail_tomail").val(),
					},
					'smtp'	: {
						'host': $("#mail_smtp_host").val(),
						'port' : $("#mail_smtp_port").val(),
						'auth' : $("#mail_smtp_auth").val(),
						'login': $("#mail_smtp_login").val(),
						'pass': $("#mail_smtp_pass").val(),
						'secure': $("#mail_smtp_secure").val(),
					},
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { ngNotifyWindow('{{ lang['rpc_jsonError'] }} '+data, '{{ lang['notifyWindowError'] }}'); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		} else {
			ngNotifyWindow(resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('{{ lang['rpc_httpError'] }}', '{{ lang['notifyWindowError'] }}'); });
}

// If use SMTP
if ($("#mail_mode option:selected").val() != "smtp") {
	$(".useSMTP").hide();
}

$("#mail_mode").on('change', function() {
	if ($("#mail_mode option:selected").val() == "smtp") {
		$(".useSMTP").show();
	}
	else {
		$(".useSMTP").hide();
	}
});
</script>
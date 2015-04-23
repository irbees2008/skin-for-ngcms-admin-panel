<h2 class="content-head">{{ lang.ipban['hdr.list'] }}</h2>

<div class="tabs clear">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>Список заблокированных</li>
		{% if flags.permModify %}<li>{{ lang.ipban['hdr.block'] }}</li>{% endif %}
	</ul>
	<!-- /Navigation bar -->
	
	<!-- MAIN CONTENT -->
	<div class="tabs-content">
		<table class="table-resp table-ipban">
		<thead>
		<tr>
			<th>{{ lang.ipban['hdr.ip'] }}</th>
			<th>{{ lang.ipban['hdr.counter'] }}</th>
			<th>{{ lang.ipban['hdr.type'] }}</th>
			<th>{{ lang.ipban['hdr.reason'] }}</th>
			<th>Разблокировать</th>
		</tr>
		</thead>
		<tbody>
		{% for entry in entries %}
		<tr>
			<td nowrap><a href="http://www.nic.ru/whois/?ip={{ entry.whoisip }}" target="_blank">?</a> {{ entry.ip }}</td>
			<td>{{ entry.hitcount }}</td>
			<td>{{ entry.type }}</td>
			<td>{{ entry.descr }}</td>
			<td>{% if flags.permModify %}<a href="{{ php_self }}?mod=ipban&amp;action=del&amp;id={{ entry.id }}&amp;token={{ token }}"><i class="fa fa-unlock" title="{{ lang.ipban['act.unblock'] }}"></i></a>{% endif %}</td>
		</tr>
		{% else %}
			<tr><td colspan="5">Нет заблокированных</td></tr>
		{% endfor %}
		</tbody>
		</table>
	</div>
	
	{% if flags.permModify %}
	<!-- IPBAN -->
	<div class="tabs-content" id="maincontent">
		<form name="form" method="post" action="{{php_self}}?mod=ipban">
			<input type="hidden" name="token" value="{{token}}"/>
			<input type="hidden" name="action" value="add" />
			
			<ul class="config-list">
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.ip'] }}:</h4>
						<p></p>
					</div>
					<div class="config-var"><input type="text" name="ip" value="{{ iplock }}" /></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.open'] }}:</h4>
						<p></p>
					</div>
					<div class="config-var"><select disabled="disabled" name="lock:open"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.reg'] }}:</h4>
						<p></p>
					</div>
					<div class="config-var"><select name="lock:reg"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.login'] }}:</h4>
						<p></p>
					</div>
					<div class="config-var"><select name="lock:login"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.comm'] }}:</h4>
						<p></p>
					</div>
					<div class="config-var"><select name="lock:comm"><option value="0">--</option><option value="1" style="color: blue;">{{ lang.ipban['lock.block'] }}</option><option value="2" style="color: red;">{{ lang.ipban['lock.silent'] }}</option></select></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.rsn'] }}</h4>
						<p></p>
					</div>
					<div class="config-var"><input type="text" name="lock:rsn" /></div>
				</li>
				<li class="config-box clear">
					<div class="config-descr">
						<h4 class="config-title">{{ lang.ipban['add.block.rsn'] }}</h4>
						<p></p>
					</div>
					<div class="config-var"><input type="submit" value="{{ lang.ipban['add.submit'] }}" class="button-danger" /></div>
				</li>
			</ul>
		</form>
		<div class="sysinfo_common">Описание:<div class="info">IP адрес/сеть необходимо указывать в виде xxx.xxx.xxx.xxx (адрес) либо xxx.xxx.xxx.xxx/xxx.xxx.xxx.xxx (сеть)</div></div>
	</div>
	{% endif %}
</div>

<h2 class="content-head">{{ lang['users_title'] }}</h2>

<!-- Main content form -->
<div class="content tabs clear">
	
		<!-- Navigation bar -->
		<ul class="tabs-title clear">
			<li>{{ lang['users'] }}</li>
			{% if flags.canModify %}<li>{{ lang['adduser'] }}</li>{% endif %}
		</ul>
		<!-- /Navigation bar -->

	<div class="tabs-content" id="list">
		<!-- Filter form: BEGIN -->
		<div class="clear">
		<form method="GET" action="{{ php_self }}">
			<input type="hidden" name="mod" value="users" />
			<input type="hidden" name="action" value="list" />
			
			<dl class="fl">
			<dt>
				<label for="name" class="fl">Имя</label>
				<label for="group" class="fr">Группа</label>
			</dt>
			<dd>
				<input class="fl" type="text" name="name" id="name" value="{{ name }}"/>
				<select class="fr" name="group" id="group"><option value="0">-- Любая --</option>{% for g in ugroup %}<option value="{{ g.id }}" {% if (group == g.id) %}selected="selected"{% endif %}>{{ g.name }}</option>{% endfor %}</select>
			</dd>
			</dl>
			<dl class="fl">
			<dt>
				<label for="rpp" class="fl">На странице</label>
			</dt>
			<dd>
				<input class="fl" type="text" name="rpp" id="rpp" value="{{ rpp }}"/>
				<input class="fr" type="submit" value="{{ lang['sortit'] }}" />
			</dd>
			</dl>
		</form>
		</div>
		<!-- Filter form: END -->
		
		<!-- Mass actions form: BEGIN -->
		<form method="GET" name="form_users" id="form_users" action="{{ php_self }}">
			<input type="hidden" name="mod" value="users" />
			<input type="hidden" name="token" value="{{ token }}"/>
			<input type="hidden" name="name" value="{{ name }}" />
			<input type="hidden" name="how" value="{how_value}" />
			<input type="hidden" name="sort" value="{sort_value}" />
			<input type="hidden" name="page" value="{page_value}" />
			<input type="hidden" name="per_page" value="{{ rpp }}" />
			
			<table class="hover odd">
			<thead>
				<tr>
					<th>{% if flags.canModify %}<input type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(form_users)" />{% endif %}</th>
					<th><a href="{{ sortLink['i']['link'] }}">ID</a> {{ sortLink['i']['sign'] }}</th>
					<th> </th>
					<th>{% if flags.haveComments %}<i class="fa fa-comment-o" title="{l_listhead.comments}"></i>{% endif %}</th>
					<th><a href="{{ sortLink['p']['link'] }}" title="{{ lang['all_news2'] }}"><i class="fa fa-file-text-o"></i></a> {{ sortLink['p']['sign'] }}</th>
					<th><a href="{{ sortLink['n']['link'] }}">{{ lang['name'] }}</a> {{ sortLink['n']['sign'] }}</th>
					<th><a href="{{ sortLink['g']['link'] }}">{{ lang['groupName'] }}</a> {{ sortLink['g']['sign'] }}</th>
					<th><a href="{{ sortLink['r']['link'] }}">{{ lang['regdate'] }}</a> {{ sortLink['r']['sign'] }}</th>
					<th><a href="{{ sortLink['l']['link'] }}">{{ lang['last_login'] }}</a> {{ sortLink['l']['sign'] }}</th>
				</tr>
			</thead>
				{% for entry in entries %}
				<tr>
					<td>{% if flags.canModify %}{% if flags.canMassAction %}<input name="selected_users[]" value="{{ entry.id }}" class="check" type="checkbox" />{% endif %}{% endif %}</td>
					<td>{{ entry.id }}</td>
					<td>{% if entry.flags.isActive %}<i class="fa fa-check" title="{{ lang['active'] }}"></i>{% else %}<i class="fa fa-minus-circle" title="{{ lang['unactive'] }}"></i>{%endif %}</td>
					<td>{% if flags.haveComments %}{% if entry.cntComments > 0 %}{{ entry.cntComments }}{% else %}-{% endif %}{% endif %}</td>
					<td>{% if entry.cntNews > 0 %}<a href="{{ php_self }}?mod=news&amp;aid={{ id }}">{{ entry.cntNews }}</a>{% else %}-{% endif %}</td>
					<td>{% if flags.canView %}<a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ entry.id }}">{{ entry.name }}</a>{% else %}{{ entry.name }}{% endif %}</td>
					<td>{{ entry.groupName }}</td>
					<td>{{ entry.regdate }}</td>
					<td>{{ entry.lastdate }}</td>
				</tr>
				{% endfor %}
			</table>

			<div class="clear content-footer">
				{% if flags.canModify %}
				<div class="div-resp clear">
					<div class="input-group">
						<select name="action" onchange="updateAction();" onclick="updateAction();">
							<option value="">-- {{ lang['action'] }} --</option>
							<option value="massActivate">{{ lang['activate'] }}</option>
							<option value="massLock">{{ lang['lock'] }}</option>
							<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
							<option value="massDel">{{ lang['delete'] }}</option>
							<option value="massDelInactive">{{ lang['delete_unact'] }}</option>
							<option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
							<option value="massSetStatus">{{ lang['setstatus'] }} &raquo;</option>
						</select>
						<select name="newstatus" disabled="disabled" style="display: none;">
							<option value="0"></option>
							{% for grp in ugroup %}
								<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
							{% endfor %}
						</select>
						<span>
							<button type="button" onclick="validateAction();">{{ lang['ok'] }}</button>
						</span>
					</div>
				</div>
				{% endif %}
			</div>
			{{ pagination }}
		</form>
		<!-- Mass actions form: END -->
	</div>
	
	<!-- ADDUSER -->
	{% if flags.canModify %}
	<div class="tabs-content div-resp clear" id="adduser">
		<form method="post" action="{{ php_self }}?mod=users">
			<input type="hidden" name="action" value="add" />
			<input type="hidden" name="token" value="{{ token }}"/>
			
			<div class="input-group">
				<span class="input-group-check">
					<i class="fa fa-user-plus"></i>
				</span>
				<input type="text" name="regusername" placeholder="Имя пользователя" required />
			</div>
			<div class="input-group">
				<span class="input-group-check">
					<i class="fa fa-key"></i>
				</span>
				<input type="password" name="regpassword" placeholder="Пароль пользователя" required />
			</div>
			<div class="input-group">
				<span class="input-group-check">
					<i class="fa fa-at"></i>
				</span>
				<input type="email" name="regemail" placeholder="eMail пользователя" required />
			</div>
			<div class="input-group">
				<span class="input-group-check">
					<i class="fa fa-users"></i>
				</span>
				<select name="reglevel">
					{% for grp in ugroup %}
					<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
					{% endfor %}
				</select>
			</div>
			<div class="input-group" id="addbutton">
				<input type="submit" value="{l_adduser}" />
			</div>
		</form>
	</div>
	{% endif %}
</div>

<script type="text/javascript">
<!--
var fInitStatus = false;

function updateAction() {
	mode = document.forms['form_users'].action.value;
	if (mode == 'massSetStatus') {
		if (!fInitStatus) {
			document.forms['form_users'].newstatus.value = '4';
			fInitStatus = true;
		}
		document.forms['form_users'].newstatus.disabled = false;
		document.forms['form_users'].newstatus.style.display = "";
	} else {
		document.forms['form_users'].newstatus.disabled = true;
		document.forms['form_users'].newstatus.style.display = "none";
		
	}
}

function validateAction() {
	mode = document.forms['form_users'].action.value;
	if (mode == '') {
		alert('Необходимо выбрать действие!');
		return;
	}
	if ((mode == 'massSetStatus')&&(document.forms['form_users'].newstatus.value < 1)) {
		alert('{l_msge_setstatus}');
		return;
	}
	document.forms['form_users'].submit();
}
-->
</script>
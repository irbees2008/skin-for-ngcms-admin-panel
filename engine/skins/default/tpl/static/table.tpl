<h2 class="content-head">{{ lang['static_title'] }}</h2>

<!-- Navigation bar -->
<div class="clear">
	<form action="{{ php_self }}" method="get" name="options_bar">
		<input type="hidden" name="mod" value="static" />
		<dl class="fl">
			<dt>
				<label class="fl" for="">{{ lang['per_page'] }}</label>
			</dt>
			<dd>
				<input class="fl" type="text" id="per_page" name="per_page" value="{{ per_page }}" />
				<input class="fr" type="submit" value="{{ lang['do_show'] }}" />
			</dd>
		</dl>
	</form>
</div>

<!-- Info content -->
<form action="{{ php_self }}?mod=static" method="post" name="static">
	<input type="hidden" name="token" value="{{ token }}"/>
	<table class="hover odd">
		<thead>
		<tr>
			<th>{% if (perm.modify) %}<input class="check" type="checkbox" name="master_box" title="{{ lang['select_all'] }}" onclick="javascript:check_uncheck_all(static)" />{% endif %}</th>
			<th><!--{{ lang['status'] }}--></th>
			<th></th>
			<th>{{ lang['title'] }}</th>
			<th class="mobile-hide-480">{{ lang['alt_name'] }}</th>
			<th class="mobile-hide-480">{{ lang['list.template'] }}</th>
			<th>{{ lang['list.date'] }}</th>
		</tr>
		</thead>
		{% for entry in entries %}
		<tr>
			<td>{% if (perm.modify) %}<input name="selected[]" value="{{ entry.id }}" class="check" type="checkbox" />{% endif %}</td>
			<td>
				{% if entry.url is empty %}
					<i class="fa fa-times" title="{{ lang['unapproved'] }}"></i>
					</td>
					<td>
				{% else %}
					<i class="fa fa-check" title="{{ lang['approved'] }}"></i>
					</td>
					<td>
					<a href="{{ entry.url|striptags }}" target="_blank" title="Просмотр страницы"><i class="fa fa-external-link"></i></a>
				{% endif %}
			</td>
			<td>
			
				{% if (perm.details) %}<a title="ID: {{ entry.id }}" href="{{ php_self }}?mod=static&amp;action=editForm&amp;id={{ entry.id }}">{% endif %}{{ entry.title }}{% if (perm.details) %}</a>{% endif %}
			
</td>
			<td class="mobile-hide-480">{{ entry.alt_name }}</td>
			<td class="mobile-hide-480">{{ entry.template }}</td>
			<td>{{ entry.date|date("d.m.") }}<wbr>{{ entry.date|date("Y") }}</td>
		</tr>
		{% else %}
		<tr><td colspan="6"><p>- {{ lang['not_found'] }} -</p></td></tr>
		{% endfor %}
	</table>
	
	{% if (perm.modify) %}
		<div id="submit" class="content-footer clear">
			<dl class="fl">
				<dt>
					<label class="fl">{{ lang['action'] }}</label>
				</dt>
				<dd>
					<select class="fl" name="action">
						<option value="">-- {{ lang['action'] }} --</option>
						<option value="do_mass_delete">{{ lang['delete'] }}</option>
						<option value="do_mass_approve">{{ lang['approve'] }}</option>
						<option value="do_mass_forbidden">{{ lang['forbidden'] }}</option>
					</select>
					<input class="fr" type="submit" value="{{ lang['ok'] }}" />
			</dd>
			</dl>
			<dl class="fr">
				<dt>
					<label>&nbsp;</label>
				</dt>
				<dd>
					<input class="fr" type="button" value="{{ lang['addstatic'] }}" onclick="document.location='?mod=static&action=addForm'; return false;" />
			</dd>
			</dl>
			
		</div>

	{% endif %}

		
		{{ pagesss }}
</form>
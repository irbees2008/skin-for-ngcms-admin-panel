{% for entry in entries %}
<tr>
	<td>{{ entry.id }}</td>
	<td>
		<div class="fl">{{ entry.level }}</div>
		<div class="fl">
			{% if (flags.canView) %}<a href="admin.php?mod=categories&amp;action=edit&amp;catid={{ entry.id }}" title="ID: {{ entry.id }}">{{ entry.name }}</a>{% else %}{{ entry.name }}{% endif %}
			<br/><small><a href="{{ entry.linkView }}" title="{{ lang['site.view'] }}" target="_blank">{{ entry.linkView }}</a></small>
			{% if (entry.info|length>0) %}<i class="fa fa-info" title="Категория содержит описание"></i>{% endif %}
		</div>
	</td>
	<td>{{ entry.alt }}</td>
	<td>
		{% if (entry.flags.showMain) %}<i class="fa fa-check" title="{{ lang['yesa'] }}"></i>{% else %}<i class="fa fa-times" title="{{ lang['noa'] }}"></i>{% endif %}
	</td>
	<td>
		{% if (entry.template == '') %}--{% else %}{{ entry.template }}{% endif %}
	</td>
	<td>
		<a href="admin.php?mod=news&amp;category={{ entry.id }}">{% if (entry.news == 0) %}--{% else %}{{ entry.news }}{% endif %}</a>
	</td>
	<td nowrap>
		{% if (flags.canModify) %}
			<a href="#" onclick="categoryModifyRequest('up', {{ entry.id }});"><i class="fa fa-arrow-up"></i></a>
			<a href="#" onclick="categoryModifyRequest('down', {{ entry.id }});"><i class="fa fa-arrow-down"></i></a>
			<a href="#" onclick="categoryModifyRequest('del', {{ entry.id }});"><i class="fa fa-times" title="{{ lang['delete'] }}"></i></a>
		{% endif %}

</tr>
{% endfor %}
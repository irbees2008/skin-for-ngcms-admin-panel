<h2 class="content-head">Управление группами пользователей</h2>

<!-- Main content form -->
<div class="clear">
	<table class="table-resp table-ugroup">
	<thead>
	<tr>
		<th>#</th>
		<th>Идентификатор</th>
		<th>Название</th>
		<th>Пользователей в группе</th>
		<th>Действие</th>
	</tr>
	</thead>
	<tbody id="admCatList">
		{% for entry in entries %}
		<tr>
			<td>{{ entry.id }}</td>
			<td>{{ entry.identity }}</td>
			<td>{{ entry.name }}</td>
			<td>{{ entry.count }}</td>
			<td>{% if (entry.flags.canEdit) %}<a href="?mod=ugroup&action=editForm&id={{entry.id}}"><i class="fa fa-1_4x fa-pencil-square-o"></i></a> {% endif %}{% if (entry.flags.canDelete) %}<a href="?mod=ugroup&action=delete&id={{entry.id}}&token={{ token }}"><i class="fa fa-1_4x fa-trash-o"></i></a>{% endif %}</td>
		</tr>
		{% endfor %}
	</tbody>
	</table>
	
	{% if (flags.canAdd) %}
	<div class="content-footer clear">
		<form method="get" action="">
			<input type="hidden" name="mod" value="ugroup"/>
			<input type="hidden" name="action" value="addForm"/>
			
			<input class="fr" type="submit" value="Добавить группу" />
		</form>
	</div>
	{% endif %}
</div>
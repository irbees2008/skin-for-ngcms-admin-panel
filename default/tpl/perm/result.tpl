	{% if (execResult) %}
		<div class="sysmsg_common">Результат выполнения:<div class="info">УСПЕШНО</div></div>
	{% else %}
		<div class="syserror_common">Результат выполнения:<div class="info"> ОШИБКА</div></div>
	{% endif %}

<h2 class="content-head"><a href="?mod=perm">Управление правами доступа</a></h2>
<h3 class="content-title">Список выполняемых изменений:</h3>

<div class="pconf">
	<table class="content">
		<thead>
		<tr>
			<th>Группа</th><th>ID</th><th>Наинование</th><th>Старое значение</th><th>Новое значение</th>
		</tr>
		</thead>
		<tbody>
		{% for entry in updateList %}
		<tr>
			<td>{{ GRP[entry.group]['title'] }}</td>
			<td>{{ entry.id }}</td>
			<td>{{ entry.title }}</td>
			<td>{{ entry.displayOld }}</td>
			<td>{{ entry.displayNew }}</td>
		</tr>
		{% endfor %}
		</tbody>
	</table>
</div>

	{% if (execResult) %}
		<div class="sysmsg_common">��������� ����������:<div class="info">�������</div></div>
	{% else %}
		<div class="syserror_common">��������� ����������:<div class="info"> ������</div></div>
	{% endif %}

<h2 class="content-head"><a href="?mod=perm">���������� ������� �������</a></h2>
<h3 class="content-title">������ ����������� ���������:</h3>

<div class="pconf">
	<table class="content">
		<thead>
		<tr>
			<th>������</th><th>ID</th><th>����������</th><th>������ ��������</th><th>����� ��������</th>
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

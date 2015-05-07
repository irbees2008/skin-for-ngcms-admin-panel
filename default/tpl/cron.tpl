<h2 class="content-head">{{ lang.cron['title'] }}</h2>

<div class="clear">
	<form action="?mod=cron" method="post" name="commitForm" id="commitForm">
		<style>table{table-layout:fixed}</style>
		<input type="hidden" name="mod" value="cron" />
		<input type="hidden" name="action" value="commit" />
		<input type="hidden" name="token" value="{{ token }}" />

		<table class="table-resp table-cron">
			<thead>
				<tr>
					<th>Plugin</th>
					<th>Handler</th>
					<th>Min</th>
					<th>Hour</th>
					<th>Day</th>
					<th>Month</th>
					<th>D.O.W.</th>
				</tr>
			</thead>
			<tbody>
				{% for entry in entries %}
				<tr>
					<td><input type="text" name="data[{{ entry.id }}][plugin]" value="{{ entry.plugin }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][handler]" value="{{ entry.handler }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][min]" value="{{ entry.min }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][hour]" value="{{ entry.hour }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][day]" value="{{ entry.day }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][month]" value="{{ entry.month }}"/></td>
					<td><input type="text" name="data[{{ entry.id }}][dow]" value="{{ entry.dow }}"/></td>
				</tr>
				{% endfor %}
			</tbody>
		</table>
		
		<div class="clear content-footer">
			<input class="fr button-success" type="submit" onclick="document.location='?mod=extra-config&plugin=xfields&action=add&section={{ sectionID }}';" value="{{ lang.cron['commit_change'] }}" />
		</div>
	</form>
</div>
<div class="sysinfo_common">Информация<div class="info" id="mfs">{{ lang.cron['title#desc'] }}<br /><br />{{ lang.cron['legend'] }}</div></div>
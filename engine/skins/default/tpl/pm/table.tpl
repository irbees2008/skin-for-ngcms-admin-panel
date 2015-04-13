<h2>{l_pm}</h2>

<form name="form" method="POST" action="{php_self}?mod=pm&action=delete">
	<table>
		<thead>
			<tr>
				<th lass="contentHead"><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(form)"></th>
				<th>{l_status}</th>
				<th>{l_from}</th>
				<th>{l_title}</th>
				<th>{l_pmdate}</th>
			</tr>
		</thead>
			{entries}
	</table>
	<input class="button" type="submit" value="{l_delete}">
</form>

<div>
	<form name="pm" method="POST" action="{php_self}?mod=pm&action=write">
		<input class="button" type="submit" value="{l_write}">
	</form>
</div>
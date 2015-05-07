<h2 class="content-head">{l_pm}</h2>

<div class="content clear">
	<form name="form" method="POST" action="{php_self}?mod=pm&action=delete">
		<table>
			<thead>
				<tr>
					<th><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(form)"></th>
					<th>{l_status}</th>
					<th>{l_from}</th>
					<th>{l_title}</th>
					<th>{l_pmdate}</th>
				</tr>
			</thead>
			<tbody>
				{entries}
			</tbody>
		</table>
		
		<div class="content-footer">
			<input class="button-danger fl" type="submit" value="{l_delete}">
			<input class="fr" onclick="document.location='{php_self}?mod=pm&action=write'; return false;" type="submit" value="{l_write}">
		</div>
	</form>
</div>
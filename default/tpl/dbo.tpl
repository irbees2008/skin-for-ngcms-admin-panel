<h2 class="content-head">{{ lang.dbo.title }}</h2>

<!-- FORM: Perform actions with tables -->
<form name="form" method="post" action="{{php_self}}?mod=dbo">
	<input type="hidden" name="subaction" value="modify" />
	<input type="hidden" name="token" value="{{ token }}" />
	<input type="hidden" name="massbackup" value="" />
	<input type="hidden" name="cat_recount" value="" />
	<input type="hidden" name="masscheck" value="" />
	<input type="hidden" name="massrepair" value="" />
	<input type="hidden" name="massoptimize" value="" />
	<input type="hidden" name="massdelete" value="" />

	<table class="hover odd">
		<thead>
		<tr>
			<th width="5%"><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(form, 'tables')" /></th>
			<th width="15%">{{ lang.dbo.table }}</th>
			<th width="15%">{{ lang.dbo.rows }}</th>
			<th width="15%">{{ lang.dbo.data }}</th>
			<th width="15%">{{ lang.dbo.overhead }}</th>
		</tr>
		</thead>
		{% for tbl in tables %}
		<tr>
			<td class="contentEntry1"><input name="tables[]" value="{{ tbl.table }}" class="check" type="checkbox"/></td>
			<td class="contentEntry1">{{ tbl.table }}</td>
			<td class="contentEntry1">{{ tbl.rows }}</td>
			<td class="contentEntry1">{{ tbl.data }}</td>
			<td class="contentEntry1">{{ tbl.overhead }}</td>
		</tr>
		{% endfor %}
		<tr>
		<td colspan="8">&nbsp;</td>
		</tr>
		<tr>
		<td width="100%" colspan="8" class="contentEdit">
		<input class="button" type="submit" value="{{ lang.dbo.cat_recount }}" onclick="document.forms['form'].cat_recount.value = 'true';" />&nbsp;
		<input class="button" type="submit" value="{{ lang.dbo.check }}" onclick="document.forms['form'].masscheck.value = 'true';" />&nbsp;
		<input class="button" type="submit" value="{{ lang.dbo.repair }}" onclick="document.forms['form'].massrepair.value = 'true';" />&nbsp;
		<input class="button" type="submit" value="{{ lang.dbo.optimize }}" onclick="document.forms['form'].massoptimize.value = 'true';" />&nbsp;
		<input class="button-danger fr" type="submit" value="{{ lang.dbo.delete }}" onclick="document.forms['form'].massdelete.value = 'true';" />
		</td>
		</tr>
	</table>
	
	<div class="div-resp fl">
	<h3 class="content-title">Создание резервной копии</h3>
	<div class="input-group fl w_50">
		<span class="input-group-check">
			<input type="checkbox" id="gz" name="gzencode" value="1" />
		</span>
		<input type="text" value="{{ lang.dbo.gzencode }}" disabled />
	</div>
	<div class="input-group fl w_50">
		<span class="input-group-check">
			<input type="checkbox" id="email" name="email_send" value="1"/>
		</span>
		<input type="text" value="{{ lang.dbo.email_send }}" disabled />
	</div>
	
		<input type="submit" value="{{ lang.dbo.backup }}" onclick="document.forms['form'].massbackup.value = 'true';" />
	</div>
	
	
	
	
	
</form>

<!-- FORM: Perform actions with backups -->
<form name="backups" method="post" action="{{php_self}}?mod=dbo">
	<input type="hidden" name="subaction" value="modify" />
	<input type="hidden" name="token" value="{{ token }}" />
	<input type="hidden" name="delbackup" value="" />
	<input type="hidden" name="massdelbackup" value="" />
	<input type="hidden" name="restore" value="" />
	
	<div class="div-resp fl">
		<h3 class="content-title">Восстановление резервной копии</h3>
		{{restore}}
		<input type="submit" value="{{ lang.dbo.restore }}" onclick="document.forms['backups'].restore.value = 'true';" />
	</div>
	<div class="div-resp fl">
		<h3 class="content-title">Удаление резервной копии</h3>
		<input class="button-danger" type="submit" value="{{ lang.dbo.delete }}" onclick="document.forms['backups'].delbackup.value = 'true';" />
		<input class="button-danger" type="submit" value="{{ lang.dbo.deleteall }}" onclick="document.forms['backups'].massdelbackup.value = 'true';" />
	</div>
</form>

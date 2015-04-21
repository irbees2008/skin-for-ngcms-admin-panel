<h2 class="content-head"><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a></h2>
<h3 class="content-title">Настройка плагина: <a href="?mod=extra-config&plugin={plugin}">{plugin}</a></h3>

<div class="content clear">
<form method="post" action="{php_self}?mod=extra-config" name="form">
	<input type="hidden" name="token" value="{token}"/>
	<div class="content-main clear">
		<ul class="config-list">
			{entries}
		</ul>
	</div>
	<div class="content-footer clear">
		<input type="hidden" name="plugin" value="{plugin}" />
		<input type="hidden" name="action" value="commit" />
		<input class="button-success fr" type="submit" value="{l_commit_change}" />
	</div>
</form>
</div>
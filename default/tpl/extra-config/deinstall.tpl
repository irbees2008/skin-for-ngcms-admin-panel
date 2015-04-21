<h2 class="content-head"><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a></h2>
<h3 class="content-title">{l_deinstall_text}: <a href="?mod=extra-config&plugin={plugin}">{plugin}</a></h3>

<div class="content clear">
<form method="post" action="{php_self}?mod=extra-config">
	<div class="content-main clear">
		{install_text}
	</div>
	<div class="content-footer clear">
		<input type="hidden" name="plugin" value="{plugin}" />
		<input type="hidden" name="stype" value="install" />
		<input type="hidden" name="action" value="commit" />
		<input class="fr button-danger" type="submit" value="{l_commit_deinstall}" />
	</div>
</form>
</div>
<h2 class="content-head"><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a></h2>
<h3 class="content-title">{mode_text}: <a href="?mod=extra-config&plugin={plugin}">{plugin}</a></h3>

<div class="content clear">
<form method="post" action="{php_self}?mod=extra-config">
	<div class="content-main clear">
	<ul class="config-list">
		{install_text}
	</ul>
	</div>
	<div class="content-footer clear">
		<input type="hidden" name="plugin" value="{plugin}" />
		<input type="hidden" name="stype" value="{stype}" />
		<input type="hidden" name="action" value="commit" />
		<input class="fr button-danger" type="submit" value="{mode_commit}" />
	</div>
</form>
</div>
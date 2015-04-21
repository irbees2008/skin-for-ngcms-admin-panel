<h2 class="content-head"><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a></h2>
<h3 class="content-title">{mode_text}: <a href="?mod=extra-config&plugin={plugin}">{plugin}</a></h3>


<div class="content clear">
<form method="get" action="{php_self}?mod=extras">
	<div class="content-main clear">
		<ul class="config-list">
			{entries}
		</ul>
	</div>
	<div class="content-footer clear">
		<input type="hidden" name="mod" value="extras">
		<input class="fr button-success" type="submit" value="{msg}" />
	</div>
</form>
</div>
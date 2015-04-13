<form method="post" action="{php_self}?mod=extra-config" name="form">
<input type="hidden" name="token" value="{token}"/>

<h2 class="content-head">{l_extras}: {plugin}</h2>

<table>
{entries}
<tr align="center">
<td width="100%" colspan="2" class="contentEdit" valign="top">
<input type="hidden" name="plugin" value="{plugin}" />
<input type="hidden" name="action" value="commit" />
<input type="submit" value="{l_commit_change}" class="button" />
</td>
</tr>
</table>
</form>
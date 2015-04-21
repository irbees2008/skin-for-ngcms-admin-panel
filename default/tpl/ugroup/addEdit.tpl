<h2 class="content-head">{% if flags.editMode %}Редактирование группы пользователей "{{ entry.identity }}" [ {{ entry.id }} ]{% else %}Добавление группы пользователей{% endif %}</h2>

<form action="{{ php_self }}?mod=ugroup" method="post">
<input type="hidden" name="token" value="{{ token }}"/>
<input type="hidden" name="id" value="{{ entry.id }}"/>
<input type="hidden" name="action" value="{% if (flags.editMode) %}edit{% else %}add{% endif %}" />
<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td width="100%" style="padding-right:10px;" valign="top">
<table>
<tr>
<td width=50% class=contentEntry1>ID:</td>
<td width=50% class=contentEntry2 valign=middle><b>{{ entry.id }}</b></td>
</tr>
<tr>
<td width=50% class=contentEntry1>Идентификатор группы:</td>
<td width=50% class=contentEntry2 valign=middle><input type="text" name="identity" value="{{ entry.identity }}" /></td>
</tr>
<tr>
<td width=50% class=contentEntry1 colspan="2">Название группы:</td><tr/>
{% for eLang,eLValue in entry.langName %}
<tr>
<td width=50% class=contentEntry1>** Название группы на языке [{{ eLang }}]:</td>
<td width=50% class=contentEntry2 valign=middle><input type="text" name="langname[{{ eLang }}]" value="{{ eLValue }}"/></td>
</tr>
{% endfor %}
</table>
</td>
</tr>
<tr align="center">
<td width=100% class="contentEdit" colspan="2">
{% if (flags.canModify) %}<input type="submit" value="{{ lang['save'] }}" class="button" />
<input type="button" value="{{ lang['cancel'] }}" onClick="history.back();" class="button" />{% endif %}&nbsp;
</td>
</tr>
</table>
</form>

<h2 class="content-head">{% if (flags.editMode) %}{{ lang['static_title_edit'] }} "{{ data.title }}"{% else %}{{ lang['static_title_add'] }}{% endif %}</h2>

<script language="javascript" type="text/javascript">
var currentInputAreaID = 'content';
</script>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage"><input type="hidden" name="area" value="content" /></form>

<div class="content clear">
	<form name="form" id="postForm" method="post" action="{{ php_self }}?mod=static" target="_self">
	<input type="hidden" name="token" value="{{ token }}"/>

			<!-- Left edit column -->
			<!-- MAIN CONTENT -->
		<div class="content-main-left" id="maincontent">
			<label class="lable-title" for="newsTitle">{{ lang['title'] }}</label>
			<input class="w_100" class="important" type="text" id="newsTitle" name="title" value="{{ data.title }}" tabindex="1" />
			
			{% if (flags.isPublished) %}
				<label class="lable-title" for="url">URL статьи</label> <a target="_blank" href="{{ data.url }}"><i class="fa fa-external-link"></i></a>
				<input class="w_100" type="text" name="url" id="url" readonly="readonly" value="{{ data.url }}" tabindex="1" />
			{% endif %}

			<label class="lable-title" for="content">Текст статьи</label>
			<div id="fullwidth">
				{{ quicktags }}
				<div id="smilies" class="smile-box clear">{{ smilies }}</div>
				<textarea name="content" id="content" class="static-content" placeholder="Полный текст статьи" tabindex="2">{{ data.content }}</textarea>
			</div>
			<label class="lable-title" for="alt_name">{{ lang['alt_name'] }}</label>
			<input class="w_100" type="text" name="alt_name" id="alt_name" value="{{ data.alt_name }}" tabindex="3" />
			
			{% if (flags.meta) %}
			<label class="lable-title" for="description">{{ lang['description'] }}</label>
			<textarea name="description" id="description" tabindex="4" />{{ data.description }}</textarea>
			
			<label class="lable-title" for="keywords">{{ lang['keywords'] }}</label>
			<input class="w_100" type="text" name="keywords" id="keywords" value="{{ data.keywords }}" tabindex="5" />
			
			<label class="lable-title" for="set_postdate">Дата публикации</label>
			<div class="input-group w_100">
				<span class="input-group-check">
					<input name="set_postdate" id="set_postdate" type="checkbox" value="1" onclick="$('#cdate').focus();" />
				</span>
				<input type="text" id="cdate" name="cdate" value="{{ data.cdate }}" placeholder="DD.MM.YYYY HH:MM" />
			</div>
			<script language="javascript" type="text/javascript">$("#cdate").datetimepicker( {  });</script>
			{% endif %}
		</div>
		
		<!-- Right edit column -->
		<div id="rightBar" class="content-sidebar-right">
			<div class="content-sidebar-box">
				<h3 class="content-sidebar-title">{{ lang['editor.configuration'] }}</h3>
				<ul class="content-sidebar-list">
					<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_published" value="1" {% if (not flags.canPublish) or (not flags.canUnpublish) %}disabled="disabled" {% endif %} {% if (data.flag_published) %}checked="checked" {% endif %}class="check"/> {{ lang['approve'] }}</label></li>
					<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_html" value="1" class="check" {% if (data.flag_html) %}checked="checked" {% endif %}/> {{ lang['flag_html'] }}</label></b></li>
					<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_raw" value="1" class="check" {% if (data.flag_raw) %}checked="checked" {% endif %}/> {{ lang['flag_raw'] }}</label></li>
				</ul>
			</div>

			<div class="content-sidebar-box">
				<h3 class="content-sidebar-title">{{ lang['editor.template'] }}</h3>
				<ul class="content-sidebar-list">
					<li class="content-sidebar-list-item"><select class="w_100" name="template">{% for t in templateList %}<option value="{{ t }}" {% if (data.template == t) %}selected="selected"{% endif %}>{{ t }}{% endfor %}</select></li>
					<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_template_main" value="1" {% if (data.flag_template_main) %}checked="checked" {% endif %} class="check"/> {{ lang['flag_main'] }}</label></li>
				</ul>
			</div>
		</div>
		
		<div id="edit" class="clear content-footer-left">
		{% if (flags.editMode) %}
			<input type="hidden" name="id" value="{{ data.id }}" />
			<input type="hidden" name="action" value="edit" />
			{% if (flags.canModify) %}
				<input class="button fr" type="submit" value="{{ lang['do_editnews'] }}" />
				<input class="button fl" type="button" value="{{ lang['delete'] }}" onClick="confirmit('{{ php_self }}?mod=static&token={{ token }}&action=do_mass_delete&selected[]={{ data.id }}', '{{ lang['sure_del'] }}')" />
			{% endif %}
		{% else %}
			{% if (flags.canAdd) %}
			<input type="hidden" name="action" value="add" />
				<input class="button fr" type="submit" value="{{ lang['addstatic'] }}" />
			{% endif %}
		{% endif %}
		</div>

	</form>
</div>
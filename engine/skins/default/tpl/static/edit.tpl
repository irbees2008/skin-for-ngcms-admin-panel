<h2 class="content-head">{% if (flags.editMode) %}{{ lang['static_title_edit'] }} "{{ data.title }}"{% else %}{{ lang['static_title_add'] }}{% endif %}</h2>

<script language="javascript" type="text/javascript">
var currentInputAreaID = 'content';
</script>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage"><input type="hidden" name="area" value="" /></form>

<div class="content clear">
	<form name="form" id="postForm" method="post" action="{{ php_self }}?mod=static" target="_self">
	<input type="hidden" name="token" value="{{ token }}"/>

			 <!-- Left edit column -->

			<!-- MAIN CONTENT -->
		<div class="content-main-left">
		
			<div id="maincontent" style="display: block;">
				<label class="lable-title" for="newsTitle">{{ lang['title'] }}</label>
				<input style="width:100%;" type="text" id="newsTitle" name="title" value="{{ data.title }}" tabindex="1" />
				
				{% if (flags.isPublished) %}
					URL статьи
					<input style="width:100%;" type="text" name="url" readonly="readonly" value="{{ data.url }}" tabindex="1" /> [ <a target="_blank" href="{{ data.url }}">открыть</a> ]
				{% endif %}

				{{ quicktags }}
				<div id="smilies">{{ smilies }}</div>
				
				<textarea style="  font: normal 16px Georgia,sans-serif; min-height: 168px; margin-top: 0; border-top-left-radius: 0; border-top-right-radius: 0;" placeholder="Полный текст статьи" name="content" id="content" tabindex="2">{{ data.content }}</textarea>
				
				<label class="lable-title" for="alt_name">{{ lang['alt_name'] }}</label>
				<input style="width:100%;" type="text" name="alt_name" id="alt_name" value="{{ data.alt_name }}" tabindex="3" />
				
				{% if (flags.meta) %}
				{{ lang['description'] }}
				<input style="width:100%;" type="text" name="description" value="{{ data.description }}" tabindex="4" />
				
				{{ lang['keywords'] }}
				<input style="width:100%;" type="text" name="keywords" value="{{ data.keywords }}" tabindex="5" />
				{{ lang['postdate'] }}
				<input type="text" id="cdate" name="cdate" value="{{ data.cdate }}"/>
				<input name="set_postdate" type="checkbox" value="1"/> {{ lang['set_postdate'] }}
				<script language="javascript" type="text/javascript">$("#cdate").datetimepicker( { });</script>

				{% endif %}
			</div>
		</div>

		<div id="rightBar" class="content-sidebar-right">
				<!-- Right edit column -->
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
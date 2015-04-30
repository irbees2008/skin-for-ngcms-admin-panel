<h2 class="content-head">{{ lang.editnews['editnews_title'] }} "{{ title }}"</h2>
<style>table input[type="text"], table input:not([type]), table select {width: 100%!important}</style>
<script type="text/javascript" src="{{ home }}/lib/ajax.js"></script>
<script type="text/javascript" src="{{ home }}/lib/libsuggest.js"></script>
<!-- Main content form -->
<div class="content tabs clear">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>{{ lang.editnews['bar.maincontent'] }}</li>
		<li>{{ lang.editnews['bar.additional'] }}</li>
		<li>{{ lang.editnews['bar.attaches'] }} <span class="count-label">{% if (attachCount>0) %}{{ attachCount }}{% else %}{{ lang['noa'] }}{% endif %}</span></li>
		{% if (pluginIsActive('comments')) %}<li>{{ lang.editnews['bar.comments'] }} <span class="count-label">{{ plugin.comments.count }}</span></li>{% endif %}
	</ul>
	<!-- /Navigation bar -->
	
<form id="postForm" name="form" ENCTYPE="multipart/form-data" method="post" action="{{ php_self }}" target="_self">
	<input type="hidden" name="token" value="{{ token }}"/>
	<input type="hidden" name="mod" value="news"/>
	<input type="hidden" name="action" value="edit"/>
	<input type="hidden" name="subaction" value="submit"/>

	<!-- Left edit column -->
	<div class="content-main-left">

		
		<!-- MAIN CONTENT -->
		<div class="tabs-content clear" id="maincontent">
			<label class="lable-title" for="newsTitle">{{ lang.editnews['title'] }}</label>
			<input class="w_100" type="text" id="newsTitle" name="title" value="{{ title }}" tabindex="1" placeholder="Введите заголовок новости. Поле является обязательным" />

			{% if (approve == 1) %}
				<label class="lable-title" for="url">URL новости</label> <a href="{{ link }}" target="_blank"><i class="fa fa-external-link"></i></a>
				<input class="w_100" type="text" name="url" id="url" readonly="readonly" value="{{ link }}" tabindex="1" />
			{% endif %}
			
			
			<label class="lable-title" for="">Текст новости</label>
			<div id="fullwidth">
				{{ quicktags }}
				<div id="smilies" class="smile-box clear">{{ smilies }}</div>

				{% if (flags.edit_split) %}
					<div id="container_content_short" class="contentActive">
						<textarea onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" id="ng_news_content_short" tabindex="2" placeholder="Краткое описание новости">{{ content.short }}</textarea>
					</div>
					{% if (flags.extended_more) %}
						<input class="w_100" type="text" name="content_delimiter" id="content_delimiter" value="{{ content.delimiter }}" tabindex="2"placeholder="{{ lang.editnews['editor.divider'] }}" />
					{% endif %}
					<div id="container_content_full" class="contentInactive">
						<textarea name="ng_news_content_full" id="ng_news_content_full" onclick="changeActive('full');" onfocus="changeActive('full');" tabindex="2" placeholder="Текст полной новости">{{ content.full }}</textarea>
					</div>
				{% else %}
					<div id="container_content" class="contentActive">
						<textarea name="ng_news_content" id="ng_news_content" tabindex="2" placeholder="Текст полной новости" >{{ content.short }}</textarea>
					</div>
				{% endif %}
			</div>
			
			<label class="lable-title" for="alt_name">{{ lang.editnews['alt_name'] }}</label>
			<input class="w_100" type="text" name="alt_name" id="alt_name" value="{{ alt_name }}" {% if flags['altname.disabled'] %}disabled="disabled" {% endif %} tabindex="3" />
			
			{% if (flags.meta) %}
				<label class="lable-title" for="description">{{ lang.editnews['description'] }}</label>
				<textarea name="description" id="description">{{ description }}</textarea>

				<label class="lable-title" for="newsKeywords">{{ lang.editnews['keywords'] }}</label>
				<input class="w_100" type="text" id="newsKeywords" name="keywords" value="{{ keywords }}"/>
			{% endif %}

			<table>
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[1] }}{% endif %}
				{% if (pluginIsActive('autokeys')) %}{{ plugin.autokeys }}{% endif %}
			</table>
		</div>

		<!-- ADDITIONAL -->
		<div class="tabs-content clear" id="additional">
			
				{% if not flags['customdate.disabled'] %}
				<label class="lable-title" for="setdate_custom">Дата публикации</label>
				<div class="input-group w_100">
					<span class="input-group-check">
						<input type="checkbox" name="setdate_custom" id="setdate_custom" value="1" onclick="document.getElementById('setdate_current').checked = false;$('#cdate').focus();">
					</span>
					<input class="w_100" type="text" id="cdate" name="cdate" value="{{ cdate }}"/>
				</div>
				<div class="input-group w_100">
					<span class="input-group-check">
						<input type="checkbox" name="setdate_current" id="setdate_current" value="1" class="check" onclick="document.getElementById('setdate_custom').checked=false;" />
					</span>
					<input type="text" value="{{ lang.editnews['date.setcurrent'] }}" disabled />
				</div>
				{% endif %}
			<table>
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[0] }}{% endif %}
				{% if (pluginIsActive('nsched')) %}{{ plugin.nsched }}{% endif %}
				{% if (pluginIsActive('finance')) %}{{ plugin.finance }}{% endif %}
				{% if (pluginIsActive('tags')) %}{{ plugin.tags }}{% endif %}
				{% if (pluginIsActive('tracker')) %}{{ plugin.tracker }}{% endif %}
			</table>
		</div>
		<script language="javascript" type="text/javascript">
			$("#cdate").datetimepicker( { currentText: "{{ cdate }}" });
		</script>
		
		<!-- ATTACHES -->
		<div class="tabs-content clear" id="attaches">
			<table class="hover odd" id="attachFilelist">
				<thead>
					<tr>
						<th>ID</th><th>{{ lang.editnews['attach.date'] }}</th><th>{{ lang.editnews['attach.filename'] }}</th><th>{{ lang.editnews['attach.size'] }}</th><th>Вставить</th><th>Удалить</th>
					</tr>
				</thead>
				<tbody>
				{% for entry in attachEntries %}
					<tr>
						<td>{{ entry.id }}</td>
						<td>{{ entry.date }}</td>
						<td><a href="{{ entry.url }}">{{ entry.orig_name }}</a></td>
						<td>{{ entry.filesize }}</td>
						<td><a class="link-pseudo" onclick="$('.tabs-title li').removeClass('active');$('.tabs-title li:first').addClass('active');$('.tabs-content').removeClass('active');$('.tabs-content:first').addClass('active'); insertext('[attach#{{ entry.id }}]{{ entry.orig_name }}[/attach]','', currentInputAreaID)" title="{{ lang['tags.file'] }}"><i class="fa fa-paperclip"></i></a></td>
						<td><input class="fr" type="checkbox" name="delfile_{{ entry.id }}" value="1" /></td>
					</tr>
				{% else %}
					<tr><td colspan="6">Нет приложенных файлов</td></tr>
				{% endfor %}
				</tbody>
			</table>
			<input class="button-success fr" type="button" onclick="attachAddRow();" value="+">
		</div>
	</div>
	
	{% if (pluginIsActive('xfields')) %}{{ plugin.xfields.general }}{% endif %}
	
	<div id="rightBar" class="content-sidebar-right">
	<!-- Right edit column -->
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['comminfo'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item">{{ lang['editor.author'] }}: <a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ authorid }}"><b>{{ author }}</b></a> {% if (pluginIsActive('uprofile')) %} <a href="{{ author_page }}" target="_blank" title="{{ lang.editnews['site.viewuser'] }}"><img src="{{ skins_url }}/images/open_new.png" alt="{{ lang.editnews['newpage'] }}"/></a>{% endif %}</li>
				<li class="content-sidebar-list-item">Статус новости: <b>{% if (approve == -1) %}<font color="e74c3c">{{ lang['state.draft'] }}</font>{% elseif (approve == 0) %}<font color="e74c3c">{{ lang['state.unpublished'] }}</font>{% else %}<font color="2ecc71">{{ lang['state.published'] }}{% endif %}</font></b></li>
				<li class="content-sidebar-list-item">{{ lang['editor.dcreate'] }}: <b>{{ createdate }}</b></li>
				<li class="content-sidebar-list-item">{{ lang['editor.dedit'] }}: <b>{{ editdate }}</b></li>
			</ul>
		</div>
		
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang.editnews['category'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item">{{ mastercat }} {% if (flags.mondatory_cat) %}&nbsp; <span style="color: red;"><b>*</b></span>{% endif %}</li>
			</ul>
		</div>
		
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['editor.extcat'] }}</h3>
			<div style="overflow: auto; height: 150px; margin-left: 16px;">{{ extcat }}</div>
		</div>
		
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['editor.configuration'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="mainpage" value="1" {% if (flags.mainpage) %}checked="checked"{% endif %} class="check" id="mainpage" {% if (flags['mainpage.disabled']) %}disabled{% endif %} /> {{ lang.editnews['mainpage'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="pinned" value="1" {% if (flags.pinned) %}checked="checked"{% endif %} class="check" id="pinned" {% if (flags['pinned.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_pinned'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="catpinned" value="1" {% if (flags.catpinned) %}checked="checked"{% endif %} class="check" id="catpinned" {% if (flags['catpinned.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_catpinned'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="favorite" value="1" {% if (flags.favorite) %}checked="checked"{% endif %} class="check" id="favorite"  {% if (flags['favorite.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_favorite'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input name="flag_HTML" type="checkbox" class="check" id="flag_HTML" value="1" {% if (flags.html) %}checked="checked"{% endif %} {% if (flags['html.disabled']) %}disabled{% endif %} /> {{ lang.editnews['flag_html'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_RAW" value="1" {% if (flags.raw) %}checked="checked"{% endif %} class="check" id="flag_RAW" {% if (flags['html.disabled']) %}disabled{% endif %} /> {{ lang.editnews['flag_raw'] }}</label> {% if (flags['raw.disabled']) %}[<font color="red">{{ lang.editnews['flags_lost'] }}</font>]{% endif %}</li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="setViews" value="1" class="check" id="setViews" {% if (flags['setviews.disabled']) %}disabled{% endif %} onclick="$(this).parent().next().toggle();" /> {{ lang.editnews['set_views'] }}:</label> <input type="text" class="d-none w_100" name="views" value="{{ views }}"  {% if (flags['setviews.disabled']) %}disabled{% endif %}/></li>
				
				{% if (pluginIsActive('comments')) %}
					<li class="content-sidebar-list-item clear">
						<hr/>
						{{ lang['comments:mode.header'] }}:
						<select class="w_100" name="allow_com">
							<option value="0"{{ plugin.comments['acom:0'] }}>{{ lang['comments:mode.disallow'] }}
							<option value="1"{{ plugin.comments['acom:1'] }}>{{ lang['comments:mode.allow'] }}
							<option value="2"{{ plugin.comments['acom:2'] }}>{{ lang['comments:mode.default'] }}
						</select>
					</li>
				{% endif %}
				<li class="content-sidebar-list-item clear">
				Статус новости:
				<select class="w_100" name="approve" id="approve">
					{% if flags.can_draft %}<option value="-1" {% if (approve == -1) %}selected="selected"{% endif %}>{{ lang['state.draft'] }}</option>{% endif %}
					{% if flags.can_unpublish %}<option value="0" {% if (approve == 0) %}selected="selected"{% endif %}>{{ lang['state.unpublished'] }}</option>{% endif %}
					{% if flags.can_publish %}<option value="1" {% if (approve == 1) %}selected="selected"{% endif %}>{{ lang['state.published'] }}</option>{% endif %}
				</select>
				</li>
				
			</ul>
		</div>
		
	
	
	</div>
	
	<div id="showEditNews" class="clear content-footer-left">
		<div id="edit">
		{% if flags['params.lost'] %}
			Обратите снимание - у вас недостаточно прав для полноценного редактирования новости.<br/>
			При сохранении будут произведены следующие изменения:<br/><br/>
			{% if flags['publish.lost'] %}<div class="errMessage">&#8594; Новость будет снята с публикации</div>{% endif %}
			{% if flags['html.lost'] %}<div class="errMessage">&#8594; В новости будет запрещено использование HTML тегов и автоформатирование</div>{% endif %}
			{% if flags['mainpage.lost'] %}<div class="errMessage">&#8594; Новость будет убрана с главной страницы</div>{% endif %}
			{% if flags['pinned.lost'] %}<div class="errMessage">&#8594; С новости будет снято прикрепление на главной</div>{% endif %}
			{% if flags['catpinned.lost'] %}<div class="errMessage">&#8594; С новости будет снято прикрепление в категории</div>{% endif %}
			{% if flags['favorite.lost'] %}<div class="errMessage">&#8594; Новость будет удалена из закладок администратора</div>{% endif %}
			{% if flags['multicat.lost'] %}<div class="errMessage">&#8594; Из новости будут удалены все дополнительные категории</div>{% endif %}
		{% endif %}
		
		
			<div class="clear">
			<input class="fl" type="button" value="{{ lang.editnews['preview'] }}" class="button" onClick="preview()" />
			
			{% if flags.deleteable %}
				<input class="button-danger fl" type="button" value="{{ lang.editnews['delete'] }}" onClick="confirmit('{{ php_self }}?mod=news&amp;action=manage&amp;subaction=mass_delete&amp;selected_news[]={{ id }}&amp;token={{ token }}', '{{ lang.editnews['sure_del'] }}')" />
			{% endif %}
			
			{% if flags.editable %}
				<input type="hidden" name="id" value="{{ id }}" />
				<input class="button-success fr" type="submit" value="{{ lang.editnews['do_editnews'] }}" accesskey="s" title="Ctrl+S" />
			{% endif %}
			</div>
		</div>
	</div>
	
</form>
	
	<!-- COMMENTS -->
	<div class="content-main-left tabs-content" id="comments">
		{% if (plugin.comments.count > 0) %}
		<form method="post" name="commentsForm" id="commentsForm" action="{{ php_self }}?mod=news">
			<input type="hidden" name="token" value="{{ token }}" />
			<input type="hidden" name="mod" value="news" />
			<input type="hidden" name="action" value="edit" />
			<input type="hidden" name="subaction" value="mass_com_delete" />
			<input type="hidden" name="id" value="{{ id }}" />
			<ul class="comment-list">
				{{ plugin.comments.list }}
			</ul>
			<label class="fl"><input type="checkbox" name="master_box" value="all" onclick="javascript:check_uncheck_all(commentsForm)" /> Выделить все</label>
			<input class="fr" type="submit" value="{{ lang.editnews['comdelete'] }}" onClick="if (!confirm('{{ lang.editnews['sure_del_com'] }}')) {return false;}" />
		</form>
		{% else %}
		
		{% endif %}
	</div>
	
	<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
		<input type="hidden" name="area" value="" />
	</form>

</div>

<!-- Hidden SUGGEST div -->
<div id="suggestWindow" class="suggestWindow"><table id="suggestBlock"></table><a href="#" align="right" id="suggestClose">close</a></div>

<script language="javascript" type="text/javascript">
<!--
function attachAddRow() {
	var tbl = document.getElementById('attachFilelist');
	var lastRow = tbl.rows.length;
	var row = tbl.insertRow(lastRow - 1);
	var setRow = (++attachAbsoluteRowID);

	// Add cells
	row.insertCell(-1).innerHTML = '*';
	var d = new Date();
	var nowDate = d.getHours().toString().replace( /^([0-9])$/, '0$1' )+':'+d.getMinutes().toString().replace( /^([0-9])$/, '0$1' )+':'+d.getSeconds().toString().replace( /^([0-9])$/, '0$1' );
	row.insertCell(-1).innerHTML = nowDate;

	// Add file input
	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + setRow + ']');
	el.setAttribute('id', 'userfile[' + setRow + ']');
	el.setAttribute('onchange', "validateFile(this, "+setRow+");");

	var el1 = document.createElement('div');
	el1.setAttribute('class','button button-fileinput');
	el1.innerHTML = '<span id="spanfile' + setRow + '"><i class="fa fa-plus"></i> Add files...</span>';
	el1.appendChild(el);
	row.insertCell(-1).appendChild(el1);
	
	el = document.createElement('span');
	el.setAttribute('id','spansize' + setRow);
	row.insertCell(-1).appendChild(el);

	var el = document.createElement('span');
	row.insertCell(-1).appendChild(el);
	
	el = document.createElement('input');
	el.setAttribute('class','button-danger fr');
	el.setAttribute('type', 'button');
	el.setAttribute('onclick', 'document.getElementById(\'attachFilelist\').deleteRow(this.parentNode.parentNode.rowIndex);');
	el.setAttribute('value', '-');
	row.insertCell(-1).appendChild(el);
}
var attachAbsoluteRowID = 0;

// горячие клавиши
document.onkeydown = function(e) {
	e = e || event;

	if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
	var form = document.getElementById("postForm");
		form.submit();
		return false;
	}
	if (e.keyCode == 122) {
		$('#fullwidth').toggleClass('news-content-full');
		return false;
	}
}
-->
</script>

<script type="text/javascript">
// Global variable: ID of current active input area
{% if (flags.edit_split) %}
	var currentInputAreaID = 'ng_news_content_short';
{% else %}
	var currentInputAreaID = 'ng_news_content';
{% endif %}

function preview(){
	var form = document.getElementById("postForm");
	if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
		alert('{{ lang.editnews['msge_preview'] }}');
		return false;
	}
	form['mod'].value = "preview";
	form.target = "_blank";
	form.submit();

	form['mod'].value = "news";
	form.target = "_self";
	return true;
}

function changeActive(name) {
 if (name == 'full') {
	document.getElementById('container_content_full').className  = 'contentActive';
	document.getElementById('container_content_short').className = 'contentInactive';
	currentInputAreaID = 'ng_news_content_full';
 } else {
	document.getElementById('container_content_short').className = 'contentActive';
	document.getElementById('container_content_full').className  = 'contentInactive';
	currentInputAreaID = 'ng_news_content_short';
 }
}
</script>
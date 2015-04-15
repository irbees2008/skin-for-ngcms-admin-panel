<h2 class="content-head">{{ lang.addnews['addnews_title'] }}</h2>

<script type="text/javascript" src="{{ home }}/lib/ajax.js"></script>
<script type="text/javascript" src="{{ home }}/lib/libsuggest.js"></script>
<script type="text/javascript">
// Global variable: ID of current active input area
{% if (flags.edit_split) %}
	var currentInputAreaID = 'ng_news_content_short';
{% else %}
	var currentInputAreaID = 'ng_news_content';
{% endif %}
function ChangeOption(optn) {
	document.getElementById('maincontent').style.display	= (optn == 'maincontent')?"block":"none";
	document.getElementById('additional').style.display	= (optn == 'additional')?"block":"none";
	document.getElementById('attaches').style.display	= (optn == 'attaches')?"block":"none";
}

function approveMode(mode) {
	document.getElementById('approve').value = mode;
	return true;
}

function preview(){
	var form = document.getElementById("postForm");
	if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
		alert('{{ lang.addnews['msge_preview'] }}');
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
	document.getElementById('container.content.full').className  = 'contentActive';
	document.getElementById('container.content.short').className = 'contentInactive';
	currentInputAreaID = 'ng_news_content_full';
 } else {
	document.getElementById('container.content.short').className = 'contentActive';
	document.getElementById('container.content.full').className  = 'contentInactive';
	currentInputAreaID = 'ng_news_content_short';
 }
}
</script>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
	<input type="hidden" name="area" value="" />
</form>

<!-- Main content form -->
<div class="content clear">
<form id="postForm" name="form" ENCTYPE="multipart/form-data" method="post" action="{{ php_self }}" target="_self">
	<input type="hidden" name="token" value="{{ token }}"/>

	<div class="content-nav clear">
		<input class="navbutton active" type="button" onclick="ChangeOption('maincontent');" value="{{ lang.addnews['bar.maincontent'] }}" />
		<input class="navbutton" type="button" onclick="ChangeOption('additional');" value="{{ lang.addnews['bar.additional'] }}" />
		<input class="navbutton" type="button" onclick="ChangeOption('attaches');" value="{{ lang.addnews['bar.attaches'] }}" />
	</div>

	<!-- Left edit column -->
	<div class="content-main-left">

		<!-- MAIN CONTENT -->
		<div id="maincontent" style="display: block;">
			<label class="lable-title" for="newsTitle">{{ lang.addnews['title'] }}</label>
			<span><br>Как правило заголовок новости или статьи должен состоять из</span>
			<input style="width:100%;" type="text" id="newsTitle" name="title" value="" tabindex="1" placeholder="Введите заголовок новости. Поле является обязательным"/>

			{{ quicktags }}
			<div id="smilies">{{ smilies }}</div>

			{% if (flags.edit_split) %}
				<div id="container.content.short" class="contentActive">
					<textarea placeholder="Краткое описание новости" onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" id="ng_news_content_short" tabindex="2"></textarea>
				</div>
				{% if (flags.extended_more) %}
					<label class="lable-title" for="content_delimiter">{{ lang.addnews['editor.divider'] }}</label>
					<input style="width:100%;" type="text" name="content_delimiter" id="content_delimiter" value="" tabindex="2"/>
				{% endif %}
				<div id="container.content.full" class="contentInactive">
					<textarea placeholder="Полный текст новости" onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" id="ng_news_content_full" tabindex="2"></textarea>
				</div>
				{% else %}
				<div id="container.content" class="contentActive">
					<textarea placeholder="Полный текст новости" name="ng_news_content" id="ng_news_content" tabindex="2"></textarea>
				</div>
			{% endif %}

			{% if not flags['altname.disabled'] %}
				<label class="lable-title" for="alt_name">{{ lang.addnews['alt_name'] }}</label>
				<input style="width:100%;" type="text" name="alt_name" id="alt_name" value="" tabindex="3" />
			{% endif %}
			
			{% if (flags.meta) %}
				<label class="lable-title" for="description">{{ lang.addnews['description'] }}</label>
				<textarea name="description" id="description"></textarea>

				<label class="lable-title" for="newsKeywords">{{ lang.addnews['keywords'] }}</label>
				<input style="width:100%;" type="text" id="newsKeywords" name="keywords" />
			{% endif %}

			<table>
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[1] }}{% endif %}
				{% if (pluginIsActive('autokeys')) %}{{ plugin.autokeys }}{% endif %}
			</table>
		</div>

		<!-- ADDITIONAL -->
		<div id="additional" style="display: none;">
			<table>
				{% if not flags['customdate.disabled'] %}
				<tr>
					<td>
						<label class="lable-title" for="customdate">{{ lang.addnews['custom_date'] }}</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="customdate" id="customdate" value="customdate" />
						<input type="text" id="cdate" name="cdate" value="{{ cdate }}" />
					</td>
				</tr>
				{% endif %}
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[0] }}{% endif %}
				{% if (pluginIsActive('nsched')) %}{{ plugin.nsched }}{% endif %}
				{% if (pluginIsActive('finance')) %}{{ plugin.finance }}{% endif %}
				{% if (pluginIsActive('tags')) %}{{ plugin.tags }}{% endif %}
				{% if (pluginIsActive('tracker')) %}{{ plugin.tracker }}{% endif %}
			</table>
		</div>
		<script language="javascript" type="text/javascript">
			$("#cdate").datetimepicker( { currentText: "DD.MM.YYYY HH:MM" });
		</script>
		
		<!-- ATTACHES -->
		<div id="attaches" style="display: none;">
			<br/>
			<span class="f15">{{ lang.addnews['attach.list'] }}</span>
			<table id="attachFilelist">
			<thead>
			<tr class="contHead"><td>#</td><td width="80">{{ lang.editnews['attach.date'] }}</td><td>{{ lang.editnews['attach.filename'] }}</td><td width="90">{{ lang.editnews['attach.size'] }}</td><td width="40">DEL</td></tr>
			</thead>
			<tbody>
			<!-- <tr><td>*</td><td>New file</td><td colspan="2"><input type="file"/></td><td><input type="button" value="-"/></td></tr> -->
			<tr><td colspan="3">&nbsp;</td><td colspan="2"><input type="button" value="Добавить поле" class="button" style="width: 100%;" onclick="attachAddRow();" /></td></tr>
			</table>
		</div>


	</div>

	<div id="rightBar" class="content-sidebar-right">
		<!-- Right edit column -->
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['comminfo'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item">{{ lang['editor.author'] }}: <!--<a style="font-family: Tahoma, Sans-serif;" href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ authorid }}"><b>{{ author }}</b></a> {% if (pluginIsActive('uprofile')) %} <a href="{{ author_page }}" target="_blank" title="{{ lang.editnews['site.viewuser'] }}"><img src="{{ skins_url }}/images/open_new.png" alt="{{ lang.editnews['newpage'] }}"/></a>{% endif %} --></li>
				<li class="content-sidebar-list-item">{{ lang['editor.dcreate'] }}: <b>{{ createdate }}</b></li>
				<li class="content-sidebar-list-item">{{ lang['editor.dedit'] }}: <b>{{ editdate }}</b></li>
			</ul>
		</div>
		
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang.editnews['category'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item">{{ mastercat }} {% if (flags.mondatory_cat) %}&nbsp; <span style="font-size: 16px; color: red;"><b>*</b></span>{% endif %}</li>
			</ul>
		</div>
		

		{% if flags['multicat.show'] %}
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['editor.extcat'] }}</h3>
			<div style="overflow: auto; height: 150px; margin-left: 16px;">{{ extcat }}</div>
		</div>
		{% endif %}
		
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['editor.configuration'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="mainpage" value="1" class="check" id="mainpage" {% if (flags.mainpage) %}checked="checked" {% endif %}{% if flags['mainpage.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['mainpage'] }}</label></li>
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="pinned" value="1" class="check" id="pinned" {% if (flags.pinned) %}checked="checked" {% endif %}{% if flags['pinned.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_pinned'] }}</label></li>
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="catpinned" value="1" class="check" id="catpinned" {% if (flags.catpinned) %}checked="checked" {% endif %}{% if flags['catpinned.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_catpinned'] }}</label></li>
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="favorite" value="1" class="check" id="favorite" {% if (flags.favorite) %}checked="checked" {% endif %}{% if flags['favorite.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_favorite'] }}</label></li>
				<li class="content-sidebar-list-item"><label><input name="flag_HTML" type="checkbox" class="check" id="flag_HTML" value="1" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['html']) %}checked="checked"{% endif %}/> {{ lang.addnews['flag_html'] }}</label></li>
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_RAW" value="1" class="check" id="flag_RAW" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['raw']) %}checked="checked"{% endif %}/> {{ lang.addnews['flag_raw'] }}</label></li>
				{% if (pluginIsActive('comments')) %}
					<li class="content-sidebar-list-item">
					<hr />
					{{ lang['comments:mode.header'] }}:
					<select name="allow_com">
					<option value="0"{{ plugin.comments['acom:0'] }}>{{ lang['comments:mode.disallow'] }}
					<option value="1"{{ plugin.comments['acom:1'] }}>{{ lang['comments:mode.allow'] }}
					<option value="2"{{ plugin.comments['acom:2'] }}>{{ lang['comments:mode.default'] }}
					</select></li>
				{% endif %}
			</ul>
		</div>
	</div>

	{% if (pluginIsActive('xfields')) %}{{ plugin.xfields.general }}{% endif %}

	<div class="clear content-footer-left">
		<input type="hidden" name="mod" value="news" />
		<input type="hidden" name="action" value="add" />
		<input type="hidden" name="subaction" value="submit" />
		<input type="hidden" name="approve" id="approve" value="0"/>

		<input type="button" value="{{ lang.addnews['preview'] }}" class="button fl" onclick="return preview();" />
		<input type="submit" value="{{ lang['draft'] }}" class="button fl" onclick="return approveMode(-1);" />
		{% if flags['can_publish'] %}<input type="submit" value="{{ lang.addnews['approve'] }}" class="button fr" onclick="return approveMode(1);" />{% endif %}
		<input type="submit" value="{{ lang['pending'] }}" class="button fr" onclick="return approveMode(0);" />
	</div>
</form>

</div>

<script language="javascript" type="text/javascript">
// Restore variables if needed
var jev = {{ JEV }};
var form = document.getElementById('postForm');
for (i in jev) {
 //try { alert(i+' ('+form[i].type+')'); } catch (err) {;}
 if (typeof(jev[i]) == 'object') {
 	for (j in jev[i]) {
 		//alert(i+'['+j+'] = '+ jev[i][j]);
 		try { form[i+'['+j+']'].value = jev[i][j]; } catch (err) {;}
 	}
 } else {
  try {
   if ((form[i].type == 'text')||(form[i].type == 'textarea')||(form[i].type == 'select-one')) {
    form[i].value = jev[i];
   } else if (form[i].type == 'checkbox') {
    form[i].checked = (jev[i]?true:false);
   }
  } catch(err) {;}
 }
}
</script>

<script language="javascript" type="text/javascript">
<!--
function attachAddRow() {
	var tbl = document.getElementById('attachFilelist');
	var lastRow = tbl.rows.length;
	var row = tbl.insertRow(lastRow - 1);

	// Add cells
	row.insertCell(0).innerHTML = '*';
	row.insertCell(1).innerHTML = '{{ lang.editnews['attach.new_file'] }}';

	// Add file input
	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + (++attachAbsoluteRowID) + ']');
	el.setAttribute('size', '80');

	var xCell = row.insertCell(2);
	xCell.colSpan = 2;
	xCell.appendChild(el);


	el = document.createElement('input');
	el.setAttribute('type', 'button');
	el.setAttribute('onclick', 'document.getElementById("attachFilelist").deleteRow(this.parentNode.parentNode.rowIndex);');
	el.setAttribute('value', '-');
	row.insertCell(3).appendChild(el);
}
// Add first row
var attachAbsoluteRowID = 0;
attachAddRow();
-->
</script>
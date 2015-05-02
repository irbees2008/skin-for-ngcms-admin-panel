<h2 class="content-head">{{ lang.addnews['addnews_title'] }}</h2>
<style>table input[type="text"], table input:not([type]), table select {width: 100%!important}</style>
<script type="text/javascript" src="{{ home }}/lib/ajax.js"></script>
<script type="text/javascript" src="{{ home }}/lib/libsuggest.js"></script>
<!-- Main content form -->
<div class="tabs clear">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>{{ lang.addnews['bar.maincontent'] }}</li>
		<li>{{ lang.addnews['bar.additional'] }}</li>
		<li>{{ lang.addnews['bar.attaches'] }}</li>
	</ul>
	<!-- /Navigation bar -->
<form id="postForm" name="form" enctype="multipart/form-data" method="post" action="{{ php_self }}" target="_self">
	<input type="hidden" name="token" value="{{ token }}"/>

	<!-- Left edit column -->
	<div class="content-main-left">
		<!-- MAIN CONTENT -->
		<div class="tabs-content" id="maincontent">
			<label class="lable-title" for="newsTitle">{{ lang.addnews['title'] }}</label>
			<input class="w_100" type="text" id="newsTitle" name="title" value="" tabindex="1" placeholder="Введите заголовок новости. Поле является обязательным"/>

			<label class="lable-title" for="">Текст новости</label>
			<div id="fullwidth">
				{{ quicktags }}
				<div id="smilies" class="smile-box clear">{{ smilies }}</div>

				{% if (flags.edit_split) %}
					<div id="container_content_short" class="contentActive">
						<textarea onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" id="ng_news_content_short" tabindex="2" placeholder="Краткое описание новости" ></textarea>
					</div>
					{% if (flags.extended_more) %}
						<input class="w_100" type="text" name="content_delimiter" id="content_delimiter" value="" tabindex="2" placeholder="{{ lang.addnews['editor.divider'] }}" />
					{% endif %}
					<div id="container_content_full" class="contentInactive">
						<textarea name="ng_news_content_full" id="ng_news_content_full" onclick="changeActive('full');" onfocus="changeActive('full');" tabindex="2" placeholder="Текст полной новости"></textarea>
					</div>
				{% else %}
					<div id="container_content" class="contentActive">
						<textarea name="ng_news_content" id="ng_news_content" tabindex="2" placeholder="Текст полной новости"></textarea>
					</div>
				{% endif %}
			</div>

			{% if not flags['altname.disabled'] %}
				<label class="lable-title" for="alt_name">{{ lang.addnews['alt_name'] }}</label>
				<input class="w_100" type="text" name="alt_name" id="alt_name" value="" tabindex="3" />
			{% endif %}
			
			{% if (flags.meta) %}
				<label class="lable-title" for="description">{{ lang.addnews['description'] }}</label>
				<textarea name="description" id="description"></textarea>

				<label class="lable-title" for="newsKeywords">{{ lang.addnews['keywords'] }}</label>
				<input class="w_100" type="text" id="newsKeywords" name="keywords" />
			{% endif %}

			<table>
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[1] }}{% endif %}
				{% if (pluginIsActive('autokeys')) %}{{ plugin.autokeys }}{% endif %}
			</table>
		</div>

		<!-- ADDITIONAL -->
		<div class="tabs-content" id="additional">
			{% if not flags['customdate.disabled'] %}
			<label class="lable-title" for="customdate">Дата публикации</label>
			<div class="input-group w_100">
				<span class="input-group-check">
					<input type="checkbox" name="customdate" id="customdate" onclick="$('#cdate').focus();" value="customdate" />
				</span>
				<input type="text" name="cdate" id="cdate" value="{{ cdate }}" placeholder="DD.MM.YYYY HH:MM" />
			</div>
			<script language="javascript" type="text/javascript">$("#cdate").datetimepicker( {  });</script>
			{% endif %}
			<table>
				{% if (pluginIsActive('xfields')) %}{{ plugin.xfields[0] }}{% endif %}
				{% if (pluginIsActive('nsched')) %}{{ plugin.nsched }}{% endif %}
				{% if (pluginIsActive('finance')) %}{{ plugin.finance }}{% endif %}
				{% if (pluginIsActive('tags')) %}{{ plugin.tags }}{% endif %}
				{% if (pluginIsActive('tracker')) %}{{ plugin.tracker }}{% endif %}
			</table>
		</div>
		
		<!-- ATTACHES -->
		<div class="tabs-content clear" id="attaches">
			<table class="hover odd" id="attachFilelist">
				<thead>
					<tr>
						<th>#</th><th>{{ lang.editnews['attach.date'] }}</th><th>{{ lang.editnews['attach.filename'] }}</th><th>{{ lang.editnews['attach.size'] }}</th><!--th>Вставить</th--><th>Удалить</th>
					</tr>
				</thead>
				<tbody><tr><td colspan="5"></td></tr></tbody>
			</table>
			<input class="button-success fr" type="button" onclick="attachAddRow();" value="+">
		</div>
	</div>

	<div id="rightBar" class="content-sidebar-right">
		<!-- Right edit column -->
		<div class="content-sidebar-box">
			<h3 class="content-sidebar-title">{{ lang['comminfo'] }}</h3>
			<ul class="content-sidebar-list">
				<li class="content-sidebar-list-item">{{ lang['editor.author'] }}: </li>
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
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="mainpage" id="mainpage" value="1" {% if (flags.mainpage) %}checked="checked" {% endif %}{% if flags['mainpage.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['mainpage'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="pinned" id="pinned" value="1" {% if (flags.pinned) %}checked="checked" {% endif %}{% if flags['pinned.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_pinned'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="catpinned" id="catpinned" value="1" {% if (flags.catpinned) %}checked="checked" {% endif %}{% if flags['catpinned.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_catpinned'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="favorite" id="favorite" value="1" {% if (flags.favorite) %}checked="checked" {% endif %}{% if flags['favorite.disabled'] %}disabled {% endif %}  /> {{ lang.addnews['add_favorite'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_HTML" id="flag_HTML" value="1" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['html']) %}checked="checked"{% endif %}/> {{ lang.addnews['flag_html'] }}</label></li>
				
				<li class="content-sidebar-list-item"><label><input type="checkbox" name="flag_RAW" id="flag_RAW" value="1" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['raw']) %}checked="checked"{% endif %}/> {{ lang.addnews['flag_raw'] }}</label></li>
				{% if (pluginIsActive('comments')) %}
					<li class="content-sidebar-list-item">
					<hr />
					{{ lang['comments:mode.header'] }}:
					<select name="allow_com" class="w_100">
					<option value="0"{{ plugin.comments['acom:0'] }}>{{ lang['comments:mode.disallow'] }}
					<option value="1"{{ plugin.comments['acom:1'] }}>{{ lang['comments:mode.allow'] }}
					<option value="2"{{ plugin.comments['acom:2'] }}>{{ lang['comments:mode.default'] }}
					</select></li>
				{% endif %}
			</ul>
		</div>
	</div>

	{% if (pluginIsActive('xfields')) %}{{ plugin.xfields.general }}{% endif %}

	<div class="content-footer-left clear">
		<input type="hidden" name="mod" value="news" />
		<input type="hidden" name="action" value="add" />
		<input type="hidden" name="subaction" value="submit" />
		<input type="hidden" name="approve" id="approve" value="0"/>

		<input type="button" value="{{ lang.addnews['preview'] }}" class="fl" onclick="return preview();" />
		<input type="submit" value="{{ lang['draft'] }}" class="fl" onclick="return approveMode(-1);" />
		{% if flags['can_publish'] %}<input type="submit" value="{{ lang.addnews['approve'] }}" class="save-doc fr" onclick="return approveMode(1);" />{% endif %}
		<input type="submit" value="{{ lang['pending'] }}" class="fr" onclick="return approveMode(0);" />
	</div>
	
</form>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
	<input type="hidden" name="area" value="" />
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
	var setRow = (++attachAbsoluteRowID);

	// Add cells
	row.insertCell(0).innerHTML = '*';
	var d = new Date();
	var nowDate = d.getHours().toString().replace( /^([0-9])$/, '0$1' )+':'+d.getMinutes().toString().replace( /^([0-9])$/, '0$1' )+':'+d.getSeconds().toString().replace( /^([0-9])$/, '0$1' );
	row.insertCell(1).innerHTML = nowDate;
		
		
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
	row.insertCell(2).appendChild(el1);
	
	el = document.createElement('span');
	el.setAttribute('id','spansize' + setRow);
	row.insertCell(3).appendChild(el);
	
	/*el = document.createElement('a');
	el.setAttribute('class','link-pseudo');
	el.setAttribute('title','{{ lang['tags.file'] }}');
	el.setAttribute('onclick', "$('.tabs-title li').removeClass('active');$('.tabs-title li:first').addClass('active');$('.tabs-content').removeClass('active');$('.tabs-content:first').addClass('active'); insertext('[attach#" + setRow + "]Вложение " + setRow + "[/attach]','', currentInputAreaID)");
	el.innerHTML = '<i class="fa fa-paperclip"></i>';
	row.insertCell(4).appendChild(el);*/
	
	el = document.createElement('input');
	el.setAttribute('class','button-danger fr');
	el.setAttribute('type', 'button');
	el.setAttribute('onclick', 'document.getElementById(\'attachFilelist\').deleteRow(this.parentNode.parentNode.rowIndex);');
	el.setAttribute('value', '-');
	row.insertCell(4).appendChild(el);
}

// Add first row
var attachAbsoluteRowID = 0;

// горячие клавиши
document.onkeydown = function(e) {
	e = e || event;

	if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
	//var form = document.getElementById("postForm");form.submit();
		$('.save-doc').click();
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
<h2 class="content-head">{{ lang.editnews['news_title'] }}</h2>

<!--a href="http://ngcms.rusiq.ru/engine/admin.php?mod=news&sort=title_desc">заголовок</a><br/>
<a href="http://ngcms.rusiq.ru/engine/admin.php?mod=news&sort=title">заголовок</a><br/-->

<style>
dl.fl input[type="text"], dl.fl input[type="button"], dl.fl input[type="reset"], dl.fl input[type="submit"], dl.fl select {
width:48%;
}
</style>

<script type="text/javascript" src="{{ admin_url }}/includes/js/ajax.js"></script>
<script type="text/javascript" src="{{ admin_url }}/includes/js/admin.js"></script>
<script type="text/javascript" src="{{ admin_url }}/includes/js/libsuggest.js"></script>
<script language="javascript" type="text/javascript">
<!--

function addEvent(elem, type, handler){
  if (elem.addEventListener){
    elem.addEventListener(type, handler, false)
  } else {
    elem.attachEvent("on"+type, handler)
  }
}

// DateEdit filter
function filter_attach_DateEdit(id) {
	var field = document.getElementById(id);
	if (!field)
		return false;

	if (field.value == '')
		field.value = 'DD.MM.YYYY';

	field.onfocus = function(event) {
		var ev = event ? event : window.event;
		var elem = ev.target ? ev.target : ev.srcElement;

		if (elem.value == 'DD.MM.YYYY')
			elem.value = '';

		return true;
	}


	field.onkeypress = function(event) {
		var ev = event ? event : window.event;
		var keyCode = ev.keyCode ? ev.keyCode : ev.charCode;
		var elem = ev.target ? ev.target : ev.srcElement;
		var elv = elem.value;

		isMozilla = false;
		isIE = false;
		isOpera = false;
		if (navigator.appName == 'Netscape') { isMozilla = true; }
		else if (navigator.appName == 'Microsoft Internet Explorer') { isIE = true; }
		else if (navigator.appName == 'Opera') { isOpera = true; }
		else { /* alert('Unknown navigator: `'+navigator.appName+'`'); */ }

		//document.getElementById('debugWin').innerHTML = 'keyPress('+ev.keyCode+':'+ev.charCode+')['+(ev.shiftKey?'S':'.')+(ev.ctrlKey?'C':'.')+(ev.altKey?'A':'.')+']<br/>' + document.getElementById('debugWin').innerHTML;

		// FF - onKeyPress captures functional keys. Skip anything with charCode = 0
		if (isMozilla && !ev.charCode)
			return true;

		// Opera - dumb browser, don't let us to determine some keys
		if (isOpera) {
			var ek = '';
			//for (i in event) { ek = ek + '['+i+']: '+event[i]+'<br/>\n'; }
			//alert(ek);
			if (ev.keyCode < 32) return true;
			if (!ev.shiftKey && ((ev.keyCode >= 33) && (ev.keyCode <= 47))) return true;
			if (!ev.keyCode) return true;
			if (!ev.which) return true;
		}


		// Don't block CTRL / ALT keys
		if (ev.altKey || ev.ctrlKey || !keyCode)
			return true;

		// Allow to input only digits [0..9] and dot [.]
		if (((keyCode >= 48) && (keyCode <= 57)) || (keyCode == 46))
			return true;

		return false;
	}

	return true;
}

-->
</script>

<!-- DEBUG WINDOW <div id="debugWin" style="overflow: auto; position: absolute; top: 160px; left: 230px; width: 400px; height: 400px; background: white; 4px double black; padding: 2px; margin: 2px;">DEBUG WINDOW</div> -->


<!-- Hidden SUGGEST div -->
<div id="suggestWindow" class="suggestWindow">
<span id="suggestBlock"></span>
<a href="#" id="suggestClose">close</a>
</div>

<div class="clear">
<form action="{{ php_self }}?mod=news" method="post" name="options_bar">
<!--Block 1-->
<dl class="fl">
<dt>
    <label for="sl" class="fl">Поиск</label>
</dt>
<dd>
    <input name="sl" id="sl" type="text" class="bfsearch" value="{{ sl }}"/> <select class="fr" name="st"><option value="0" {{ st.selected0 }}>заголовок</option><option value="1" {{ st.selected1 }}>текст</option></select>
</dd>
<dt>
    <label for="an">{{ lang.editnews.author }}</label>
</dt>
<dd>
    <input name="an" id="an" class="bfauthor" type="text"  value="{{ an }}" autocomplete="off" /> <span id="suggestLoader"><i class="fa fa-spinner fa-pulse"></i></span>
</dd>
</dl>
<!--/Block 1-->

<!--Block 2-->
<dl class="fl">
<dt>
    <label for="dr1" class="fl">Дата, от</label>
    <label for="dr2" class="fr">по</label>
</dt>
<dd>
    <input type="text" id="dr1" name="dr1" value="{{ dr1 }}" class="fl bfdate"/>
    <input type="text" id="dr2" name="dr2" value="{{ dr2 }}" class="fr bfdate"/>
</dd>
<dt>
    <label for="catmenu">{{ lang.editnews['category'] }}</label>
</dt>
<dd>
    {{ category_select }}
</dd>
</dl>
<!--/Block 2-->

<!--Block 3-->
<dl class="fl">
<dt>
    <label class="fl" for="status">Статус</label>
    <label class="fr" for="sort">{{ lang.editnews['sort'] }}</label>
</dt>
<dd>
    <select id="status" name="status" class="fl bfstatus"><option value="">{{ lang.editnews['smode_all'] }}</option>{{ statuslist }}</select>
    <select id="sort" name="sort" class="fr bfsortlist">{{ sortlist }}</select>
</dd>
<dt>    
     <label for="rpp" class="">На странице</label>
</dt>
<dd>
    <input id="rpp" name="rpp" value="{{ rpp }}" type="text" />
    <input type="submit" value="{{ lang['do_show'] }}" class="fr filterbutton"  />
</dd>
</dl>
</form>
</div>
<!-- Конец блока фильтрации -->

<!--div class="clear">
<a href="{{ php_self }}?mod=news&status=0" class="button navbutton fl">- Все -</a>
<a href="{{ php_self }}?mod=news&status=1" class="button navbutton fl">Черновики</a>
<a href="{{ php_self }}?mod=news&status=2" class="button navbutton fl">На модерации</a>
<a href="{{ php_self }}?mod=news&status=3" class="button navbutton fl">Опубликованные</a>
</div-->

<!-- List of news start here -->
<form action="{{ php_self }}?mod=news" method="post" name="editnews">
<input type="hidden" name="token" value="{{ token }}" />
<input type="hidden" name="mod" value="news" />
<input type="hidden" name="action" value="manage" />
<table class="hover odd">
<thead>
<tr>
<th><input class="check" type="checkbox" name="master_box" title="{{ lang.editnews['select_all'] }}" onclick="javascript:check_uncheck_all(editnews)" /></th>
<th class="mobile-hide-480">ID</th>
<th class="mobile-hide-480">&nbsp;</th>
<th class="mobile-hide-480">&nbsp;</th>
{% if flags.comments %}<th class="mobile-hide-480"><i class="fa fa-comment-o"></i></th>{% endif %}
<th class="mobile-hide-480"><i class="fa fa-eye"></i></th>
<th>{{ lang.editnews['title'] }}</th>
<th class="mobile-hide-480">{{ lang.editnews['category'] }}</th>
<th>{{ lang.editnews['author'] }}</th>
<th>{{ lang.editnews['date'] }}</th>
</tr>
</thead>
{% for entry in entries %}
<tr>
	<td><input name="selected_news[]" value="{{ entry.newsid }}" class="check" type="checkbox" /></td>
	<td class="mobile-hide-480">{{ entry.newsid }}</td>
	
	<td class="mobile-hide-480">{% if (entry.state == 1) %}<i class="fa fa-check" title="{{ lang['state.published'] }}"></i>{% elseif (entry.state == 0) %}<i class="fa fa-minus-circle" title="{{ lang['state.unpiblished'] }}"></i>{% else %}<i class="fa fa-pencil" title="{{ lang['state.draft'] }}"></i>{% endif %} </td>
	<td class="mobile-hide-480">
		{% if entry.flags.mainpage %}<i class="fa fa-home" title="На главной странице"></i>{% endif %}
		{% if (entry.attach_count > 0) %}<i class="fa fa-thumb-tack" title="Файлов: {{ entry.attach_count }}"></i>{% endif %}
		{% if (entry.images_count > 0) %}<i class="fa fa-file-image-o" title="Изображений: {{ entry.images_count }}"></i>{% endif %}
	</td>
	{% if entry.flags.comments %}<td class="mobile-hide-480">{% if (entry.comments > 0) %}{{ entry.comments }}{% endif %}</td>
	<td class="mobile-hide-480">{% if entry.flags.isActive %}<a href="{{ entry.link }}" target="_blank">{% endif %}{% if (entry.views > 0) %}{{ entry.views }}{% else %}-{% endif %}{% if entry.flags.isActive %}</a>{% endif %}</td>
	{% endif %}
	<td>
		{% if entry.flags.editable %}<a href="{{ php_self }}?mod=news&amp;action=edit&amp;id={{ entry.newsid }}">{% endif %}{{ entry.title }}{% if entry.flags.editable %}</a>{% endif %}
	</td>
	<td class="mobile-hide-480">{{ entry.allcats }}</td>
	<td><a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ entry.userid }}">{{ entry.username }}</a></td>
	<td>{{ entry.itemdate|date("d.m.") }}<wbr>{{ entry.itemdate|date("Y") }}</td>
	
</tr>
{% else %}
<tr><td colspan="15"><p>- {{ lang.editnews['not_found'] }} -</p></td></tr>
{% endfor %}
</table>

	<div class="clear content-footer">
		<input class="fr" type="button" value="{{ lang.addnews['addnews_title'] }}" onclick="document.location='?mod=news&action=add'; return false;" />
		{% if flags.allow_modify %}
		<div class="div-resp clear">
			<div class="input-group">
				<select name="subaction" id="subaction">
					<option value="">-- {{ lang.editnews['action'] }} --</option>
					<option value="mass_approve">{{ lang.editnews['approve'] }}</option>
					<option value="mass_forbidden">{{ lang.editnews['forbidden'] }}</option>
					<option value="" disabled="disabled">===================</option>
					<option value="mass_mainpage">{{ lang.editnews['massmainpage'] }}</option>
					<option value="mass_unmainpage">{{ lang.editnews['massunmainpage'] }}</option>
					<option value="" disabled="disabled">===================</option>
					<option value="mass_currdate">{{ lang.editnews['modify.mass.currdate'] }}</option>
					<option value="" disabled="disabled">===================</option>
					{% if flags.comments %}<option value="mass_com_approve">{{ lang.editnews['com_approve'] }}</option>
					<option value="mass_com_forbidden">{{ lang.editnews['com_forbidden'] }}</option>
					<option value="" disabled="disabled">===================</option>{% endif %}
					<option value="mass_delete">{{ lang.editnews['delete'] }}</option>
				</select>
				<span>
					<button type="submit">{{ lang['ok'] }}</button>
				</span>
			</div>
		</div>
		{% endif %}
	</div>
{{ pagesss }}
</form>

<script language="javascript" type="text/javascript">
// Init jQueryUI datepicker
$("#dr1").datepicker( { currentText: "{{ dr1 }}", dateFormat: "dd.mm.yy" });
$("#dr2").datepicker( { currentText: "{{ dr2 }}", dateFormat: "dd.mm.yy" });


<!--
// INIT NEW SUGGEST LIBRARY [ call only after full document load ]
function systemInit() {
var aSuggest = new ngSuggest('an',
								{
									'localPrefix'	: '{{ localPrefix }}',
									'reqMethodName'	: 'core.users.search',
									'lId'		: 'suggestLoader',
									'hlr'		: 'true',
									'iMinLen'	: 1,
									'stCols'	: 2,
									'stColsClass': [ 'cleft', 'cright' ],
									'stColsHLR'	: [ true, false ],
								}
							);

}

// Init system [ IE / Other browsers should be inited in different ways ]
if (document.body.attachEvent) {
	// IE
	document.body.onload = systemInit;
} else {
	// Others
	systemInit();
}

filter_attach_DateEdit('dr1');
filter_attach_DateEdit('dr2');
-->
</script>
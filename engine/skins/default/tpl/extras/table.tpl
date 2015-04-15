<h2 class="content-head">{{ lang['extras'] }}</h2>

<script type="text/javascript" src="{{ admin_url }}/includes/js/admin.js"></script>
<script type="text/javascript" language="javascript">

//
// First: Init CSS manage mechanism

var sheetRules = new Array();
var sIdx;
for (sIdx = 0; sIdx < document.styleSheets.length; sIdx++) {
	if ((document.styleSheets[sIdx].href != null) && (document.styleSheets[sIdx].href.indexOf('/skins/default/style.css'))) {
		// Catched
		if (document.styleSheets[sIdx].cssRules) {
			sheetRules = document.styleSheets[sIdx].cssRules;
		} else if (document.styleSheets[sIdx].rules) {
			sheetRules = document.styleSheets[sIdx].rules;
		}
		break;
	}
}

var sIndexActive	= -1;
var sIndexInactive	= -1;
var sIndexUninstalled	= -1;

var qShowState		= 0;
/*
var qStateAll		= 1;
var qStateActive	= 0;
var qStateInactive	= 0;
var qStateUninstalled	= 0;
*/

for (i=0; i<sheetRules.length; i++) {
	var sText = ''+sheetRules[i]['selectorText'];
	sText = sText.toLowerCase();
	if (sText == '.pluginentryactive td')		sIndexActive = i;
	if (sText == '.pluginentryinactive td')		sIndexInactive = i;
	if (sText == '.pluginentryuninstalled td')	sIndexUninstalled = i;
}

// ===================================================================
// Init pre-saved in cookies values
var cookieStatus = getCookie('ngadm_pstatus');
if ((cookieStatus !== null)&&(typeof(cookieStatus) == "string")&&(Number(cookieStatus) >= 0)&&(Number(cookieStatus) <= 4)) {
	qShowState = Number(cookieStatus);
}


// ===================================================================
// Init pre-display CSS groups
 if (sIndexActive >= 0)
	sheetRules[sIndexActive].style.display = ((qShowState == 0 )||(qShowState == 1))?'':'none';

 if (sIndexInactive >= 0)
	sheetRules[sIndexInactive].style.display = ((qShowState == 0 )||(qShowState == 2))?'':'none';

 if (sIndexUninstalled >= 0)
	sheetRules[sIndexUninstalled].style.display = ((qShowState == 0 )||(qShowState == 3))?'':'none';


// ===================================================================
// Function to set display filter
function setDisplayMode(mode) {
 qShowState = mode;
 setCookie('ngadm_pstatus', qShowState, 'Wed, 01-Jan-2020 00:00:00 GMT', 0, 0, 0);

 if (sIndexActive >= 0)
	sheetRules[sIndexActive].style.display = ((qShowState == 0 )||(qShowState == 1))?'':'none';

 if (sIndexInactive >= 0)
	sheetRules[sIndexInactive].style.display = ((qShowState == 0 )||(qShowState == 2))?'':'none';

 if (sIndexUninstalled >= 0)
	sheetRules[sIndexUninstalled].style.display = ((qShowState == 0 )||(qShowState == 3))?'':'none';

 document.getElementById('pTypeAll').className			= (qShowState == 0)?'pActive':'pInactive';
 document.getElementById('pTypeActive').className		= (qShowState == 1)?'pActive':'pInactive';
 document.getElementById('pTypeInactive').className		= (qShowState == 2)?'pActive':'pInactive';
 document.getElementById('pTypeUninstalled').className	= (qShowState == 3)?'pActive':'pInactive';
}

function getUrlVars() {
	return window.location.href.slice(window.location.href.indexOf('?')).split(/[&?]{1}[\w\d]+=/);
}
$(function() {
	var action = (getUrlVars()[2]) ? getUrlVars()[2] : 'all';
	switch (action) {
		case 'all': setDisplayMode(0); break;
		case 'active': setDisplayMode(1); break;
		case 'inactive': setDisplayMode(2); break;
		case 'uninstalled': setDisplayMode(3); break;		
	}	
});
</script>

<div class="content clear" id="pluginMenu">

	<!--div class="content-nav clear">
		<input class="navbutton active" type="button" onclick="ChangeOption('maincontent');" value="{{ lang.addnews['bar.maincontent'] }}" />
		<input class="navbutton" type="button" onclick="ChangeOption('additional');" value="{{ lang.addnews['bar.additional'] }}" />
		<input class="navbutton" type="button" onclick="ChangeOption('attaches');" value="{{ lang.addnews['bar.attaches'] }}" />
	</div-->
	
	<div class="content-nav clear" id="pluginTypeMenu">
		<span id="pTypeAll" class="navbutton pInactive" onclick="setDisplayMode(0);">{{ lang['list.all'] }} (<span id="cnt-plug-all">{{ cntAll }}</span>)</span>
		
		<span id="pTypeActive" class="navbutton pInactive" onclick="setDisplayMode(1);">{{ lang['list.active'] }} ({{ cntActive }})</span>
		
		<span id="pTypeInactive" class="navbutton pInactive" onclick="setDisplayMode(2);">{{ lang['list.inactive'] }} ({{ cntInactive }})</span>
		
		<span id="pTypeUninstalled" class="navbutton pInactive" onclick="setDisplayMode(3);">{{ lang['list.needinstall'] }} ({{ cntUninstalled }})</span>
	</div>

<table class="odd hover">
<thead>
<tr align="left" class="contHead">
<th>{{ lang['id'] }}</th>
<th>{{ lang['title'] }}</th>
<th>{{ lang['type'] }}</th>
<th>{{ lang['version'] }}</th>
<th>&nbsp;</th>
<th>{{ lang['description'] }}</th>
<th>{{ lang['author'] }}</th>
<th>{{ lang['action'] }}</th>
</tr>
</thead>
<tbody id="entryList">
{% for entry in entries %}
<tr align="left" class="{{ entry.style }}" id="plugin_{{ entry.id }}">
	<td>{{ entry.id }} {{ entry.new }}</td>
	<td>{{ entry.url }}</td>
	<td>{{ entry.type }}</td>
	<td>{{ entry.version }}</td>
	<td nowrap>{{ entry.readme }} {{ entry.history }}</td>
	<td>{{ entry.description }}</td>
	<td>{{ entry.author_url }}</td>
	<td nowrap="nowrap">{{ entry.link }} {{ entry.install }}</td>
</tr>
{% endfor %}
</tbody>
</table>
</div>

<script language="javascript" type="text/javascript">

// ===================================================================
// Now let's init buttons
 document.getElementById('pTypeAll').className			= (qShowState == 0)?'pActive':'pInactive';
 document.getElementById('pTypeActive').className		= (qShowState == 1)?'pActive':'pInactive';
 document.getElementById('pTypeInactive').className		= (qShowState == 2)?'pActive':'pInactive';
 document.getElementById('pTypeUninstalled').className	= (qShowState == 3)?'pActive':'pInactive';


function ngPluginSwitch(plugin, state) {
	ngShowLoading();
	$.post('/engine/rpc.php', {
			json : 1,
			methodName : 'admin.extras.switch',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token'  : '{{ token }}',
					'plugin' : plugin,
					'state'  : state,
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { ngNotifyWindow('{{ lang['rpc_jsonError'] }} '+data, '{{ lang['notifyWindowError'] }}'); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		} else {
			ngNotifyWindow(resTX['errorText'], '{{ lang['notifyWindowInfo'] }}');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('{{ lang['rpc_httpError'] }}', '{{ lang['notifyWindowError'] }}'); });
}


</script>
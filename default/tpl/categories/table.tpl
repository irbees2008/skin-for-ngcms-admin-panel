<h2 class="content-head">{{ lang['categories_title'] }}</h2>

<script type="text/javascript" src="{{ admin_url }}/includes/js/ajax.js"></script>
<script type="text/javascript" src="{{ admin_url }}/includes/js/admin.js"></script>

<div class="clear" id="list">
	<table class="table-resp table-categories">
		<thead>
			<tr>
				<th>ID</th>
				<th>{{ lang['title'] }}</th>
				<th>{{ lang['alt_name'] }}</th>
				<th>{{ lang['category.header.menushow'] }}</th>
				<th>{{ lang['category.header.template'] }}</th>
				<th>{{ lang['news'] }}</th>
				<th>{{ lang['action'] }}</th>
			</tr>
		</thead>
		<tbody id="admCatList">
			{% include localPath(0)~"entries.tpl" %}
		</tbody>
	</table>

	{% if (flags.canModify) %}
	<div class="clear content-footer">
		<form method="get" action="">
			<input type="hidden" name="mod" value="categories" />
			<input type="hidden" name="action" value="add" />
			<input class="fr" type="submit" value="Добавить категорию" />
		</form>
	</div>
	{% endif %}
</div>

<script type="text/javascript">
// Process RPC requests for categories
var categoryUToken = '{{ token }}';

function categoryModifyRequest(cmd, cid) {
	var rpcCommand = '';
	var rpcParams = [];
	switch (cmd) {
		case 'up':
		case 'down':
		case 'del':
			rpcCommand = 'admin.categories.modify';
			rpcParams = {'mode' : cmd, 'id' : cid, 'token' : categoryUToken };
			break;
	}
	if (rpcCommand == '') {
		alert('No RPC command');
		return false;

	}

	var linkTX = new sack();
	linkTX.requestFile = 'rpc.php';
	linkTX.setVar('json', '1');
	linkTX.setVar('methodName', rpcCommand);
	linkTX.setVar('params', json_encode(rpcParams));
	linkTX.method='POST';
	linkTX.onComplete = function() {
		if (linkTX.responseStatus[0] == 200) {
			try {
		 		resTX = eval('('+linkTX.response+')');
		 	} catch (err) {
		 		alert('{{ lang['fmsg.save.json_parse_error'] }} '+linkTX.response);
		 		return false;
		 	}

		 	// First - check error state
		 	if (!resTX['status']) {
		 		// ERROR. Display it
				ngNotifyWindow(resTX['errorCode']+': '+resTX['errorText'], 'Error');
		 		//alert('Error ('+resTX['errorCode']+'): '+resTX['errorText']);
		 	} else {
		 		if (resTX['content']) {
					if (resTX['infoText']) {
						ngNotifySticker(resTX['infoText'], {className: resTX['infoCode']?'ngStickerClassClassic':'ngStickerClassError'});
					}
		 			document.getElementById('admCatList').innerHTML = resTX['content'];
		 		} else {
		 			alert('Template error: no content received from server for update, server response: '+linkTX.response);
		 		}
		 	}
	 } else {
	 	alert('{{ lang['fmsg.save.httperror'] }} '+linkTX.responseStatus[0]);
	 }
	}
	linkTX.runAJAX();

	return false;
}
</script>
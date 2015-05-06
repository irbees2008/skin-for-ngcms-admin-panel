<h2 class="content-head">{l_files_title}</h2>

<!-- Preload uploadify engine -->
<script type="text/javascript" src="{admin_url}/includes/js/swfobject.js"></script>
<script type="text/javascript" src="{admin_url}/includes/js/jquery.uploadify.v2.1.4.min.js"></script>

<!-- Main scripts -->
<script type="text/javascript">
var flagRequireReload = 0;

function setStatus(mode) {
 var st = document.getElementById('delform');
 st.subaction.value = mode;
}
</script>

<!-- Main content form -->
<div class="content tabs clear">

	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>{l_list}</li>
		[status]<li>{l_categories}</li>[/status]
		<li>{l_uploadnew}</li>
	</ul>
	<!-- /Navigation bar -->
	
	<div class="tabs-content">
		
		<div class="clear" id="list">
		<form action="{php_self}?mod=files&amp;action=list" method="post" name="options_bar">
			<input type="hidden" name="area" value="{area}" />
			<dl class="fl">
				<dt><label class="fl" for="author">{l_author}</label></dt>
				<dd><select name="author" id="author"><option value="">- {l_all} -</option>{authorlist}</select></dd>
				[status]
				<dt><label class="fl" for="">{l_category} </label></dt>
				<dd>{dirlistcat}</dd>
				[/status]
			</dl>
			<dl class="fl">
				<dt><label class="fl" for="postdate">{l_month}</label></dt>
				<dd><select name="postdate" id="postdate"><option selected value="">- {l_all} -</option>{dateslist}</select></dd>
				<dt><label class="fl" for="npp">{l_per_page}</label></dt>
				<dd>
					<input class="fl" type="text" name="npp" id="npp" value="{npp}" />
					<input class="fr" type="submit" value="{l_show}" />
				</dd>
			</dl>
		</form>
		</div>

		<form action="{php_self}?mod=files" method="post" name="delform" id="delform">
			<input type="hidden" name="area" value="{area}" />
			<input type="hidden" name="subaction" value="" />
			<table class="table-resp table-files" id="entries">
				<thead>
				<tr>
					<th><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="check_uncheck_all(delform)" /></th>
					<th>ID</th>
					<th>{l_name}</th>
					<th>{l_category}</th>
					<th>{l_author}</th>
					<th>{l_size}</th>
					<th>{l_action}</th>
				</tr>
				</thead>
					{entries}
			</table>
			
			<div class="content-footer clear">
				[status]
				<input type="submit" class="fr button-danger" onclick="setStatus('delete');" value="{l_delete}" />
				<div class="div-resp">
					<div class="input-group">
						{dirlist}
						<span>
							<button type="submit" onclick="setStatus('move');">{l_move}</button>
						</span>
					</div>
				</div>
				[/status]
			</div>
		</form>
		{pagesss}
	</div>
	
	[status]
	<div class="tabs-content" id="categories">
		<div class="div-resp">
			<h3 class="content-title">{l_addnewcat}</h3>
			<form action="{php_self}?mod=files" method="post" name="newcat">
				<input type="hidden" name="area" value="{area}" />
				<input type="hidden" name="subaction" value="newcat" />
				
				<div class="input-group">
					<input type="text" name="newfolder" required />
					<span>
						<button type="submit">Применить</button>
					</span>
				</div>
			</form>
		</div>
		
		<div class="div-resp">
			<h3 class="content-title">{l_delcat}</h3>
			<form action="{php_self}?mod=files" method="post" name="delcat">
				<input type="hidden" name="area" value="{area}" />
				<input type="hidden" name="subaction" value="delcat" />
				
				<div class="input-group">
					{dirlist}
					<span>
						<button type="submit">Применить</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	[/status]

	<div class="tabs-content" id="uploadnew">
		<div class="div-resp">
			<!-- UPLOAD_FILE_GOVNO_FLASH -->
			<h3 class="content-title">{l_upload_file}</h3>
			<!-- Main scripts -->
			<form action="{php_self}?mod=files" method="post" enctype="multipart/form-data" name="sn">
				<input type="hidden" name="area" value="{area}" />
				<input type="hidden" name="subaction" value="upload" />
				
				<div class="input-group">
					<span class="input-group-check">
						<i class="fa fa-folder-open-o"></i>
					</span>
					{dirlistS}
				</div>
				<div class="input-group">
					<span class="input-group-check"><input type="checkbox" name="replace" id="flagReplace" value="1"/></span>
					<input type="text" value="{l_do_replace}" disabled />
				</div>
				<div class="input-group">
					<span class="input-group-check"><input type="checkbox" name="rand" id="flagRand" value="1"/></span>
					<input type="text" value="{l_do_rand}" disabled />
				</div>

				<span id="showRemoveAddButtoms">
					<input type="button" value='{l_delone}' onClick="RemoveFiles();return false;" />
					<input type="button" value='{l_onemore}' onClick="AddFiles();return false;" />
				</span>
				
				<table id="fileup" class="upload">
					<tr id="row">
						<td>1: </td><td><input type="file" id="fileUploadInput" name="userfile[0]" required /></td>
					</tr>
				</table>

				<div class="clear">
					<span id="mfs"></span><script type="text/javascript">$('#mfs').text('Максимальный размер файла ' + formatSize({maxSize}));</script>
					<button class="fr" type="submit" onclick="uploadifyDoUpload(); return false;"/><i class="fa fa-upload"></i></button>
				</div>

				<script language="javascript" type="text/javascript">
					function AddFiles() {
						var tbl = document.getElementById('fileup');
						var lastRow = tbl.rows.length;
						var iteration = lastRow+1;
						var row = tbl.insertRow(lastRow);
						var cellRight = row.insertCell(0);
						cellRight.innerHTML = '<span style="font-size: 12px;">'+iteration+': </span>';
						cellRight = row.insertCell(1);

						var el = document.createElement('input');
						el.setAttribute('type', 'file');
						el.setAttribute('name', 'userfile[' + iteration + ']');
						el.setAttribute('size', '30');
						el.setAttribute('value', iteration);
						cellRight.appendChild(el);
					}
					function RemoveFiles() {
						var tbl = document.getElementById('fileup');
						var lastRow = tbl.rows.length;
						if (lastRow > 1){
							tbl.deleteRow(lastRow - 1);
						}
					}
				</script>
				<!-- BEGIN: Init UPLOADIFY engine -->
				<script type="text/javascript">
				$(document).ready(function() {
					$('#fileUploadInput').uploadify({
						'uploader' : '{admin_url}/includes/js/uploadify.swf',
						'script' : '{admin_url}/rpc.php?methodName=admin.files.upload',
						'cancelImg' : '{skins_url}/images/up_cancel.png',
						'folder' : '',
						'fileExt' : '{listExt}',
						'fileDesc' : '{descExt}',
						'sizeLimit' : {maxSize},
						'auto' : false,
						'multi' : true,
						'buttonText' : 'Select ...',
						'width' : 100,
						'removeCompleted' : true,
						'onInit' : function() { document.getElementById('showRemoveAddButtoms').style.display= 'none'; },
						'onComplete' : function(ev, ID, fileObj, res, data) {
							// Response should be in JSON format
							var resData;
							var resStatus = 0;
							try {
								resData = eval('('+res+')');
								if (typeof(resData['status']))
									resStatus = 1;
							} catch (err) { alert('Error parsing JSON output. Result: '+res); }

							if (!resStatus) {
								alert('Upload resp: '+res);
								return false;
							}

							flagRequireReload = 1;

							// If upload fails
							if (resData['status'] < 1) {
								$('#' + $(ev.target).attr('id') + ID).append('<div class="msg">('+resData['errorCode']+') '+resData['errorText']+'</div>');
								if (typeof(resData['errorDescription']) !== 'undefined') {
									$('#' + $(ev.target).attr('id') + ID).append('<div class="msgInfo">'+resData['errorDescription']+'</div>');
								}
								$('#' + $(ev.target).attr('id') + ID).css('border', '2px solid red');
								return false;
							} else {
								$('#' + $(ev.target).attr('id') + ID).append('<div>'+resData['errorText']+'</div>');
								$('#' + $(ev.target).attr('id') + ID).fadeOut(5000);
							}
							return true;
						},
					});
				});

				function uploadifyDoUpload() {
					// Prepare script data
					var scriptData = new Array();
					scriptData['ngAuthCookie'] = '{authcookie}';
					scriptData['uploadType'] = 'file';
					scriptData['category'] = document.getElementById('categorySelect').value;
					scriptData['rand'] = document.getElementById('flagRand').checked?1:0;
					scriptData['replace'] = document.getElementById('flagReplace').checked?1:0;

					$('#fileUploadInput').uploadifySettings('scriptData',scriptData,true);
					$('#fileUploadInput').uploadifyUpload();
				}
				</script>
				<!-- END: Init UPLOADIFY engine -->
			</form>
		</div>
		
		<div class="div-resp">
			<!-- UPLOAD_FILE_URL -->
			<h3 class="content-title">{l_upload_file_url}</h3>
			<form action="{php_self}?mod=files" method="post" name="snup">
				<input type="hidden" name="subaction" value="uploadurl" />
				<input type="hidden" name="area" value="{area}" />
				
				<div class="input-group">
					<span class="input-group-check">
						<i class="fa fa-folder-open-o"></i>
					</span>
					{dirlist}
				</div>
				<div class="input-group">
					<span class="input-group-check"><input type="checkbox" name="replace" value="replace" id="replace" /></span>
					<input type="text" value="{l_do_replace}" disabled />
				</div>
				<div class="input-group">
					<span class="input-group-check"><input type="checkbox" name="rand" value="rand" id="rand" /></span>
					<input type="text" value="{l_do_rand}" disabled />
				</div>
				<table class="upload" id="fileup2">
					<tr id="row">
						<td>
							<div class="input-group">
								<span class="input-group-check">1</span>
								<input type="url" name="userurl[0]" required />
							</div>
						</td>
					</tr>
				</table>
				
				<div class="clear">
					<button class="button-danger fl" type="button" onClick="RemoveFiles2();return false;" >-</button>
					<button class="button-success fl" type="button" onClick="AddFiles2();return false;" >+</button>
					<button class="fr" type="submit"><i class="fa fa-upload"></i></button>
				</div>
				
				<script type="text/javascript">
					function AddFiles2() {
						var tbl = document.getElementById('fileup2');
						var lastRow = tbl.rows.length;
						var iteration = lastRow+1;
						var row = tbl.insertRow(lastRow);
						var cellRight = row.insertCell(0);
						cellRight.innerHTML = '<div class="input-group"><span class="input-group-check">'+ iteration +'</span><input type="url" name="userurl[' + lastRow + ']" required /></div>';
					}
					function RemoveFiles2() {
						var tbl = document.getElementById('fileup2');
						var lastRow = tbl.rows.length;
						if (lastRow > 1){
							tbl.deleteRow(lastRow - 1);
						}
					}
				</script>
			</form>
		</div>
	</div>
</div>
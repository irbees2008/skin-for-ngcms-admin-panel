<style type="text/css">
.CodeMirror {
  font-family: monospace;
  height: 100%!important;
  width: 100%!important;
}
.menu-toggle {
  display: none;
cursor: pointer;
}
@media (min-width: 960px) {
	.fileTreeSelector {
		display: block;
	}
	.CodeMirror {
		display: block;
	}
}
@media (max-width: 960px) {
.menu-toggle {
  display: block;}

}
.menu-toggle:hover {
background-color: #111;
  color: #fff;
  text-decoration: none;
}

</style>
<script type="text/javascript">
$(document).ready( function() {
	$('.menu-toggle').click(function(){
		if ($("#fileTreeSelector").css("display") == "none") {
			$("#fileTreeSelector").css("display", "block");
			$(".CodeMirror").css("display", "none");
		}else{
			$("#fileTreeSelector").css("display", "none");
			$(".CodeMirror").css("display", "block");
		}
	});
});
</script>

<h2 class="content-head">{{ lang.templates['title'] }}</h2>

<script>

function _creattpl(){
	var creattpl  = prompt('������� �������� �����. ��������, \n\n\my-first.tpl ��� css/my-custom.css\n', '');
	if (!creattpl) {
		ngNotifyWindow('�������� �������������', 'RESULT');
		return;
	} else if (creattpl.replace(/\s+/g, '')=='' || creattpl=='') {
		ngNotifyWindow('������ ������ ������', 'RESULT');
		return;
	} else if (!creattpl.match(/^[a-zA-Z0-9\.\_\-\/]+$/g) || creattpl==' ') {
		ngNotifyWindow('������� ������������ ��� �����', 'RESULT');
		return;
	}else{
		ngShowLoading();
		var sc=document.createElement("SCRIPT");
		sc.src='{{ skins_url }}/index.php?creattpl='+ngTemplateName+'/'+creattpl;
		document.body.appendChild(sc);
	}
}

function _deltpl(){
	if (!ngFileName) {
		ngNotifyWindow('�� �� ������� ����.', 'RESULT');
	}else{
		if (confirm('������� ���� '+ngTemplateName+'/'+ngFileName+'?')) {
			ngShowLoading();
			var sc=document.createElement("SCRIPT");
			sc.src='{{ skins_url }}/inc/functions.php?deltpl='+ngTemplateName+'/'+ngFileName;
			document.body.appendChild(sc);
		} else {
			//alert("�� ������ ������ ������");
		}
	}
}

function MyCallback(val){
ngNotifyWindow(val, 'RESULT');
ngHideLoading();
submitTemplateSelector();
}

</script>
		<div class="content-nav clear">
			<form name="selectForm" id="selectForm">
				<dl class="fl"><dt>
					<input class="navbutton active" type="button" onclick="$('#selectTypeTemplate').attr('checked', 'checked');submitTemplateSelector();" value="������� �����" />
				</dt><dd>
					<select onchange="$('#selectTypeTemplate').attr('checked', 'checked');submitTemplateSelector();" name="selectTemplate" id="selectTemplate">{% for st in siteTemplates %}<option value="{{ st.name }}">{{ st.name }} ({{ st.title }})</option>{% endfor %}</select>
				</dd></dl>
				<dl class="fl"><dt>
					<input class="navbutton" type="button" onclick="$('#selectTypePlugin').attr('checked', 'checked');submitTemplateSelector();" value="������� ��������" />
				</dt><dd>
					<input class="navbutton" type="button"  onclick="window.open('http://templates.ngcms.ru/')" value="{{ lang['download_templates'] }}" />
				</dd></dl>
				<div style="display: none;">
					<input id="selectTypeTemplate" type="radio" name="selectType" value="template" checked="checked" />
					<input id="selectTypePlugin" type="radio" name="selectType" value="plugin" />
				</div>
			</form>
		</div>
	<div style="background-color: #E0E0A0;" class="clear">
		<span style="padding: 4px 8px;" class="menu-toggle fr" onclick="/*$('#fileTreeSelector').css('width','100%');$('#fileEditorSelector').css('width','100%');*/"><i class="fa fa-list"></i></span>
		<!--span style="padding: 4px 8px;" class="menu-toggle fr" onclick="$('.CodeMirror').addClass('CodeMirror-fullscreen')"><i class="fa fa-arrows-alt"></i></span-->
		<div style="padding: 4px 0;">�������������� ������� <span id="templateNameArea">�����: <b>default</b></span></div>
		
	</div>
	<div id="fileEditorInfo" class="file-editor-info">&nbsp;</div>
<div class="content clear">
	<!-- BLOCK TEMPLATES -->


	<div id="fileEditorContainer" class="content-main-right" style="height: 500px; padding: 0;">
		<div id="imageViewContainer" style="display: none; height: 100%; vertical-align: middle;"></div>
		<textarea id="fileEditorSelector" wrap="off" style="height: 100%; margin: 0; border-radius: 0;">*** EDITOR ***</textarea>
		
	</div>

	<div id="fileTreeSelector" class="fileTreeSelector content-sidebar-left" onclick="alert(ngFileName);">TEST CONTENT</div>
	
</div>
	<div id="fileEditorButtonLine" class="content-footer-right clear">
		<!--input class="fl" type="button" value="������� ����" onclick="_creattpl()"/>
		<input style="display: none;" class="fl button-del-tpl" type="button" value="������� ����" onclick="_deltpl()"/-->
		<input class="fr" type="button" value="��������� ����" onclick="submitTemplateEdit();" />
	</div>
	
<link rel="stylesheet" href="{{ home }}/lib/codemirror/codemirror.css">
<script type="text/javascript" src="{{ home }}/lib/codemirror/codemirror.js"></script>

<script type="text/javascript" src="{{ home_url }}/lib/ngFileTree.js"></script>
<link rel="stylesheet" href="{{ home_url }}/lib/ngFileTree.css" type="text/css" media="screen" />
<script type="text/javascript" language="javascript">
var ngTemplateName = 'default';
var ngFileName = '';
var ngFileType = '';
var ngFileContent = '';
var ngFileTreeParams = { root: '/', script: '/engine/rpc.php', securityToken : '{{ token }}', templateName : ngTemplateName };

var ngFileTreeFunc = function(file) {
        ngFileName = file;
        ngShowLoading();
		$.post('/engine/rpc.php', { json : 1, methodName : 'admin.templates.getFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : file, token : '{{ token }}' }) }, function(data) {
			ngHideLoading();
			// Try to decode incoming data
			try {
				resTX = eval('('+data+')');
			} catch (err) { alert('Error parsing JSON output (mod=templates). Result: '+resTX.response); }
			if (!resTX['status']) {
				ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], 'ERROR');
			}

			ngFileContent = '';
			ngFileType = resTX['type'];

			$('#fileEditorInfo').html('��� �����: <b>'+ngFileName+'</b> ������: <b>'+formatSize(resTX['size'])+'</b> ���� ���������: <b>'+resTX['lastChange']+'</b> '/*+((ngFileType == 'image')?'������ �����������: <b>'+resTX['imgsize']+'</b>':' ')*/);	
			
			$(".button-del-tpl").css("display", "block");
			
			var mq = window.matchMedia( "(max-width: 960px)" );
			if (mq.matches) {
				$("#fileTreeSelector").css("display", "none");
			}
			else {
				// window width is less than 500px
			}

			if (resTX['type'] == 'image') {
				document.getElementById('imageViewContainer').style.display = 'block';
				document.getElementById('fileEditorSelector').style.display = 'none';
				$('#imageViewContainer').html(resTX['content']);
			} else {
				document.getElementById('imageViewContainer').style.display = 'none';
				document.getElementById('fileEditorSelector').style.display = 'block';
				$('#fileEditorSelector').val(resTX['content']);

				// Remove previous codemirror (if installed)
				$(".CodeMirror").remove();	
							
				// Install codemirror
				var edField = $('#fileEditorSelector');
				var eW = edField.width();
				var eH = edField.height();			    
				
				var tmode;								
				if (ngFileName.indexOf(".ini") > 0) {tmode = "text/x-ini"};
				if (ngFileName.indexOf(".tpl") > 0) {tmode = "text/html"};
				if (ngFileName.indexOf(".css") > 0) {tmode = "text/css"};
				if (ngFileName.indexOf(".js") > 0) {tmode = "javascript"};				
						
				var cm = CodeMirror.fromTextArea(
					document.getElementById('fileEditorSelector'), {
				                lineNumbers: true,
				                mode: tmode,							
				       //         lineWrapping: true,
				                styleActiveLine: true,
				                tabMode: "indent",
				                extraKeys: {
				                	"F11": function(cm) {cm.setOption("fullScreen", !cm.getOption("fullScreen"));},
				                	"Esc": function(cm) {if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);}
				                }

				});
				cm.setSize(eW, eH);
				cm.on("change", function(cm) {
					$("#fileEditorSelector").val(cm.getValue());
				});

				ngFileContent = resTX['content'];
			}
		}, "text").error(function() { ngHideLoading(); ngNotifyWindow('HTTP error during request', 'ERROR'); $(".button-del-tpl").css("display", "none"); });
}

function submitTemplateSelector() {
	var selectMode		= $('input[name=selectType]:checked', '#selectForm').val();
	var selectTemplate	= $('[name=selectTemplate]', '#selectForm').val();

	$('#fileEditorInfo').html('');
	$('#imageViewContainer').html('');
	$('#fileEditorSelector').val('');

	ngFileName = '';

	if (selectMode == 'template') {
		ngTemplateName = selectTemplate;
		ngFileTreeParams['templateName'] = ngTemplateName;

		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' �����: <b>'+ngTemplateName+'</b>');
	} else {
		ngTemplateName = '#plugins';
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' <b>�������</b>');
	}
	
	$("#fileTreeSelector").css("display", "block");
}

function submitTemplateEdit() {
	var editedContent = $('#fileEditorSelector').val();

	ngShowLoading();
	$.post('/engine/rpc.php', { json : 1, methodName : 'admin.templates.updateFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : ngFileName, token : '{{ token }}', 'content' : editedContent }) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { alert('Error parsing JSON output. Result: '+linkTX.response); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], 'ERROR');
		} else {
			ngNotifyWindow(resTX['content'], 'RESULT');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('HTTP error during request', 'ERROR'); });


//	ngNotifyWindow('Test MSG', 'Test Title');
}

$(document).ready( function() {
    $('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
});

document.onkeydown = function(e) {
  e = e || event;

  if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
    submitTemplateEdit();
    return false;
  }

  if (e.keyCode == 122) {
    if ($('.CodeMirror-fullscreen').length != 0) {
		$(".navbar").css("z-index", "0");
		$("#fileTreeSelector").css("display", "none");
	}else{
		$(".navbar").css("z-index", "9990");
		$("#fileTreeSelector").css("display", "block");
	}
	return false;
  }
}
</script>
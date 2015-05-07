<h2 class="content-head">{{ lang.templates['title'] }}</h2>

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
<div class="tabs clear">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		
		<li class="active drop-down-enter">
			<span>Шаблоны сайта</span>
			<span class="fa fa-caret-down"></span>
			<div class="drop-down">
			{% for st in siteTemplates %}
				<span onclick="submitTemplateSelector('template', '{{ st.name }}');$('.drop-down').hide();">{{ st.name }} ({{ st.title }})</span>
			{% endfor %}
	</div>
		</li>
		<li>
			<span onclick="submitTemplateSelector('plugin', '{{ st.name }}');">Шаблоны плагинов</span>
		</li>
		<li onclick="window.open('http://templates.ngcms.ru/'); $(this).removeClass();">{{ lang['download_templates'] }}</li>
	</ul>

<script type="text/javascript">$('.drop-down-enter').hover(function () {$('.drop-down').show();}, function () {$('.drop-down').hide();} );$('.drop-down').hover(function () {$('.drop-down').show();}, function () {$('.drop-down').hide();} )</script>
	<style type="text/css">
	.fa-caret-down {margin-left: 18px;}
.drop-down {
  display: none;
  margin: 0;
  padding: 0;
  background: #fff;
  left: 0;
  border: 1px solid #c8c8c8;
  border-bottom: 0;
  position: absolute;
  z-index: 2000;
}
.drop-down span {
  border-bottom: 1px solid #c8c8c8;
  padding: 0px 6px;
  cursor: pointer;
  display: block;
  color: #444;
}
.drop-down span:hover {
  color: #800;
}
</style>
	<!-- /Navigation bar -->

	<div style="background-color: #E0E0A0;" class="clear">
		<span style="padding: 4px 8px;" class="menu-toggle fr" onclick="/*$('#fileTreeSelector').css('width','100%');$('#fileEditorSelector').css('width','100%');*/"><i class="fa fa-list"></i></span>
		<!--span style="padding: 4px 8px;" class="menu-toggle fr" onclick="$('.CodeMirror').addClass('CodeMirror-fullscreen')"><i class="fa fa-arrows-alt"></i></span-->
		<div style="padding: 4px 0;">Редактирование шаблона <span id="templateNameArea">сайта: <b>default</b></span></div>
		
	</div>
	<div id="fileEditorInfo" class="file-editor-info">Файл не выбран</div>
	
<div class="content clear">
	<!-- BLOCK TEMPLATES -->


	<div id="fileEditorContainer" class="content-main-right" style="height: 500px; padding: 0;">
		<div id="imageViewContainer" style="display: none; height: 100%; vertical-align: middle;"></div>
		<textarea id="fileEditorSelector" wrap="off" style="height: 100%; margin: 0; border-radius: 0;">*** EDITOR ***</textarea>
		
	</div>

	<div id="fileTreeSelector" class="fileTreeSelector content-sidebar-left" onclick="alert(ngFileName);">TEST CONTENT</div>
	
</div>
</div>
	<div id="fileEditorButtonLine" class="content-footer-right clear">
		<input class="fl" type="button" value="Создать файл" onclick="_creattpl()"/>
		<input style="display: none;" class="fl button-del-tpl" type="button" value="Удалить файл" onclick="_deltpl()"/>
		<input class="button-success fr" title="Ctrl+S" type="button" value="Сохранить файл" onclick="submitTemplateEdit();" />
	</div>
	
<link rel="stylesheet" href="{{ home }}/lib/codemirror/codemirror.css">
<script type="text/javascript" src="{{ home }}/lib/codemirror/codemirror.js"></script>


<script type="text/javascript">
$(document).ready( function() {
	$('.menu-toggle').click(function(){
			$("#fileTreeSelector").toggle();
			$(".CodeMirror").toggle();
	});
});

function _creattpl(){
//alert('{{ skins_url }}/inc/functions.php');
	var creattpl  = prompt('Введите название файла. Например, \n\n\my-first.tpl или css/my-custom.css\n', '');
	if (!creattpl) {
		ngNotifyWindow('Отменено пользователем', 'RESULT');
		return;
	} else if (creattpl.replace(/\s+/g, '')=='' || creattpl=='') {
		ngNotifyWindow('Задана пустая строка', 'RESULT');
		return;
	} else if (!creattpl.match(/^[a-zA-Z0-9\.\_\-\/]+$/g) || creattpl==' ') {
		ngNotifyWindow('Введено некорректное имя файла', 'RESULT');
		return;
	}else{
		ngShowLoading();
		var sc=document.createElement("SCRIPT");
		sc.src='{{ skins_url }}/inc/functions.php?creattpl='+ngTemplateName+'/'+creattpl;
		document.body.appendChild(sc);
		
	}
}

function _deltpl(){
	if (!ngFileName) {
		ngNotifyWindow('Вы не выбрали файл.', 'RESULT');
	}else{
		if (confirm('Удалить файл '+ngTemplateName+'/'+ngFileName+'?')) {
			ngShowLoading();
			var sc=document.createElement("SCRIPT");
			sc.src='{{ skins_url }}/inc/functions.php?deltpl='+ngTemplateName+'/'+ngFileName;
			document.body.appendChild(sc);
		} else {
			//alert("Вы нажали кнопку отмена");
		}
	}
}

function MyCallback(val){
ngNotifyWindow(val, 'RESULT');
ngHideLoading();
submitTemplateSelector();
}

</script>

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

			$('#fileEditorInfo').html('Имя файла: <b>'+ngFileName+'</b> Размер: <b>'+formatSize(resTX['size'])+'</b> Дата изменения: <b>'+resTX['lastChange']+'</b> '/*+((ngFileType == 'image')?'Размер изображения: <b>'+resTX['imgsize']+'</b>':' ')*/);	
			
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

function submitTemplateSelector(selectMode, selectTemplate) {
	/*var selectMode		= $('input[name=selectType]:checked', '#selectForm').val();
	var selectTemplate	= $('[name=selectTemplate]', '#selectForm').val();*/

	$('#fileEditorInfo').html('');
	$('#imageViewContainer').html('');
	$('#fileEditorSelector').val('');

	ngFileName = '';

	if (selectMode == 'template') {
		ngTemplateName = selectTemplate;
		ngFileTreeParams['templateName'] = ngTemplateName;

		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' сайта: <b>'+ngTemplateName+'</b>');
	} else {
		ngTemplateName = '#plugins';
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' <b>плагины</b>');
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
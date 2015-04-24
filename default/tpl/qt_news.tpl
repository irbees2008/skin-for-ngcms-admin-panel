<span id="save_area" style="display: block;"></span>
<div id="tags" class="tags-box">
	<span onclick="insertext('[b]','[/b]', {area})" title='{l_tags.bold}'><i class="fa fa-bold"></i></span>
	<span onclick="insertext('[u]','[/u]', {area})" title='{l_tags.underline}'><i class="fa fa-underline"></i></span>
	<span onclick="insertext('[i]','[/i]', {area})" title='{l_tags.italic}'><i class="fa fa-italic"></i></span>
	<span onclick="insertext('[s]','[/s]', {area})" title='{l_tags.crossline}'><i class="fa fa-strikethrough"></i></span>
	|
	<span onclick="insertext('[left]','[/left]', {area})" title='{l_tags.left}'><i class="fa fa-align-left"></i></span>
	<span onclick="insertext('[center]','[/center]', {area})" title='{l_tags.center}'><i class="fa fa-align-center"></i></span>
	<span onclick="insertext('[right]','[/right]', {area})" title='{l_tags.right}'><i class="fa fa-align-right"></i></span>
	<span onclick="insertext('[justify]','[/justify]', {area})" title='{l_tags.justify}'><i class="fa fa-align-justify"></i></span>
	|
	<span onclick="insertext('[ul]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ul]','', {area})" title='{l_tags.bulllist}'><i class="fa fa-list-ul"></i></span>
	<span onclick="insertext('[ol]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ol]','', {area})" title='{l_tags.numlist}'><i class="fa fa-list-ol"></i></span>
	|
	<span onclick="insertext('[spoiler]','[/spoiler]', {area})" title='{l_tags.spoiler}'><i class="fa fa-list-alt"></i></span>
	<span onclick="insertext('[p]','[/p]', {area})" title='{l_tags.paragraph}'><i class="fa fa-paragraph"></i></span>
	<span onclick="insertext('[quote]','[/quote]', {area})" title='{l_tags.comment}'><i class="fa fa-quote-left"></i></span>
	<span onclick="insertext('[code]','[/code]', {area})" title='{l_tags.code}'><i class="fa fa-code"></i></span>
	<span onclick="insertext('[hide]','[/hide]', {area})" title='{l_tags.hide}'><i class="fa fa-shield"></i></span>
	|
	<span class="tags_email" title='{l_tags.email}'><i class="fa fa-envelope-o"></i></span>
	<span class="tags_url" title='{l_tags.link}'><i class="fa fa-link"></i></span>
	<span class="tags_img" title='{l_tags.imagelink}'><i class="fa fa-picture-o"></i></span>
	|
	<span onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=files&amp;ifield='+{area}, '_Addfile', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addfile" title='{l_tags.file}'><i class="fa fa-file-text-o"></i></span> 
	<span onclick="get_image_list('img_popup', 12, 1);" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></span>
	<!--<span onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=images&amp;ifield='+{area}, '_Addimage', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addimage" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></span>-->
	|
	<span onclick="insertext('<!--nextpage-->','', {area})" title='{l_tags.nextpage}'><i class="fa fa-files-o"></i></span>
	|
	<span onclick="insertext('<!--more-->','', {area})" title='{l_tags.more}'><i class="fa fa-ellipsis-h"></i></span>
	<span onclick="$('#fullwidth').toggleClass('news-content-full');" class="fr" title="Развернуть на весь экран (F11)"><i class="fa fa-arrows-alt"></i></span>
	<span onclick="var form = document.getElementById('postForm');form.submit();return false;" class="fr" title="Сохранить (Ctrl+S)"><i class="fa fa-save"></i></span>
	
<script type="text/javascript"> 
$('.tags_url').on('click', function(){
	showPopupDiv('popup_url', 'Введите адрес ссылки', '<label class="w_100">Адрес ссылки:<input class="w_100" id="popup1" type="url" /></label><label class="w_100">Текст ссылки:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[url=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/url]\', {area});hidePopupDiv()">Вставить</span>');
});
$('.tags_email').on('click', function(){
	showPopupDiv('popup_url', 'Введите адрес электронной почты', '<label class="w_100">Электронная почта:<input class="w_100" id="popup1" type="email" /></label><label class="w_100">Текст ссылки:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[email=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/email]\', {area});hidePopupDiv()">Вставить</span>');
});
$('.tags_img').on('click', function(){
	showPopupDiv('popup_url', 'Введите ссылку на изображение', '<label class="w_100">Адрес ссылки:<input class="w_100" id="popup1" type="url" /></label><label class="w_100">Текст изображения:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[img=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/img]\', {area});hidePopupDiv()">Вставить</span>');
});
</script>
<style type="text/css">
.darkScreen {
  background: #000;
  width: 100%;
  height: 100%;
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1100 !important;
  opacity: .4;
  filter: alpha(opacity=40);
  cursor: pointer;
}

.div_popup {
  top: 50px;
  left: 50%;
  width: 50%;
  max-width: 760px;
  min-width: 160px;
  height: auto;
  position: absolute;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  transform: translateX(-50%);
  z-index: 1150;
text-align: center;
  color: #fff;
  background: #333;
  /* background: #109181;*/
  box-shadow: 0px 0px 20px #000;
}
.list-image {
  text-align: center;
}
.popup-title {
  margin: 0;
  padding: 0.4em;
  font-size: 1.4em;
  background: rgba(0,0,0,0.1);
}
.popup-close {
  float: right;
  cursor: pointer;
  padding: 12px 16px;
}
.popup-body {
  padding: 16px;
  text-align: left;
}
.popup-footer {
  opacity: 0.8;
  background: rgba(0,0,0,0.15);
}
.popup-footer span {
  display: inline-block;
  padding: 4px 16px;
  color: #fff;
  cursor: pointer;
  opacity: 0.8;
  background: rgba(0,0,0,0.15);
  margin: 16px 4px;
}
.popup-footer span:hover {
	background: rgba(0,0,0,0.8);
}

.div_popup img {
  width: 100%;
  cursor: pointer;
  min-height: 140px;
  -webkit-transition: .4s;
  -moz-transition: .4s;
  transition: .4s;
}

.img-descr {
  position: absolute;
  height: 100%;
  top: 0;
  bottom: 0;
  width: 100%;
  background: #333;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-transform: rotateX(-70deg);
  -moz-transform: rotateX(-70deg);
  -ms-transform: rotateX(-70deg);
  transform: rotateX(-70deg);
  -webkit-transition: .4s;
  -moz-transition: .4s;
  transition: .4s;
  opacity: 0;
}
.img-link:hover .img-descr {
-webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  -ms-transform: rotateX(0deg);
  transform: rotateX(0deg);
  opacity: .8;
  -webkit-transition: .4s;
  -moz-transition: .4s;
  transition: .4s;
}

.img-descr span {
  top: 50%;
  left: 0;
  right: 0;
  position: absolute;
  transform: translateY(-50%);
}
.div_popup ul {
  margin: 0;
  padding: 0;
}
.img-link {
  width: 140px;
  height: 140px;
  overflow: hidden;
  margin: 6px 8px;
  display: inline-block;
  vertical-align: top;
  position: relative;
}
.img-link a {
  color: #fff;
  text-decoration: underline;
  position: absolute;
  width: 100%;
  top: 0;
  left: 0;
  z-index: 8;
  padding: 4px;
  background: rgba(34, 34, 34, 0.88);
  -webkit-transform: rotateX(-70deg);
  -moz-transform: rotateX(-70deg);
  -ms-transform: rotateX(-70deg);
  transform: rotateX(-70deg);
  -webkit-transition: .4s;
  -moz-transition: .4s;
  transition: .4s;
  opacity: 0;
}

.img-link:hover a {
  -webkit-transform: rotateX(0);
  -moz-transform: rotateX(0);
  -ms-transform: rotateX(0);
  transform: rotateX(0);
  -webkit-transition: .4s;
  -moz-transition: .4s;
  transition: .4s;
  opacity: 1;
}

.is-loading img {opacity: 0;}

li.is-loading { 
    background: rgba(0, 0, 0, 1) url("http://websketches.ru/assets/files/blog/jquery_zagruzka_izobrajeniy/img/loading.gif") no-repeat center center;
}
li.is-broken {
    background: #BE3730 url("http://websketches.ru/assets/files/blog/jquery_zagruzka_izobrajeniy/img/broken.png") no-repeat center center;
}

@media only screen and (max-width: 960px), (min-device-width: 768px) and (max-device-width: 960px)  {
	.div_popup { width: 80%; }
	.img-link { width: 22%; }
}
@media only screen and (max-width: 768px), (min-device-width: 480px) and (max-device-width: 768px)  {
	.div_popup { width: 80%; }
	.img-link { width: 45%; }
}
@media only screen and (max-width: 480px), (min-device-width: 320px) and (max-device-width: 480px)  {
	.img-link { margin: 4px 0; width: 100%; }
}
@media only screen and (max-width: 320px), (min-device-width: 240px) and (max-device-width: 320px)  {
	.img-link { margin: 4px 0; width: 100%; }
}
@media only screen and (max-width: 240px), (max-device-width: 240px)  {
	.img-link { width: 100%; }
}
</style>

<div style="display: none;" class="div_popup" id="img_popup">
	<div class="popup-close" title="Закрыть окно" onclick="alert('Закрыто!');"><i class="fa fa-times"></i></div>
	<div class="popup-title">
		Заголовок
	</div>
	<div class="popup-body">
		<i class="fa fa-spinner fa-pulse"></i>
	</div>
	<div class="popup-footer">
		<span class="img-back" title="Стрелочка влево">Назад</span>
		<span class="img-next" title="Стрелочка вправо">Далее</span>
	</div>
</div>

</div>
<script type="text/javascript">
document.onkeydown = function(e) {
	e = e || event;

	if (e.keyCode == 39) {
		$('.img-next').click();
		return false;
	}
	if (e.keyCode == 37) {
		$('.img-back').click();
		return false;
	}
}
function showPopupDiv(id, title, body, footer) {
	$('#boxesModal').remove();
	var $modal = $('<div class="darkScreen" id="boxesModal" onclick="hidePopupDiv()"></div>');
	$("body").prepend($modal);
	$modal.css({'zIndex':900, 'cursor' : 'pointer'}).fadeIn();

	$("body").append('<div id="'+id+'" class="div_popup">\
		<div class="popup-close" title="Закрыть окно" onclick="hidePopupDiv();"><i class="fa fa-times"></i></div>\
		<div class="popup-title">' + title + '</div>\
		<div class="popup-body">' + body + '</div>\
		<div class="popup-footer">' + footer + '</div>').fadeIn();
}

function hidePopupDiv(){
	$('.div_popup')
	.fadeOut()
	.remove();
	$('#boxesModal').remove();
}

/* **************** ВСТАВКА изображений ****************** */
function insert_image(text, area) {
	var win = window;
	var form = win.document.forms['form'];
	try {
	 var xarea = win.document.forms['DATA_tmp_storage'].area.value;
	 if (xarea != '') area = xarea;
	} catch(err) {;}
	var control = win.document.getElementById(area);
	                  
	//control.focus();

	// IE
	if (win.selection && win.selection.createRange){
		sel = win.selection.createRange();
		sel.text = text = sel.text;
	} else
	// Mozilla
	if (control.selectionStart || control.selectionStart == "0"){
		var startPos = control.selectionStart;
		var endPos = control.selectionEnd;

		control.value = control.value.substring(0, startPos) + text + control.value.substring(startPos, control.value.length);
		//control.selectionStart = msgfield.selectionEnd = endPos + open.length + close.length;
	} else {
		control.value += text;
	}
	control.focus();
}
/* Получение списка изображений */
function get_image_list(id, npp, page) {
	$.post('?mod=images&action=list&npp=' + npp + '&page=' + page, function (r) {
		var qw = $('.img-src a', r).attr('href');
		if (!qw) {
			$('.img-next').hide();
			$('#'+id).html('<b>Нет загруженных изображений!</b><br />');
			return;
		} else {
			setTimeout(function () {
				var popup_body = '';
				var snum = '0';
				$(".img-src a", r).each(function () {
					snum++;
					var hrf = $(this).attr('href');
					var tr = $(this).closest('tr');
					var title = $('.img-title', tr).text();
					var width = $('.img-width', tr).text();
					var height = $('.img-height', tr).text();
					var size = $('.img-size', tr).text();
					//itxt += '<li><img width="140" src="' + hrf +'" title="' + title + '" onclick="openImgPopup(\''+ hrf + '\'); return false;" /></li>';
					if (size=='-') {
						popup_body += '<li class="is-broken img-link"><a href="' + hrf + '" target="_blank">' + title + '</a><div class="img-descr"><span>Изображение не найдено!</span></div></li>';
					} else {
						popup_body += '<li class="is-loading img-link">\
						<a href="javascript:;" onclick="\
							insert_image(\'[img=&#34;' + hrf + '&#34; width=&#34;' + width + '&#34; height=&#34;' + height + '&#34; align=&#34;left&#34;]' + title + ' (' + size + ')' + '[/img]\', \'' + currentInputAreaID + '\');\
							$(this).closest(\'li\').children(\'.img-descr\').children(\'span\').html(\'<b>Изображение вставлено</b>\');">Вставить</a>\
						<img src="\
							' + hrf +'" alt="' + title + '" \
							onload="\
							$(this).closest(\'li\').removeClass(\'is-loading\');\
							$(this).css(\'opacity\',\'1\').fadeIn();" \
						/>\
						<div class="img-descr">\
							<span>\
							' + title + '<br />' + width + 'x' + height + '<br />' + size +'</span>\
							</div>\
						</li>';
					}
				});
				
				showPopupDiv(id, 'Выберите изображение для вставки', '<ul class="clear list-image">' + popup_body + '</ul>', '<span class="img-back" title="Стрелочка влево">Назад</span><span class="img-next" title="Стрелочка вправо">Далее</span>');
				
				if (page<2) {$('.img-back').hide();} else {var page_back = page - 1;$('.img-back').attr('onclick','$(\'#scrollup\').click(); get_image_list(\'' + id + '\', ' + npp + ', ' + page_back + ');');}

				if (snum<npp || page==0) {$('.img-next').hide();} else {page++;	$('.img-next').attr('onclick','$(\'#scrollup\').click(); get_image_list(\'' + id + '\', ' + npp + ', ' + page + ');');}
				
			}, 101);
		}
	});
}
</script>
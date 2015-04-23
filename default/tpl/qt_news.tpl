<span id="save_area" style="display: block;"></span>
<div id="tags" class="tags-box">
	<a onclick="insertext('[b]','[/b]', {area})" title='{l_tags.bold}'><i class="fa fa-bold"></i></a>
	<a onclick="insertext('[u]','[/u]', {area})" title='{l_tags.underline}'><i class="fa fa-underline"></i></a>
	<a onclick="insertext('[i]','[/i]', {area})" title='{l_tags.italic}'><i class="fa fa-italic"></i></a>
	<a onclick="insertext('[s]','[/s]', {area})" title='{l_tags.crossline}'><i class="fa fa-strikethrough"></i></a>
	|
	<a onclick="insertext('[left]','[/left]', {area})" title='{l_tags.left}'><i class="fa fa-align-left"></i></a>
	<a onclick="insertext('[center]','[/center]', {area})" title='{l_tags.center}'><i class="fa fa-align-center"></i></a>
	<a onclick="insertext('[right]','[/right]', {area})" title='{l_tags.right}'><i class="fa fa-align-right"></i></a>
	<a onclick="insertext('[justify]','[/justify]', {area})" title='{l_tags.justify}'><i class="fa fa-align-justify"></i></a>
	|
	<a onclick="insertext('[ul]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ul]','', {area})" title='{l_tags.bulllist}'><i class="fa fa-list-ul"></i></a>
	<a onclick="insertext('[ol]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ol]','', {area})" title='{l_tags.numlist}'><i class="fa fa-list-ol"></i></a>
	|
	<a onclick="insertext('[spoiler]','[/spoiler]', {area})" title='{l_tags.spoiler}'><i class="fa fa-list-alt"></i></a>
	<a onclick="insertext('[p]','[/p]', {area})" title='{l_tags.paragraph}'><i class="fa fa-paragraph"></i></a>
	<a onclick="insertext('[quote]','[/quote]', {area})" title='{l_tags.comment}'><i class="fa fa-quote-left"></i></a>
	<!--a onclick="insertext('[acronym=]','[/acronym]', {area})" title='{l_tags.acronym}'><img src="{skins_url}/tags/acronym.gif" width="16" height="16" alt="{l_tags.acronym}" /></a-->
	<a onclick="insertext('[code]','[/code]', {area})" title='{l_tags.code}'><i class="fa fa-code"></i></a>
	<a onclick="insertext('[hide]','[/hide]', {area})" title='{l_tags.hide}'><i class="fa fa-shield"></i></a>
	<a onclick="insertext('[email]','[/email]', {area})" title='{l_tags.email}'><i class="fa fa-envelope-o"></i></a>
	|
	<a onclick="insertext('[url]','[/url]', {area})" title='{l_tags.link}'><i class="fa fa-link"></i></a>
	<a onclick="insertext('[img]','[/img]', {area})" title='{l_tags.imagelink}'><i class="fa fa-picture-o"></i></a>
	|
	<a onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=files&amp;ifield='+{area}, '_Addfile', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addfile" title='{l_tags.file}'><i class="fa fa-file-text-o"></i></a> 
	
	<a href="#" class="" onclick="showPopupDiv('img_popup');get_image_list('img_popup', 12, 1);" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></a>
	
	<!--<a onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=images&amp;ifield='+{area}, '_Addimage', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addimage" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></a>-->
	|
	<a onclick="insertext('<!--nextpage-->','', {area})" title='{l_tags.nextpage}'><i class="fa fa-files-o"></i></a>
	|
	<a onclick="insertext('<!--more-->','', {area})" title='{l_tags.more}'><i class="fa fa-ellipsis-h"></i></a>
	<a title='Развернуть на весь экран' class="fr"><i class="fa fa-arrows-alt"></i></a>

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
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  backface-visibility: hidden;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  transform: translateX(-50%);
  z-index: 1150;
  text-align: center;
  background: #fff;
  padding: 8px 16px;
}

.popup-title {
  font-size: 120%;
}

.div_popup ul {
  margin: 0;
  padding: 0;
}
.div_popup li {
  width: 140px;
  max-height: 140px;
  overflow: hidden;
  margin: 4px 8px;
  display: inline-block;
  vertical-align: top;
  position: relative;
}
.div_popup img {
  width: 100%;
  cursor: pointer;
  min-height: 140px;
}
.img-descr {
  position: absolute;
  height: 100%;
  top: 0;
  bottom: 0;
  width: 100%;
  background: rgba(70, 201, 148, 0.5);
  opacity: 0;
  transition: .4s;
}
.img-link:hover .img-descr {
  opacity: 1;
  transition: .4s;
}
.img-descr span {
  top: 50%;
  left: 0;
  right: 0;
  position: absolute;
  transform: translateY(-50%);
}
a.img-link:hover {
color: #fff;
}






@media only screen and (max-width: 960px), (min-device-width: 768px) and (max-device-width: 960px)  {
	.div_popup { width: 80%; }
	.div_popup li { width: 22%; }
}
@media only screen and (max-width: 768px), (min-device-width: 480px) and (max-device-width: 768px)  {
	.div_popup { width: 80%; }
	.div_popup li { width: 45%; }
}
@media only screen and (max-width: 480px), (min-device-width: 320px) and (max-device-width: 480px)  {

	.div_popup li { margin: 4px 0; width: 100%; }
}
@media only screen and (max-width: 320px), (min-device-width: 240px) and (max-device-width: 320px)  {

	.div_popup li { margin: 4px 0; width: 100%; }
}
@media only screen and (max-width: 240px), (max-device-width: 240px)  {
	
	.div_popup li { width: 100%; }
}



</style>

<div style="display: none" class="div_popup">
        <div class="clear" id="img_popup"><i class="fa fa-spinner fa-pulse"></i></div>
</div>

</div>
<script type="text/javascript"> 
function showPopupDiv(id)
{
   var $modal = $('<div class="darkScreen" id="boxesModal" onclick="hidePopupDiv('+id+')"></div>');
    $("body").prepend($modal);
    $modal.css({'zIndex':900, 'cursor' : 'pointer'}).fadeIn();

    $('#'+id).hide();

    $("body").append('<div id="_'+id+'_" class="div_popup">'+$('#'+id).html()+'</div>');
    $('#'+id).remove();
    $('#_'+id+'_').attr('id', id);

}

function hidePopupDiv(id){
    $('.div_popup').hide();
    $('#boxesModal').fadeOut();
	//$('#boxesModal').remove();
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
	                  
	control.focus();

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
/*?mod=images&npp='+npp*/
/*images&action=list&npp=3&page=2*/

	$.post('?mod=images&action=list&npp=' + npp + '&page=' + page, function (r) {
		var qw = $('.img-src a', r).attr('href');
		if (!qw) {
			$('.img-next').hide();
			$('#'+id).html('<b>Нет загруженных изображений!</b><br />');
			return;
		} else {
			setTimeout(function () {
				var itxt = '';
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
					itxt += '<li><a class="img-link" href="#" onclick="insert_image(\'[img=&#34;' + hrf + '&#34; width=&#34;' + width + '&#34; height=&#34;' + height + '&#34; align=&#34;left&#34;]' + title + ' (' + size + ')' + '[/img]\', \'' + currentInputAreaID + '\');"><img src="' + hrf +'" alt="' + title + '"  /><div class="img-descr"><span>' + title + '<br />' + width + 'x' + height + '<br />' + size +'</span></div></a></li>';
				});

				//alert(snum + ' -- ' + npp);
				$('#'+id).html('<div class="popup-title">Всего показано изображений: ' + snum + '</div>' + '<ul class="clear">' + itxt + '</ul>\
				<span class="fl img-back link-pseudo"><a href="#">Назад</a></span>\
				<span class="fr img-next link-pseudo"><a href="#">Далее</a></span>');
				var img_back = '';
				if (page<2) {
					$('.img-back').hide();
				} else {
					var page_back = page - 1;
					$('.img-back').html('<a href="#" onclick="get_image_list(\'' + id + '\', ' + npp + ', ' + page_back + ');">Назад</a>');
				}
				var img_next = '';
				if (snum<npp || page==0) {
					$('.img-next').hide();
				} else {
					page++;
					$('.img-next').html('<a href="#" onclick="get_image_list(\'' + id + '\', ' + npp + ', ' + page + ');">Далее</a>');
				}
			}, 101);
		}
	});
}
</script>
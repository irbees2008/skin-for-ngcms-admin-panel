$(document).ready(function(){
	
	$('body').append('<div id="scrollup" class="scrollup"><i class="fa fa-chevron-up"></i></div>');
	$(window).scroll(function () {
		if ($(this).scrollTop() != 0) {
			$('#scrollup').fadeIn();
		} else {
			$('#scrollup').fadeOut(); 
		}
	}); 
	$('#scrollup').click(function(){
		$("html, body").animate({ scrollTop: 0 }, 888);
		return false;
	});
	
	// Боковое меню
	$('.navbar-toggle').click(function () {
		$('.navbar-nav').toggleClass('slide-in');
		$('.side-body').toggleClass('body-slide-in');        
	});
	
	$('.navbar a, .navbutton').each(function () {
		var location = window.location.href;
		var link = this.href; 
		if(location == link) {
			$(this).addClass('active');
		}
	});
	
	$('.navbutton').click(function(){
		$('.navbutton').each(function () {
			$('.navbutton').removeClass('active');
		});
		$(this).addClass('active');
	});
	
	//Загрузка количества плагинов
	$('.cnt-plug-all').load('?mod=extras #cnt-plug-all');
	
	//Активация вкладок
	$('.navtab').css('display', 'none');
	$('.navtab:first').css('display', 'block');
	
	// // // Табы
	var module = document.getElementById('skin_module_name').value;
	$('ul.tabs-title').each(function(i) {
		if (module=='templates') {return false;}
		var storage = localStorage.getItem('tab' +module+ i);
		if (storage) {
		  $(this)
			.find('li').removeClass('active').eq(storage).addClass('active')
			.closest('div.tabs').find('div.tabs-content').removeClass('active').eq(storage).addClass('active');
		} else {
			$('.tabs-title li').removeClass('active');
			$('.tabs-title li:first').addClass('active');
			$('.tabs-content').removeClass('active');
			$('.tabs-content:first').addClass('active');
		}
	});
	$('ul.tabs-title').on('click', 'li', function() {
		$(this)
		.addClass('active').siblings().removeClass('active')
		.closest('div.tabs').find('div.tabs-content').removeClass('active').eq($(this).index()).addClass('active');
		if (module=='templates') {return false;}
		var ulIndex = $('ul.tabs-title').index($(this).parents('ul.tabs-title'));
		localStorage.removeItem('tab' +module+ ulIndex);
		localStorage.setItem('tab' +module+ ulIndex, $(this).index());
	});
	// // // -- Табы
	
		
	// // // Положения боксов
	//$('.content-sidebar-title').click(function(){$(this).next().toggle()});
	$('.content-sidebar-title').next().each(function(i) {
	var storage = localStorage.getItem('sidebar' +module+ i);
		if (storage) {
			//alert(storage);
			$(this).css('display', storage);
		} else {
			$(this).css('display', '');
		}
	});
	$('.content-sidebar-title').on('click', function() {
		$(this).next().toggle();
		var ulIndex = $('.content-sidebar-title').next().index($(this).next());
		//alert(ulIndex);
		localStorage.removeItem('sidebar' +module + ulIndex);
		localStorage.setItem('sidebar' +module + ulIndex, $(this).next().css('display'));
	});

	  /* Вставка тегов */
	$('.tags_url').on('click', function(){
		showPopupDiv('popup_url', 'Введите адрес ссылки', '<label class="w_100">Адрес ссылки:<input class="w_100" id="popup1" type="email" /></label><label class="w_100">Текст ссылки:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[url=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/url]\', currentInputAreaID); hidePopupDiv();">Вставить</span>');
	});
	$('.tags_email').on('click', function(){
		showPopupDiv('popup_url', 'Введите адрес электронной почты', '<label class="w_100">Электронная почта:<input class="w_100" id="popup1" type="email" /></label><label class="w_100">Текст ссылки:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[email=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/email]\', currentInputAreaID); hidePopupDiv();">Вставить</span>');
	});
	$('.tags_img').on('click', function(){
		showPopupDiv('popup_url', 'Введите ссылку на изображение', '<label class="w_100">Адрес ссылки:<input class="w_100" id="popup1" type="url" /></label><label class="w_100">Текст изображения:<input class="w_100" id="popup2" type="text" /></label>', '<span onclick="insertext(\'[img=\' + $(\'#popup1\').val() + \']\' + $(\'#popup2\').val() + \'\',\'[/img]\', currentInputAreaID); hidePopupDiv();">Вставить</span>');
	});

});
  /* **************** ВСТАВКА изображений ****************** */
function insert_image(text, area) {
	var form = document.forms['form'];
	try {
	 var xarea = document.forms['DATA_tmp_storage'].area.value;
	 if (xarea != '') area = xarea;
	} catch(err) {;}
	var control = document.getElementById(area);
	                  
	//control.focus();

	// IE
	if (document.selection && document.selection.createRange){
		sel = document.selection.createRange();
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
	$.post('/engine/admin.php?mod=images&action=list&npp=' + npp + '&page=' + page, function (r) {
		var qw = $('.img-src a', r).attr('href');
		if (!qw) {
			showPopupDiv(id, 'Выберите изображение для вставки', '<b>Нет загруженных изображений!</b>', '<span class="" title="Закрыть" onclick="hidePopupDiv();">Закрыть</span>');
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
				
				if (page<2) {$('.img-back').hide();} else {var page_back = page - 1; $('.img-back').attr('onclick','hidePopupDiv();get_image_list(\'' + id + '\', ' + npp + ', ' + page_back + ');');}

				if (snum<npp || page==0) {$('.img-next').hide();} else {page++; $('.img-next').attr('onclick','hidePopupDiv();get_image_list(\'' + id + '\', ' + npp + ', ' + page + ');');}
				
			}, 101);
		}
	});
}
/* Модальное окно */
function hidePopupDiv(){
	$('.div_popup')
	.fadeOut()
	.remove();
	$('#boxesModal').remove();
}
function showPopupDiv(id, title, body, footer) {
	$('#boxesModal').remove();
	var $modal = $('<div class="darkScreen" id="boxesModal" onclick="hidePopupDiv()"></div>');
	$("body").prepend($modal);
	$modal.css({'zIndex':9903, 'cursor' : 'pointer'}).fadeIn();

	$("body").append('<div id="'+id+'" class="div_popup" \
		style="top: ' + ($("body").scrollTop() + 50) + 'px;">\
		<div class="popup-close" title="Закрыть окно" onclick="hidePopupDiv();"><i class="fa fa-times"></i></div>\
		<div class="popup-title">' + title + '</div>\
		<div class="popup-body">' + body + '</div>\
		<div class="popup-footer">' + footer + '</div>').fadeIn();
}

//Изменение вкладок
	function ChangeOption(optn) {
		$('.navtab').css('display', 'none');
		document.getElementById(optn).style.display = (optn == optn)?"block":"none";
	}
	
	
var theme = readCookie('theme-style');
if (theme) switchtheme(theme);
function switchtheme(theme) {
	$("#default").attr("href", "skins/default/css/"+theme+".css");
	createCookie('theme-style', theme, 365);
	return false;
}
/* cookie style core */
function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}
function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
function eraseCookie(name) {
    createCookie(name,"",-1);
}

function formatSize($file_size){
    if ($file_size >= 1073741824) {
        $file_size = Math.round( $file_size / 1073741824 * 100 ) / 100 + " Гб";
    } else if ($file_size >= 1048576) {
        $file_size = Math.round( $file_size / 1048576 * 100 ) / 100 + " Мб";
    } else if ($file_size >= 1024) {
        $file_size = Math.round( $file_size / 1024 * 100 ) / 100 + " Кб";
    } else {
        $file_size = $file_size + " б";
    }
    return $file_size;
}
// считаем разрешение экрана
function findDimensions(){
	var width = 0, height = 0;
	if(window.innerWidth){
		width = window.innerWidth;
		height = window.innerHeight;
	}
	else if(document.body && document.body.clientWidth){
		width = document.body.clientWidth;
		height = document.body.clientHeight;
	}
	if(document.documentElement && document.documentElement.clientWidth){
		width = document.documentElement.clientWidth;
		height = document.documentElement.clientHeight;
	}
	var ret=new Array();
		ret['width']=width;
		ret['height']=height;
		return ret;
}

// Всплывающее изображение
function openImgPopup(text) {
	var monitor = findDimensions();
	$('#photo_popup').remove();
	$('#photo_popup_container').remove();
	html = '<div class="darkScreen" id="photo_popup" onclick="closeImgPopup();"></div>' +
			'<div class="popupNew" id="photo_popup_container" onclick="closeImgPopup();">' +
			 '<div class="popup-body">' +
			 '<img src="' + text + '" />' +
			'</div></div>';
	$("body").prepend(html);
	$("#photo_popup_container img").css({'max-height':(monitor['height'] - 100)});
	$("#photo_popup_container img").css({'max-width':(monitor['width'] - 50)});
	$("#photo_popup").fadeIn();
	$("#photo_popup_container").fadeIn();
	return false;
}
// Закрытие всплывающего окна изображения
function closeImgPopup() {
	$("#photo_popup").fadeOut();
	$("#photo_popup_container").fadeOut();
}


/*
Для input type="file"
HTML
<div class="button button-fileinput">
	<span id="spanfile1"><i class="fa fa-plus"></i> Add files...</span> <span id="spansize1"></span>
	<input type="file" name="image" id="image-con" onchange="validateFile(this, 1);">
</div>
*/

function validateFile(fileInput, setRow) {
	var fileObj, oSize, setRow;
	if (!fileInput.value) {
		document.getElementById('spanfile'+ setRow).innerHTML = '<i class="fa fa-plus"></i> Add files...';
		document.getElementById('spansize'+ setRow).innerHTML = '';
		return false;
	}
    if ( typeof ActiveXObject == "function" ) { // IE
        fileObj = (new ActiveXObject("Scripting.FileSystemObject")).getFile(fileInput.value);
    } else {
        fileObj = fileInput.files[0];
    }
	document.getElementById('spanfile'+ setRow).innerHTML = fileInput.value.replace(/.*\\(.*)/, '$1').replace(/.*\/(.*)/, '$1');
	document.getElementById('spansize'+ setRow).innerHTML = formatSize(fileObj.size);
	return true;
}
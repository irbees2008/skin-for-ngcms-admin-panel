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
	
	//
	$('.content-sidebar-title').click(function(){$(this).next().toggle()});
	
	// // // Табы
	$('ul.tabs-title').each(function(i) {
		var storage = localStorage.getItem('tab' +document.getElementById('skin_module_name').value+ i);
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
    var ulIndex = $('ul.tabs-title').index($(this).parents('ul.tabs-title'));
    localStorage.removeItem('tab' +document.getElementById('skin_module_name').value+ ulIndex);
    localStorage.setItem('tab' +document.getElementById('skin_module_name').value+ ulIndex, $(this).index());
  });
  // // // -- Табы
});

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
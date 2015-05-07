<span id="save_area" style="display: block;"></span>
<div id="tags" class="tags-box clear">
	<span onclick="insertext('[b]','[/b]', {area})" title='{l_tags.bold}'><i class="fa fa-bold"></i></span>
	<span onclick="insertext('[u]','[/u]', {area})" title='{l_tags.underline}'><i class="fa fa-underline"></i></span>
	<span onclick="insertext('[i]','[/i]', {area})" title='{l_tags.italic}'><i class="fa fa-italic"></i></span>
	<span onclick="insertext('[s]','[/s]', {area})" title='{l_tags.crossline}'><i class="fa fa-strikethrough"></i></span>
	<span>|</span>
	<span onclick="insertext('[left]','[/left]', {area})" title='{l_tags.left}'><i class="fa fa-align-left"></i></span>
	<span onclick="insertext('[center]','[/center]', {area})" title='{l_tags.center}'><i class="fa fa-align-center"></i></span>
	<span onclick="insertext('[right]','[/right]', {area})" title='{l_tags.right}'><i class="fa fa-align-right"></i></span>
	<span onclick="insertext('[justify]','[/justify]', {area})" title='{l_tags.justify}'><i class="fa fa-align-justify"></i></span>
	<span>|</span>
	<span onclick="insertext('[ul]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ul]','', {area})" title='{l_tags.bulllist}'><i class="fa fa-list-ul"></i></span>
	<span onclick="insertext('[ol]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ol]','', {area})" title='{l_tags.numlist}'><i class="fa fa-list-ol"></i></span>
	<span>|</span>
	<span onclick="insertext('[spoiler]','[/spoiler]', {area})" title='{l_tags.spoiler}'><i class="fa fa-list-alt"></i></span>
	<span onclick="insertext('[p]','[/p]', {area})" title='{l_tags.paragraph}'><i class="fa fa-paragraph"></i></span>
	<span onclick="insertext('[quote]','[/quote]', {area})" title='{l_tags.comment}'><i class="fa fa-quote-left"></i></span>
	<span onclick="insertext('[code]','[/code]', {area})" title='{l_tags.code}'><i class="fa fa-code"></i></span>
	<span onclick="insertext('[hide]','[/hide]', {area})" title='{l_tags.hide}'><i class="fa fa-shield"></i></span>
	<span>|</span>
	<span class="tags_email" title='{l_tags.email}'><i class="fa fa-envelope-o"></i></span>
	<span class="tags_url" title='{l_tags.link}'><i class="fa fa-link"></i></span>
	<span class="tags_img" title='{l_tags.imagelink}'><i class="fa fa-picture-o"></i></span>

	<span onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=files&amp;ifield='+{area}, '_Addfile', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addfile" title='{l_tags.file}'><i class="fa fa-file-text-o"></i></span> 
	<span onclick="get_image_list('img_popup', 12, 1);" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></span>
	<div class="fr">
		<span onclick="var form = document.getElementById('postForm');form.submit();return false;" title="Сохранить (Ctrl+S)"><i class="fa fa-save"></i></span>
		<span onclick="$('#fullwidth').toggleClass('news-content-full');" title="Развернуть на весь экран (F11)"><i class="fa fa-arrows-alt"></i></span>
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

var currentInputAreaID = '';

</script>
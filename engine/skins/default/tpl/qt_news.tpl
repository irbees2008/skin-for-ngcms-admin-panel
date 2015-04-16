<span id="save_area" style="display: block;"></span>
<div id="tags">
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
	<a onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('{php_self}?mod=images&amp;ifield='+{area}, '_Addimage', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addimage" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></a>
	|
	<a onclick="insertext('<!--nextpage-->','', {area})" title='{l_tags.nextpage}'><i class="fa fa-files-o"></i></a>
	|
	<span class="more">
		<a onclick="insertext('<!--more-->','', {area})" title='{l_tags.more}'><i class="fa fa-ellipsis-h"></i></a>
	</span>
</div>
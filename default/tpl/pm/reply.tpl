<h2 class="content-head">����� �� ���������</h2>

<form method="post" name="form" action="{php_self}?mod=pm&action=send">
	<input type="hidden" name="title" value="{title}">
	<input type="hidden" name="sendto" value="{sendto}">
	
	<div class="content-main-left clear">
		<label class="lable-title" for="content">{l_content}</label>
		{quicktags}
		<div id="smilies" class="smile-box">{{ smilies }}</div>
		<textarea name="content" id="content" tabindex="3" maxlength="3000" placeholder="�������� ����� ���������" /></textarea>
	</div>
	
	<div class="content-footer-left clear">
		<input class="button-success fr" type="submit" value="{l_send}" accesskey="s" />
	</div>
</form>
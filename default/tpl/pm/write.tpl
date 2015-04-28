<h2 class="content-head">Написать сообщение</h2>

<form method="post" name="form" action="{php_self}?mod=pm&action=send">
	<div class="content-main-left clear">
		<label class="lable-title" for="title">{l_title}</label>
		<input style="width:100%;" type="text" name="title" id="title" tabindex="1" maxlength="50" placeholder="Введите заголовок сообщения" />
		
		<label class="lable-title" for="sendto">{l_receiver}</label>
		<input style="width:100%;" type="text" name="sendto" id="sendto" tabindex="2" maxlength="70" placeholder="{l_receiver_desc}" />
		
		<label class="lable-title" for="content">{l_content}</label>
		{quicktags}
		<div id="smilies" class="smile-box clear">{smilies}</div>
		<textarea name="content" id="content" tabindex="3" maxlength="3000" placeholder="Наберите текст сообщения" /></textarea>
	</div>
	
	<div class="content-footer-left clear">
		<input class="button-success fr" type="submit" value="{l_send}" accesskey="s" />
	</div>
</form>
<h2 class="content-head">Чтение сообщения {from}</h2>

<form method="POST" action="{php_self}?mod=pm&action=reply&pmid={pmid}">
	<input type="hidden" name="title" value="{title}">
	<input type="hidden" name="from" value="{from}">

	<div class="content-main-left clear">
		<h3 class="content-title">{title}</h3>
		<p class="comment-content">{content}</p>
	</div>

	<div class="content-footer-left clear">
		<input class="button-success fr" type="submit" value="{l_reply}" accesskey="s" />
	</div>
</form>
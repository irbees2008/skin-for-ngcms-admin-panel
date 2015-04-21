<li class="comment-body">
	<div class="comment-meta">
		
		<div class="comment-author">
		[userlink]<a href="{com_url}">{com_author}</a>[/userlink]
		</div>

		<div class="comment-metadata">
		{com_time}
		</div>

	</div>

	<div class="comment-content">
	{com_part}
	</div>

	<div class="comment-reply">
	<label class="link-pseudo"><input type="checkbox" name="delcomid[]" value="{com_id}-{com_author}-{com_ip}-{com_post}" class="check" /> Выделить</label>
	| <a href="{php_self}?mod=editcomments&newsid={com_post}&comid={com_id}">{l_edit_comm}</a>
	| <a href="{php_self}?mod=ipban&iplock={com_ip}" target="_blank" title="{l_block_ip}">{com_ip}</a>
	</div>
</li>
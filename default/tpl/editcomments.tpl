<h2 class="content-head">Редактирования комментария</h2>

<!-- Main content form -->
<div class="content-main-left tabs clear">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li>{l_maincontent}</li>
		<li>{l_additional}</li>
	</ul>
	<!-- /Navigation bar -->
	
	<form name="form" method="post" action="{php_self}?mod=editcomments">
			<input type="hidden" name="mod" value="editcomments" />
			<input type="hidden" name="newsid" value="{newsid}" />
			<input type="hidden" name="comid" value="{comid}" />
			<input type="hidden" name="poster" value="{author}" />
			<input type="hidden" name="subaction" value="doeditcomment" />
			
		<!-- MAIN CONTENT -->
		<div class="tabs-content clear" id="maincontent">
			<h3 class="content-title">{l_comment}</h3>
			<textarea name="comment">{text}</textarea>

			<h3 class="content-title">{l_answer}</h3>
			{quicktags}
			<div id="smilies" class="smile-box clear">{smilies}</div>
			<textarea id="content" name="content">{answer}</textarea>
			<div class="input-group w_100">
				<span class="input-group-check">
					<input type="checkbox" id="send" name="send_notice" value="send_notice" />
				</span>
				<input type="text" value="{l_send_notice}" disabled />
			</div>
		</div>
		
		<!-- ADDITIONAL -->
		<div class="tabs-content clear" id="additional">
			<table id="additional">
			<tr>
			<td width="50%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_date}</td>
			<td width="47%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_ip}</td>
			</tr>
			<tr>
			<td width="50%" class="contentEntry1">{comdate}</td>
			<td width="47%" class="contentEntry1"><a href="http://www.nic.ru/whois/?ip={ip}" target="_blank">{ip}</a></td>
			</tr>
			<tr>
			<td width="50%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_name}</td>
			<td width="47%" class="contentHead"><img src="{skins_url}/images/nav.gif" hspace="8">{l_email}</td>
			</tr>
			<tr>
			<td width="50%" class="contentEntry1">{author}</td>
			<td width="47%" class="contentEntry1"><input type="text" name="mail" value="{mail}" /></td>
			</tr>
			</table>
		</div>
		
		<div class="content-footer clear">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr align="center">
			<td width="100%" class="contentEdit">
			<input class="button-success fr" type="submit" value="{l_save}" accesskey="s" tabindex="5">
			<input class="button-danger" type="button" value="{l_delete}" onClick="confirmit('{php_self}?mod=editcomments&subaction=deletecomment&newsid={newsid}&comid={comid}&poster={author}', '{l_sure_del}')" tabindex="6">
			<input class="button-danger" type="button" value="{l_block_ip}" onClick="document.location='{php_self}?mod=ipban&iplock={ip}'" />

			</td>
			</tr>
			</table>
		</div>
	</form>
</div>
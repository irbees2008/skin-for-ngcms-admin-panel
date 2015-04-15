<!DOCTYPE html>
<html lang="{l_langcode}">
 <head>
  <meta charset="{l_encoding}">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>{home_title} - {l_adminpanel}</title>
  <link rel="stylesheet" href="{skins_url}/css/login.css">
 </head>
 <body>

<!--Login block-->
<div id="loginForm">
<form name="login" method="post" action="{php_self}">
	<input type="hidden" name="redirect" value="{redirect}" />
	<input type="hidden" name="action" value="login" />
	 
	<div class="field">
		<label for="login">{l_name}</label>
		<div class="input"><input type="text" name="username" id="login" value="" maxlength="60" tabindex="1" /></div>
	</div>

	<div class="field">
		<label for="pass">{l_password}</label>
		<div class="input"><input type="password" name="password" id="pass" maxlength="20" tabindex="2" /></div>
	</div>

	
	<div class="submit">
		<div class="copyright">2008-2015 � <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a></div>
		<input type="submit" value="{l_login}" />
	</div>
	
	
</form>
</div>
<!--/Login block-->

</body>
</html>
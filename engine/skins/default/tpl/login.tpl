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

 <div id="login_wrap">
  <div class="l_block">

   <div class="in">
    <img src="{skins_url}/images/login/logo.png" width="283" height="129" />
    <form name="login" method="post" action="{php_self}">
     <input type="hidden" name="redirect" value="{redirect}" />
     <input type="hidden" name="action" value="login" />
     <label>{l_name}</label>
     <input type="text" name="username" value="" maxlength="60" tabindex="1" />
     <label>{l_password}</label>
     <input class="password" type="password" name="password" maxlength="20" tabindex="2" />
	<br />
    <input type="submit" class="filterbutton" value="{l_login}" />
    </form>
    </div>
  </div>
  <p class="log_copyright">2008-2015 © <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a></p>
</div>
<!--/Login block-->

</body>
</html>

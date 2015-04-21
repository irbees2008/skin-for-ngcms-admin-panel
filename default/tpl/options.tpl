<h2 class="content-head">{{ lang.options['options_title'] }}</h2>

<p>��� ��������� ��������� ��� ������ ����� � ������� ��������� ������������. ���� �������� ������� �� ���� ������� � ������ ������������, � ������� �� ������������.</p>
<div class="tabs clear">

  <ul class="tabs-title clear">
    <li class="active">{{ lang.options['news'] }}</li>
    <li>{{ lang.options['system'] }}</li>
    <li>{{ lang.options['userman'] }}</li>
    <li>{{ lang.options['other'] }}</li>
	<li>��������� �����. ������</li>
  </ul>

  <div class="tabs-content">
  <!-- news -->
	<ul>
		<li>
			<h4 class="li-title">{% if (perm.static) %}<a href="{{ php_self }}?mod=static" title="{l_static}">{% endif %}{{ lang.options['static'] }}{% if (perm.static) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.addnews) %}<a href="{{ php_self }}?mod=news&action=add" title="{{ lang.options['news.add'] }}">{% endif %}{{ lang.options['news.add'] }}{% if (perm.addnews) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.editnews) %}<a href="{{ php_self }}?mod=news" title="{{ lang.options['news.edit'] }}">{% endif %}{{ lang.options['news.edit'] }}{% if (perm.editnews) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.categories) %}<a href="{{ php_self }}?mod=categories" title="{{ lang.options['news.categories'] }}">{% endif %}{{ lang.options['news.categories'] }}{% if (perm.categories) %}</a>{% endif %}</h4>
			<p></p>
		</li>
	</ul>
  </div>

  <div class="tabs-content">
  <!-- system -->
	<ul>
		<li>
			<h4 class="li-title">{% if (perm.configuration) %}<a href="{{ php_self }}?mod=configuration" title="{{ lang.options['configuration'] }}">{% endif %}{{ lang.options['configuration'] }}{% if (perm.configuration) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.dbo) %}<a href="{{ php_self }}?mod=dbo" title="{{ lang.options['dbo'] }}">{% endif %}{{ lang.options['dbo'] }}{% if (perm.dbo) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=statistics" title="{{ lang.options['statistics'] }}">{{ lang.options['statistics'] }}</a></h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.rewrite) %}<a href="{{ php_self }}?mod=rewrite" title="{{ lang.options['rewrite'] }}">{% endif %}{{ lang.options['rewrite'] }}{% if (perm.rewrite) %}</a>{% endif %}</h4>
			<p></p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.cron) %}<a href="{{ php_self }}?mod=cron" title="{{ lang.options['cron'] }}">{% endif %}{{ lang.options['cron'] }}{% if (perm.cron) %}</a>{% endif %}</h4>
			<p>����������� ����� �������� �� ���������� ������������� �������� (��������� ����������� ��, ������������ �� � �.�.). ������ ������� ��� ���� NGCMS ����� ������� ��������� � ���� ������. ��������������� ��������� �������� ������ �� ���������, �� � ��� ���� ����������� ��� ������������� �������� ������� ������� ��� ��� ���� ������������� �����.</p>
		</li>
	</ul>
  </div>

  <div class="tabs-content">
  <!-- userman -->
	<ul>
		<li>
			<h4 class="li-title">{% if (perm.users) %}<a href="{{ php_self }}?mod=users" title="{{ lang.options['users'] }}">{% endif %}{{ lang.options['users'] }}{% if (perm.users) %}</a>{% endif %}</h4>
			<p>� ���� ������� �� ������� �������� ������� ������������ � ������ �������� ���������� �� ����: ���������� �������� � ������������, ����������� ���� �������������. �� �������� ������� � �������� �������� ��� ��������� ������� ������������� �� �������� ���������, ��������, �������� ���� ���������� �������������. � ����� ����� ����� �������� ������ ������������. </p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.ipban) %}<a href="{{ php_self }}?mod=ipban" title="{{ lang.options['ipban'] }}">{% endif %}{{ lang.options['ipban'] }}{% if (perm.ipban) %}</a>{% endif %}</h4>
			<p>������������ ��������� ��� IP-������.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=ugroup" title="{{ lang.options['ugroup'] }}">{{ lang.options['ugroup'] }}</a></h4>
			<p>�� ������ ��������� ������������� �� ������ � ������� ������� ������� (��������������, ���������, ����������, ������������ � �.�.). � ����� �������� ����� ������, ���� ������������� ��� ������������, ���� ������� ������ ������.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=perm" title="{{ lang.options['uperm'] }}">{{ lang.options['uperm'] }}</a></h4>
			<p>��� ������ ������ ������������� ����� ���������� ����� ������� � ������������ ��������, ���������� � ����������� ����� ��� ���������������� ������.</p>
		</li>
	</ul>
  </div>

  <div class="tabs-content">
	<!-- other -->
	<ul>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=extras" title="{{ lang.options['extras'] }}">{{ lang.options['extras'] }}</a></h4>
			<p>������, � ������� �� ������� ����������, ����������� ��� ��������� �������. � �� ������� ����� ��������� � ��������� ���������������� ������ �����, � ����� �������� ��������� � �������������� ������ �� �������� ���������. �� ������ ������ �� ����� ����� ����� �������� <span class="cnt-plug-all">��������...</span> - �� ��� ������� <span class="cnt-plug-all">��������...</span>, �� ������� <span class="cnt-plug-all">��������...</span>, �� ����������� <span class="cnt-plug-all">��������...</span>.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=images" title="{{ lang.options['images'] }}">{{ lang.options['images'] }}</a></h4>
			<p>����������� ���������� ������������� � �� �����������. �������������� ����������� �����������, ������������ �� ��� ���������� �����. ���������� ����� ��� �������� � ���������, ���������� ����������� �����. �������� �� ���������� �����������.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=files" title="{{ lang.options['files'] }}">{{ lang.options['files'] }}</a></h4>
			<p>������� ���������� ������� � �� �����������. �������, ��� �������� ���������� ������������. ����������� �� � ������������ ��������� ��� ���������� �����. �������� �� ���������� ����� � ���������� ����� � ���������� ��� �� ������ ������ � ��������.</p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.templates) %}<a href="{{ php_self }}?mod=templates" title="{{ lang.options['templates'] }}">{% endif %}{{ lang.options['templates'] }}{% if (perm.templates) %}</a>{% endif %}</h4>
			<p>������ ������ ��������� ��������, ������� ����� �������� � ������� ��������� � ���������� ���������� ����. � ����� �������, ��������� ������ ����� ����� ������� ��� ���� �����. ���������� ����� ������� � ������������ ����� NG CMS.</p>
		</li>
		</li>
	</ul>
  </div>
  
  <div class="tabs-content active">
  <!-- ��������� �����. ������ -->
	<ul>
		<li>
			<h4 class="li-title">��������� �������� �����</h4>
			<ul>
				<li><a href="#" onclick="switchtheme('amethyst')">Amethyst</a></li>
				<li><a href="#" onclick="switchtheme('default')">Default</a></li>
				<li><a href="#" onclick="switchtheme('midnight')">Midnight</a></li>
			</ul>
		</li>
	</ul>
  </div>
</div>

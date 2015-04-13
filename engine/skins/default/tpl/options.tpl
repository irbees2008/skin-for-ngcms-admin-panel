<h2 class="content-head">{{ lang.options['options_title'] }}</h2>

<div>
	<h3 class="lable-title">{{ lang.options['news'] }}</h3>
	
	<ul>
		{% if (perm.static) %}<li><a href="{{ php_self }}?mod=static" title="{l_static}">{% endif %}{{ lang.options['static'] }}{% if (perm.static) %}</a>{% endif %}
		{% if (perm.categories) %}<li><a href="{{ php_self }}?mod=categories" title="{{ lang.options['news.categories'] }}">{% endif %}{{ lang.options['news.categories'] }}{% if (perm.categories) %}</a>{% endif %}
		{% if (perm.addnews) %}<li><a href="{{ php_self }}?mod=news&action=add" title="{{ lang.options['news.add'] }}">{% endif %}{{ lang.options['news.add'] }}{% if (perm.addnews) %}</a>{% endif %}
		{% if (perm.editnews) %}<li><a href="{{ php_self }}?mod=news" title="{{ lang.options['news.edit'] }}">{% endif %}{{ lang.options['news.edit'] }}{% if (perm.editnews) %}</a>{% endif %}
	</ul>
</div>

<div>
	<h3 class="lable-title">{{ lang.options['system'] }}</h3>
	
	<ul>
	{% if (perm.configuration) %}<li><a href="{{ php_self }}?mod=configuration" title="{{ lang.options['configuration'] }}">{% endif %}{{ lang.options['configuration'] }}{% if (perm.configuration) %}</a>{% endif %}
	{% if (perm.dbo) %}<li><a href="{{ php_self }}?mod=dbo" title="{{ lang.options['dbo'] }}">{% endif %}{{ lang.options['dbo'] }}{% if (perm.dbo) %}</a>{% endif %}
	<li><a href="{{ php_self }}?mod=statistics" title="{{ lang.options['statistics'] }}">{{ lang.options['statistics'] }}</a>
	{% if (perm.rewrite) %}<li><a href="{{ php_self }}?mod=rewrite" title="{{ lang.options['rewrite'] }}">{% endif %}{{ lang.options['rewrite'] }}{% if (perm.rewrite) %}</a>{% endif %}
	{% if (perm.cron) %}<li><a href="{{ php_self }}?mod=cron" title="{{ lang.options['cron'] }}">{% endif %}{{ lang.options['cron'] }}{% if (perm.cron) %}</a>{% endif %}
	</ul>
</div>

<div>
	<h3 class="lable-title">{{ lang.options['userman'] }}</h3>
	
	<ul>
		{% if (perm.users) %}<li><a href="{{ php_self }}?mod=users" title="{{ lang.options['users'] }}">{% endif %}{{ lang.options['users'] }}{% if (perm.users) %}</a>{% endif %}
		{% if (perm.ipban) %}<li><a href="{{ php_self }}?mod=ipban" title="{{ lang.options['ipban'] }}">{% endif %}{{ lang.options['ipban'] }}{% if (perm.ipban) %}</a>{% endif %}
		<li><a href="{{ php_self }}?mod=ugroup" title="{{ lang.options['ugroup'] }}">{{ lang.options['ugroup'] }}</a>
		<li><a href="{{ php_self }}?mod=perm" title="{{ lang.options['uperm'] }}">{{ lang.options['uperm'] }}</a>
	</ul>
</div>

<div>
	<h3 class="lable-title">{{ lang.options['other'] }}</h3>
	
	<ul>
		<li><a href="{{ php_self }}?mod=extras" title="{{ lang.options['extras'] }}">{{ lang.options['extras'] }}</a>
		<li><a href="{{ php_self }}?mod=images" title="{{ lang.options['images'] }}">{{ lang.options['images'] }}</a>
		<li><a href="{{ php_self }}?mod=files" title="{{ lang.options['files'] }}">{{ lang.options['files'] }}</a>
		{% if (perm.templates) %}<li><a href="{{ php_self }}?mod=templates" title="{{ lang.options['templates'] }}">{% endif %}{{ lang.options['templates'] }}{% if (perm.templates) %}</a>{% endif %}
	</ul>
</div>
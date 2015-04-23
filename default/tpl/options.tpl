<h2 class="content-head">{{ lang.options['options_title'] }}</h2>

<p>Все доступные настройки для вашего сайта с кратким описанием возможностей. Типы настроек зависят от прав доступа и группы пользователя, к которой вы принадлежите.</p>
<div class="tabs clear">

  <ul class="tabs-title clear">
    <li class="active">{{ lang.options['news'] }}</li>
    <li>{{ lang.options['system'] }}</li>
    <li>{{ lang.options['userman'] }}</li>
    <li>{{ lang.options['other'] }}</li>
	<li>Настройки админ. панели</li>
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
			<p>Планировщик задач отвечает за выполнение повторяющихся действий (резервное копирование БД, обслуживание БД и т.д.). Другие плагины или ядро NGCMS могут вносить изменения в этот список. Самостоятельное изменение настроек обычно не требуется, но у вас есть возможность при необходимости поменять условия запуска тех или иных периодических задач.</p>
		</li>
	</ul>
  </div>

  <div class="tabs-content">
  <!-- userman -->
	<ul>
		<li>
			<h4 class="li-title">{% if (perm.users) %}<a href="{{ php_self }}?mod=users" title="{{ lang.options['users'] }}">{% endif %}{{ lang.options['users'] }}{% if (perm.users) %}</a>{% endif %}</h4>
			<p>В этом разделе вы сможете отыскать нужного пользователя и узнать основную статистику по нему: количество новостей и комментариев, оставленных этим пользователем. Не составит проблем и массовое удаление или изменения статуса пользователей по заданным критериям, например, удаление всех неактивных пользователей. В любое время можно добавить нового пользователя. </p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.ipban) %}<a href="{{ php_self }}?mod=ipban" title="{{ lang.options['ipban'] }}">{% endif %}{{ lang.options['ipban'] }}{% if (perm.ipban) %}</a>{% endif %}</h4>
			<p>Заблокируйте неугодные вам IP-адреса.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=ugroup" title="{{ lang.options['ugroup'] }}">{{ lang.options['ugroup'] }}</a></h4>
			<p>Вы можете разбивать пользователей на группы с разными правами доступа (администраторы, редакторы, журналисты, комментаторы и т.д.). А также добавить новые группы, либо редактировать уже существующие, либо удалить лишние группы.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=perm" title="{{ lang.options['uperm'] }}">{{ lang.options['uperm'] }}</a></h4>
			<p>Для каждой группы пользователей можно установить права доступа к определенным разделам, настройкам и функционалу сайта или административной панели.</p>
		</li>
	</ul>
  </div>

  <div class="tabs-content">
	<!-- other -->
	<ul>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=extras" title="{{ lang.options['extras'] }}">{{ lang.options['extras'] }}</a></h4>
			<p>Раздел, в котором вы сможете подключать, настраивать или отключать плагины. С их помощью можно добавлять и расширять функциональность вашего сайта, а также выводить материалы в информационных блоках по заданным критериям. На данным момент на вашем сайте всего плагинов <span class="cnt-plug-all">Загрузка...</span> - из них активны <span class="cnt-plug-all">Загрузка...</span>, не активны <span class="cnt-plug-all">Загрузка...</span>, не установлены <span class="cnt-plug-all">Загрузка...</span>.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=images" title="{{ lang.options['images'] }}">{{ lang.options['images'] }}</a></h4>
			<p>Полноценное управление изображениями и их категориями. Просматривайте загруженные изображения, редактируйте их или загружайте новые. Добавляйте штамп или описание к картинкам, создавайте уменьшенные копии. Удаляйте не интересные изображения.</p>
		</li>
		<li>
			<h4 class="li-title"><a href="{{ php_self }}?mod=files" title="{{ lang.options['files'] }}">{{ lang.options['files'] }}</a></h4>
			<p>Удобное управление файлами и их категориями. Узнайте, что загружал конкретный пользователь. Перемещайте их в существующие категории или создавайте новые. Удаляйте не актуальные файлы и загружайте новые с компьютера или по прямой ссылке с интернет.</p>
		</li>
		<li>
			<h4 class="li-title">{% if (perm.templates) %}<a href="{{ php_self }}?mod=templates" title="{{ lang.options['templates'] }}">{% endif %}{{ lang.options['templates'] }}{% if (perm.templates) %}</a>{% endif %}</h4>
			<p>Полный список доступных шаблонов, которые можно изменить в простом редакторе с подсветкой синтаксиса кода. И таким образом, настроить дизайн любой части проекта под свои нужды. Скачивайте новые шаблоны с официального сайта NG CMS.</p>
		</li>
		</li>
	</ul>
  </div>
  
  <div class="tabs-content active">
  
  <!-- Настройки админ. панели -->
  <div class="content-main clear">
	<ul class="div-resp fl">
		<li>
			<h4 class="li-title">Изменение цветовой схемы</h4>
			<ul>
				<li><a href="#" onclick="switchtheme('amethyst')">Amethyst</a></li>
				<li><a href="#" onclick="switchtheme('default')">Default</a></li>
				<li><a href="#" onclick="switchtheme('midnight')">Midnight</a></li>
			</ul>
		</li>
	</ul>
	<ul class="div-resp fl">
		<li>
			<h4 class="li-title">Особенности темы</h4>
			<ul>
				<li>1 Табы запоминают последнюю позицию</li>
				<li>2 Используется дополнительный языковой файл</li>
				<li>3 Адаптивная верстка</li>
				<li>4 ...</li>
			</ul>
		</li>
	</ul>
	<ul class="div-resp fl">
		<li>
			<h4 class="li-title">Баги темы</h4>
			<ul>
				<li>1 Не организованная CSS</li>
				<li>2 Адаптивные таблицы не имеют языковой альтернативы. Необходимо создать подключение в зависимости от языка внешней CSS.</li>
				<li>3 Элементы checkbox и radio используют псевдоэлемент :before, что запрещено ....</li>
				<li>4 ...</li>
			</ul>
		</li>
	</ul>
	</div>
	
	<div class="content-footer clear">
		Краткая информация о теме админ. панели.
	</div>
  </div>
</div>

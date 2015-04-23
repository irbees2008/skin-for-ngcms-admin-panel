<h2 class="content-head">{{ lang['editing'] }} "{{ name }}"</h2>

<form method="post" action="{{ php_self }}?mod=categories" enctype="multipart/form-data">
	<input type="hidden" name="token" value="{{ token }}"/>

	<ul class="config-list">
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title"><label for="cat_show">{{ lang['show_main'] }}</label></h4>
				<p></p>
			</div>
			<div class="config-var"><input type="checkbox" id="cat_show" name="cat_show" value="1" class="check" {% if flags.showInMenu %}checked="checked" {% endif %}/></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['show.link'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><select name="show_link">{{ show_link }}</select></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['title'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="name" value="{{ name }}" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['alt_name'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="alt" value="{{ alt }}" /></div>
		</li>
		{% if flags.haveMeta %}
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['cat_desc'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="description" value="{{ description }}" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['cat_keys'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="keywords" value="{{ keywords }}" /></div>
		</li>
		{% endif %}
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['cat_number'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="number" name="number" value="{{ number }}" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['cat_tpl'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><select name="tpl">{{ tpl_list }}</select></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['template_mode'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><select name="template_mode">{{ template_mode }}</select></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['parent'] }}</h4>
				<p></p>
			</div>
			<div class="config-var">{{ parent }}</div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['icon'] }}</h4>
				<p>URL картинки, используемой в качестве иконки категории</p>
			</div>
			<div class="config-var"><input type="text" name="icon" value="{{ icon }}" maxlength="255" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">Прикрепленная иконка</h4>
				<p>Вы можете прикрепить изображение-иконку непосредственно к категории.<br/>Данное поле имеет приоритет.</p>
			</div>
			<div class="config-var">
			{% if flags.haveAttach %}<div id="previewImage"><img class="w_100" src="{{ attach_url }}"/></div>
			<div class="input-group w_100">
				<span class="input-group-check">
					<input type="checkbox" name="image_del" value="1">
				</span>
				<input type="text" value="удалить иконку" disabled />
			</div>
			{% endif %}
			<div class="button button-fileinput">
				<span id="spanfile1"><i class="fa fa-plus"></i> Add files...</span> <span id="spansize1"></span>
				<input type="file" name="image" onchange="validateFile(this, 1);">
			</div>
			</div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['alt_url'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="alt_url" value="{{ alt_url }}" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['orderby'] }}</h4>
				<p></p>
			</div>
			<div class="config-var">{{ orderlist }}</div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['category.info'] }}</h4>
				<p>{{ lang['category.info#desc'] }}</p>
			</div>
			<div class="config-var"><textarea name="info" id="info">{{ info }}</textarea></div>
		</li>
		<table>{{ extend }}</table>

	{% if flags.canModify %}
	<div class="clear">
		<input class="fr button-success" type="submit" value="{{ lang['save'] }}" />
		<input class="fr" type="button" value="{{ lang['cancel'] }}" onclick="document.location='admin.php?mod=categories';" />
		
		<input type="hidden" name="action" value="doedit" />
		<input type="hidden" name="catid" value="{{ catid }}" />
	</div>
	{% endif %}
</form>

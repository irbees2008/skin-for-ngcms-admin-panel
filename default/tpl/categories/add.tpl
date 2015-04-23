<h2 class="content-head">{{ lang['addnew'] }}</h2>

<form method="post" action="{{ php_self }}?mod=categories" enctype="multipart/form-data">
	<input type="hidden" name="token" value="{{ token }}"/>
	
	<ul class="config-list">
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title"><label for="cat_show">{{ lang['show_main'] }}</label></h4>
				<p></p>
			</div>
			<div class="config-var"><input type="checkbox" id="cat_show" name="cat_show" value="1" checked="checked" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['show.link'] }}</h4>
				<p></p>
			</div>
			<div class="config-var">
				<select name="show_link">
					<option value="0">{{ lang['link.always'] }}</option>
					<option value="1">{{ lang['link.ifnews'] }}</option>
					<option value="2">{{ lang['link.never'] }}</option>
				</select>
			</div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['title'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="name" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['alt_name'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="text" name="alt" /></div>
		</li>
		{% if (flags.haveMeta) %}
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['cat_desc'] }}</h4>
					<p></p>
				</div>
				<div class="config-var"><input type="text" name="description" /></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">{{ lang['cat_keys'] }}</h4>
					<p></p>
				</div>
				<div class="config-var"><input type="text" name="keywords" /></div>
			</li>
		{% endif %}
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['cat_number'] }}</h4>
				<p></p>
			</div>
			<div class="config-var"><input type="number" name="number" /></div>
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
			<div class="config-var"><input type="text" name="icon" maxlength="255" /></div>
		</li>
		<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">Прикрепленная иконка</h4>
				<p>Вы можете прикрепить изображение-иконку непосредственно к категории.<br/>Данное поле имеет приоритет.</p>
			</div>
			<div class="config-var">
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
			<div class="config-var"><input type="text" name="alt_url" /></div>
		</li>
			<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['orderby'] }}</h4>
				<p></p>
			</div>
			<div class="config-var">{{ orderlist }}</div>
		</li>
		</li>
			<li class="config-box clear">
			<div class="config-descr">
				<h4 class="config-title">{{ lang['category.info'] }}</h4>
				<p>{{ lang['category.info#desc'] }}</p>
			</div>
			<div class="config-var"><textarea id="info" name="info" ></textarea></div>
		</li>
		</li>
	</ul>
	<table>{{ extend }}</table>
	<div class="clear">
		<input class="fr" type="submit" value="{{ lang['addnew'] }}" />
		<input type="hidden" name="action" value="doadd" />
	</div>
</form>

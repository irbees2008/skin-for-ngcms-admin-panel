<h2 class="content-head">{% if flags.editMode %}Редактирование группы пользователей "{{ entry.identity }}" [ {{ entry.id }} ]{% else %}Добавление группы пользователей{% endif %}</h2>

	<form action="{{ php_self }}?mod=ugroup" method="post">
		<input type="hidden" name="token" value="{{ token }}"/>
		<input type="hidden" name="id" value="{{ entry.id }}"/>
		<input type="hidden" name="action" value="{% if (flags.editMode) %}edit{% else %}add{% endif %}" />
		
		<ul class="config-list">
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">ID:</h4>
				</div>
				<div class="config-var"><b>{{ entry.id }}</b></div>
			</li>
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">Идентификатор группы:</h4>
					<p>Например: uguest</p>
				</div>
				<div class="config-var"><input type="text" name="identity" value="{{ entry.identity }}" /></div>
			</li>
			{% for eLang,eLValue in entry.langName %}
			<li class="config-box clear">
				<div class="config-descr">
					<h4 class="config-title">Название группы на языке [{{ eLang }}]:</h4>
					{% if eLang=='russian' %}<p>Например: Гость</p>{% endif %}
					{% if eLang=='english' %}<p>Например: Guest</p>{% endif %}
				</div>
				<div class="config-var"><input type="text" name="langname[{{ eLang }}]" value="{{ eLValue }}"/></div>
			</li>
			{% endfor %}
		</ul>

		{% if (flags.canModify) %}
		<div class="content-footer clear">
			<input class="fr" type="submit" value="{{ lang['save'] }}" />
			<input class="fr" type="button" value="{{ lang['cancel'] }}" onClick="history.back();" />
		</div>
		{% endif %}
		
	</form>

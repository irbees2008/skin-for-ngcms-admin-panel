<h2 class="content-head">���������� ������� �������</h2>

<script type="text/javascript">
var permDefault = {{ DEFAULT_JSON }};

function onUpdatePerm(name) {
 var f = document.getElementById('permSubmit');
 var v = permDefault[name];

 if (f[name].value != v) {
 	f[name].className = 'pChanged';
 } else {
 	f[name].className = '';
 }
 //alert(f[name].value);
}

function onUpdateSubmit() {
 return true;

 var f = document.getElementById('permSubmit');
 for (var i = 0; i < f.elements.length; i++) {
 	if (f.elements[i].value != permDefault[f.elements[i].name]) {
		alert(f.elements[i].name+': '+permDefault[f.elements[i].name]+ ' => '+f.elements[i].value);
	}
 	if (i > 10) { break; }
 }
}
</script>

<form id="permSubmit" name="permSubmit" method="POST">
	<input type="hidden" name="save" value="1"/>
	<input type="hidden" name="token" value="{{ token }}"/>

	<div class="content clear" id="userTabs">
		<!-- Navigation bar -->
		<div class="content-nav clear">
			{% for group in GRP %}
				<input class="navbutton" type="button" onclick="ChangeOption('userTabs-{{ group.id }}');" value="{{ group.title }}" />
			{% endfor %}
		</div>
		

		<!-- Group content header -->
		{% for group in GRP %}
			<!-- Content for group [{{ group.id }}] {{ group.title }} -->
			<div class="navtab" id="userTabs-{{ group.id }}">
				<p>���������� ������� ������ �������������: <b>{{ group.title }}</b></p>

				{% for block in CONFIG %}
					<div class="pconf">
						<h3>{{ block.title }}</h3>
						{% if (block.description) %}<i>{{ block.description }}</i>{% endif %}

						{% for area in block.items %}
							<h4>{{ area.title }}</h4>
							{% if (area.description) %}<i>{{ area.description }}</i><br/><br/>{% endif %}

							<table class="hover odd">
								<thead>
									<tr class="contHead">
										<th>#ID</th><th>��������</th><th width="90">������</th>
									</tr>
								</thead>
								{% for entry in area.items %}
									<tr class="contentEntry1">
										<td><strong>{{entry.id}}</strong></td>
										<td>{{ entry.title }}</td>
										<td>
											<select name="{{ entry.name }}|{{group.id}}" onchange="onUpdatePerm('{{ entry.name }}|{{group.id}}');" value="{% if isSet(entry.perm[group.id]) %}{% if (entry.perm[group.id]) %}1{% else %}0{% endif %}{% else %}-1{% endif %}">
												<option value="-1">--</option>
												<option value="0"{% if (isSet(entry.perm[group.id]) and (not entry.perm[group.id])) %} selected="selected"{% endif %}>���</option>
												<option value="1"{% if (isSet(entry.perm[group.id]) and (entry.perm[group.id])) %} selected="selected"{% endif %}>��</option>
											</select>
										</td>
									</tr>
								{% endfor %}
							</table>
						{% endfor %}
					</div>
				{% endfor %}
			</div>
			<!-- /Content for group [{{ group.id }}] {{ group.title }} -->
		{% endfor %}
	</div>


	<div class="content-footer clear">
		<input class="button-success fr" type="submit" value="��������� ���������" onclick="return onUpdateSubmit();" />
	</div>

</form>

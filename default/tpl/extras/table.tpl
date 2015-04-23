<h2 class="content-head">{{ lang['extras'] }}</h2>

<script type="text/javascript" src="{{ admin_url }}/includes/js/admin.js"></script>

<div class="content clear" id="pluginMenu">
	<!-- Navigation bar -->
	<ul class="tabs-title clear">
		<li data-filter="all">{{ lang['list.all'] }} <span class="count-label" id="count-plugin-all">{{ cntAll }}</span></li>
		<li data-filter="pluginEntryActive">{{ lang['list.active'] }} <span class="count-label" id="cnt-plug-active">{{ cntActive }}</span></li>
		<li data-filter="pluginEntryInactive">{{ lang['list.inactive'] }} <span class="count-label" id="cnt-plug-inactive">{{ cntInactive }}</span></li>
		<li data-filter="pluginEntryUninstalled">{{ lang['list.needinstall'] }} <span class="count-label" id="cnt-plug-needinstall">{{ cntUninstalled }}</span></li>
	</ul>
	<!-- /Navigation bar -->

	<div class="tabs-content" id="maincontent">
		<table class="table-resp table-extras">
			<thead>
				<tr>
					<th>{{ lang['id'] }}</th>
					<th>{{ lang['title'] }}</th>
					<th>{{ lang['type'] }}</th>
					<th>{{ lang['version'] }}</th>
					<th>&nbsp;</th>
					<th>{{ lang['description'] }}</th>
					<th>{{ lang['author'] }}</th>
					<th>{{ lang['action'] }}</th>
				</tr>
			</thead>
		<tbody id="entryList">
		{% for entry in entries %}
			<tr class="all {{ entry.style }}" id="plugin_{{ entry.id }}">
				<td>{{ entry.id }} {{ entry.new }}</td>
				<td>{{ entry.url }}</td>
				<td>{{ entry.type }}</td>
				<td>{{ entry.version }}</td>
				<td nowrap>{{ entry.readme }} {{ entry.history }}</td>
				<td>{{ entry.description }}</td>
				<td>{{ entry.author_url }}</td>
				<td nowrap>{{ entry.link }} {{ entry.install }}</td>
			</tr>
		{% endfor %}
		</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){

	var newSelection = "";

	function tabsSwitch(tabs) {
	ngShowLoading();
		$("#maincontent").fadeTo(1, 0);
		$(".tabs-title li").removeClass("active");
		tabs.addClass("active");
		newSelection = tabs.attr("data-filter");
		$(".all").not("."+newSelection).slideUp();
		$("."+newSelection).slideDown();
		$("#maincontent").fadeTo(1000, 1);
	ngHideLoading();
	}

	$('.tabs-title').each(function(i) {
		var storage = localStorage.getItem('tab' +document.getElementById('skin_module_name').value+ i);
		if (storage) {
			tabsSwitch($(this).find('li').eq(storage));
		} else {
			tabsSwitch($('.tabs-title li:first'));
		}
	});
	
	$(".tabs-title").on('click', 'li:not(.active)', function(){
		tabsSwitch($(this));
	});
});
</script>
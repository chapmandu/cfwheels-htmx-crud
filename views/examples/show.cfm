<cfoutput>
	#includePartial("/shared/header")#

	<dl class="dl-horizontal">
		<dt>id</dt><dd>#example.key()#</dd>
		<dt>name</dt><dd>#example.name#</dd>
		<dt>type</dt><dd>#example.type#</dd>
	</dl>
	#linkTo(
		"hx-get" = UrlFor(route = "Examples"),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		text = "Back"
	)#
	#linkTo(
		"hx-get" = UrlFor(route = "editExample", key = example.key()),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		text = "Edit"
	)#
	#buttonTo(
		"hx-delete" = UrlFor(route = "Example", key = example.key()),
		"hx-target" = "##htmx-container",
		"hx-confirm" = "Are you sure?",
		"hx-push-url" = UrlFor(route = "Examples"),
		text = "Delete"
	)#
	#includePartial("/shared/footer")#
</cfoutput>

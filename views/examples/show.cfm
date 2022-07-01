<cfoutput>
	#includePartial("/shared/header")#

	<dl>
		<dt>ID:</dt><dd>#example.key()#</dd>
		<dt>Name:</dt><dd>#example.name#</dd>
		<dt>Type:</dt><dd>#example.type#</dd>
		<dt>Created:</dt><dd>#timeAgoInWords(example.createdAt)#</dd>
	</dl>

	#buttonTag(
		"hx-get" = UrlFor(route = "Examples"),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		content = "Back",
		class = "float<"
	)#
	#buttonTag(
		"hx-get" = UrlFor(route = "editExample", key = example.key()),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		content = "Edit",
		class = "float<"
	)#
	#buttonTo(
		"hx-delete" = UrlFor(route = "Example", key = example.key()),
		"hx-target" = "##htmx-container",
		"hx-confirm" = "Are you sure?",
		text = "Delete",
		class = "float<"
	)#
	#includePartial("/shared/footer")#
</cfoutput>

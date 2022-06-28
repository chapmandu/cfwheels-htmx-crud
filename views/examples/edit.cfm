<cfoutput>
	#includePartial("/shared/header")#
	#errorMessagesFor("example")#
	#startFormTag(
		"hx-put" = UrlFor(route = "Example", key = example.key()),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true
	)#
		#includePartial("fields")#
		#buttonTag(
			"hx-get" = UrlFor(route = "Example", key = example.key()),
			"hx-target" = "##htmx-container",
			"hx-push-url" = true,
			content = "Back"
		)#
		#buttonTag(content = "Save")#
	#endFormTag()#
	#includePartial("/shared/footer")#
</cfoutput>
<cfoutput>
	#includePartial("/shared/header")#
	#errorMessagesFor("example")#
	#startFormTag(
		"hx-post" = UrlFor(route = "Examples"),
		"hx-target" = "##htmx-container",
		"hx-push-url" = UrlFor(route = "Examples")
	)#
		#includePartial("fields")#
		#buttonTag(
			"hx-get" = UrlFor(route = "Examples"),
			"hx-target" = "##htmx-container",
			"hx-push-url" = true,
			content = "Back"
		)#
		#buttonTag(content = "Save")#
	#endFormTag()#
	#includePartial("/shared/footer")#
</cfoutput>

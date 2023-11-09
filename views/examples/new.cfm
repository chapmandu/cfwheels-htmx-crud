<cfoutput>
	#includePartial("/messages")#
	#errorMessagesFor(objectName = "example", class = "bad color")#
	#startFormTag(
		"hx-post" = UrlFor(route = "Examples"),
		"hx-target" = "##htmx-container"
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
</cfoutput>

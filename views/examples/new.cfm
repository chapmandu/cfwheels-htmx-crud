<cfoutput>
	#includePartial("/shared/header")#
	#errorMessagesFor("example")#
	#startFormTag(
		"hx-post" = UrlFor(route = "Examples"),
		"hx-target" = "##htmx-container"
	)#
		#includePartial("fields")#
		#buttonTag(content = "Save")#
	#endFormTag()#
	#includePartial("/shared/footer")#
</cfoutput>

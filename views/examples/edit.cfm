<cfoutput>
	#includePartial("/shared/header")#
	#errorMessagesFor("example")#
	#startFormTag(
		"hx-put" = UrlFor(route = "Example", key = example.key()),
		"hx-target" = "##htmx-container"
	)#
		#includePartial("fields")#
		#buttonTag(content = "Save")#
	#endFormTag()#
	#includePartial("/shared/footer")#
</cfoutput>
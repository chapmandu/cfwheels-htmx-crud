<cfoutput>
	<cfif !isHTMXRequest()>
		<div id="htmx-container" style = "border:1px solid silver;">
	</cfif>
	#flashMessages()#
</cfoutput>

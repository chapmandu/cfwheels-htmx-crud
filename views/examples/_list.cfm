<cfoutput>
	#linkTo(
		"hx-get" = URLFor(route = "newExample"),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		text = "New Example"
	)#
	<table>
		<cfloop query="examples">
			<tr>
				<td>#examples.id#</td>
				<td>
					#linkTo(
						"hx-get" = URLFor(route = "Example", key = examples.id),
						"hx-target" = "##htmx-container",
						"hx-push-url" = true,
						text = examples.name
					)#
				</td>
				<td>#examples.type#</td>
			</tr>
		</cfloop>
	</table>
</cfoutput>

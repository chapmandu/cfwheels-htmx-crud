<cfoutput>
	#buttonTag(
		"hx-get" = URLFor(route = "newExample"),
		"hx-target" = "##htmx-container",
		"hx-push-url" = true,
		content = "New Example"
	)#
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Type</th>
			</tr>
		</thead>
		<tbody>
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
		</tbody>
	</table>
</cfoutput>

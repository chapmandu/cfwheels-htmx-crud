<cfoutput>
	<p>
		<label>Name</label><br>
		#textField(objectName = "example", property = "name", label = "")#
  </p>
	<p>
		<label>Type</label><br>
		#select(objectName = "example", property = "type", options = arguments.options, label = "")#
  </p>
</cfoutput>

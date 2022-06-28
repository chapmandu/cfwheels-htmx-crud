<!--- Place HTML here that should be used as the default layout of your application. --->
<html>
	<head>
		<cfoutput>#csrfMetaTags()#</cfoutput>
		<script src="https://unpkg.com/htmx.org@1.7.0"></script>
		<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
	</head>
	<body>
		<h1>Examples</h1>
		<cfoutput>
			#includeContent()#
		</cfoutput>
	</body>
</html>

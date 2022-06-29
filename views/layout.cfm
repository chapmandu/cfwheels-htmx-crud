<!--- Place HTML here that should be used as the default layout of your application. --->
<html>
	<head>
		<title>CFWheels CRUD + HTMX</title>
		<cfoutput>#csrfMetaTags()#</cfoutput>
		<script src="https://unpkg.com/htmx.org@1.7.0"></script>
		<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
	</head>
	<body>
		<cfoutput>
		<header>
			<h1>Examples</h1>
			<p>A bare bones example of a #linkTo(text = "CFWheels", href = "https://cfwheels.org")# CRUD app using #linkTo(text = "HTMX", href = "https://htmx.org")#.</p>
		</header>
			#includeContent()#
		<footer>
			"Built" by #linkTo(text = "chapmandu", href = "https://github.com/chapmandu")#
		</footer>
		</cfoutput>
	</body>
</html>

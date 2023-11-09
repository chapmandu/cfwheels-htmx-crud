<html>
	<cfoutput>
		<head>
			<title>CFWheels + HTMX + missing.css</title>
			#csrfMetaTags()#
			#javaScriptIncludeTag("https://unpkg.com/htmx.org@1.9.8")#
			#styleSheetLinkTag("https://unpkg.com/missing.css@1.1.1")#
		</head>
		<body>
			<header>
				<h2>Examples</h2>
				<p class="box">
					A gathering of
					#linkTo(text = "CFWheels", href = "https://cfwheels.org")#,
					#linkTo(text = "HTMX", href = "https://htmx.org")# and
					#linkTo(text = "missing.css", href = "https://missing.style/")#
					in a bare-bones CRUD application.
				</p>
			</header>
			<main id="htmx-container">
				#includeContent()#
			</main>
			<br>
			<footer>
				"Built" by #linkTo(text = "chapmandu", href = "https://github.com/chapmandu")#
				<chip class="float>">0% Javascript</chip>
			</footer>
		</body>
	</cfoutput>
</html>

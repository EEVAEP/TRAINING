<cfset wordCountService = createObject("component", "components.tagCloud").init()>


<cfset wordQuery = wordCountService.getTagCloud()>

<html>
    	<head>
        	<title>Word Count</title>
        	<link href="./css/style.css" rel="stylesheet">
    	</head>
    	<body>
        	<h2>Word Count</h2>
        	<ul>
            		<cfoutput query="wordQuery">
                		<li>#word# (#wordCount#)</li>
            		</cfoutput>
        	</ul>
    	</body>
</html>

<!DOCTYPE html>
<html>
	<head>
    		<title>Word Count</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<h1>wordCount</h1>

		<cfset wordCountObj = createObject("component", "components.tagCloud").init()>
        	<cfset tagData = wordCountObj.getTagCloudData()>

    	    	<ul>
        		<cfoutput query="tagData">
            			<li>#word# (#wordCount#)</li>
        		</cfoutput>
    		</ul>
	
	</body>
</html>

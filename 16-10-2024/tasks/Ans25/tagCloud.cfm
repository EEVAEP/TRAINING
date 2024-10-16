
<cfset tagCloudService = createObject("component", "components.tagCloud").init()>
<cfset wordQuery = tagCloudService.getTagCloud()>

<html>
    	<head>
        	<title>Tag Cloud</title>
        	<link href="./css/style.css" rel="stylesheet">
    </head>
    <body>
        	<h2>Tag Cloud</h2>

        
        	<cfoutput query="wordQuery">
            		<span class="tag" 
                  		style="font-size: #10 + wordCount * 10#px; color: #randRange(100000, 999999)#;">
                		#word# (#wordCount#)
            		</span><br>
        	</cfoutput>
    	</body>
</html>


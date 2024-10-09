<!DOCTYPE html>
<html>
	<head>
    		<title>Word Count</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<h1>wordCount</h1>
		<cftry>
    			<cfquery name="getWords" datasource="ans25">
       				SELECT word, COUNT(word) as wordCount
       		 		FROM ans25.tags
        			WHERE char_length(word) >= 3
        			GROUP BY word
        			ORDER BY wordCount DESC, char_length(word) DESC, word ASC
    			</cfquery>
			<cfcatch>
				<cfdump var="#cfcatch#">
			</cfcatch>
		</cftry>

    	    	<ul>
        		<cfoutput query="getWords">
            			<li>#word# (#wordCount#)</li>
        		</cfoutput>
    		</ul>
	
	</body>
</html>

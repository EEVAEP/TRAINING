
<cfif structKeyExists(form, "submit")>
	<cfset local.tagCloud = createObject("component", "components.tagCloud").init()>

    
    	<cfset local.wordStruct = local.tagCloud.processText(form.paragraph)>

    
    	<cfloop collection="#local.wordStruct#" item="local.word">
        
        	<cfloop from="1" to="#local.wordStruct[local.word]#" index="local.i">
            		<cfquery datasource="ans25">
                		INSERT INTO tags (word)
                		VALUES (<cfqueryparam value="#local.word#" cfsqltype="cf_sql_varchar">)
            		</cfquery>
        	</cfloop>
    	</cfloop>
	<cfoutput>Data entered to db successfully</cfoutput>
</cfif>


<html>
	<head>
    		<title>Submit Text</title>
	</head>
	<body>
    		<h2>Enter Your Text</h2>
    		<form action="index.cfm" method="post">
        		<label for="paragraph">Text:</label><br>
        		<textarea name="paragraph" rows="5" cols="40"></textarea><br><br>
        		<input type="submit" name="submit" value="Submit">
    		</form>
	</body>
</html>


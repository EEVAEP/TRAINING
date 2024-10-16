
<cfif NOT structKeyExists(session, "username")>
    	<cflocation url="./login.cfm">
</cfif>

<cfset userService = createObject('component', 'components.db')>
<cfset qryPages = userService.getPages()>

<html>
	<head>
        	<title>Pages</title>
    	</head>
    	<body>
        	<h2 style="color:green;">Available Pages</h2>

        <table border="1">
        	<tr>
                	<th>Page Name</th>
                	<th>Description</th>
            	</tr>
            	<cfoutput query="qryPages">
            		<tr>
                		<td>#pagename#</td>
                		<td>#pagedesc#</td>
            		</tr>
		</cfoutput>
       	</table>
	<p><a href="login.cfm">Logout</a></p>
	</body>

</html>


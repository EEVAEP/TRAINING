
<cftry>
	<cfif NOT structKeyExists(session, "username") OR NOT structKeyExists(session, "role") OR (session.role NEQ 'admin' AND session.role NEQ 'editor')>
    		<cflocation url="./login.cfm">
	</cfif>

	<cfinclude template="./db.cfm">


	<cfquery name="qryPages" datasource="ans28">
    		SELECT pageid, pagename, pagedesc
    		FROM page
	</cfquery>

	<cfcatch>
		<cfdump var="#cfcatch#">
		
	</cfcatch>
</cftry>

<html>
    	<head>
        	<title>Admin Dashboard</title>
    	</head>
    	<body>
        	<h2 style="color:green;">Admin Dashboard</h2>
        	<h3>Welcome, to admin dashboard</h3>

        	<p><a href="add_page.cfm">Add New Page</a></p>

        	<table border="1">
            		<tr>
                		<th>Page Name</th>
                		<th>Description</th>
               	 		<th>Actions</th>
            		</tr>
            		<cfoutput query="qryPages">
            			<tr>
                			<td>#pagename#</td>
                			<td>#pagedesc#</td>
                			<td>
                    				<a href="edit_page.cfm?pageid=#pageid#">Edit</a> 
                    				<a href="delete_page.cfm?pageid=#pageid#">Delete</a>
                			</td>
            			</tr>
            		</cfoutput>
        	</table>
		<p><a href="login.cfm">Logout</a></p>
    	</body>
</html>

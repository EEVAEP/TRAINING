<cftry>
	<cfif NOT structKeyExists(session, "username") OR NOT structKeyExists(session, "role") OR (session.role NEQ 'admin' AND session.role NEQ 'editor')>
    		<cflocation url="./login.cfm">
	</cfif>
	

	<cfif structKeyExists(form, 'submit')>
		<cfset userService = createObject('component', 'components.db')>

		<cfset userService.addPage(form.pagename, form.pagedesc)>
		<cfset successMessage = "Page added successfully!">
		<cfoutput>"#successMessage#"</cfoutput>
	</cfif>


	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

<html>
	<head>
        	<title>Add Page</title>
    	</head>
    	<body>
        	<h2>Add New Page</h2>
		

        	<form method="POST" action="add_page.cfm">
            		Page Name: <input type="text" name="pagename" required><br><br>
            		Page Description: <textarea name="pagedesc" required></textarea><br><br>
            		<input type="submit" name="submit" value="Add Page">
        	</form>
		<p><a href="admindashboard.cfm">Back to Dashboard</a></p>
    	</body>
</html>

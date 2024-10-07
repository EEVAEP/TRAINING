<cftry>
	<cfinclude template="./db.cfm">

	<cfif structKeyExists(form, "submit")>

    		<cfquery datasource="ans28">
        		INSERT INTO page (pagename, pagedesc)
        		VALUES (
            			<cfqueryparam value="#form.pagename#" cfsqltype="cf_sql_varchar">,
            			<cfqueryparam value="#form.pagedesc#" cfsqltype="cf_sql_longvarchar">
        		)
    		</cfquery>
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

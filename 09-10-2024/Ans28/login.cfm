
<cfinclude template="db.cfm">

<cftry>
	<cfif structKeyExists(form, "submit")>
    		<cfset local.user = validateUser(form.username, form.password)> 

    		<cfif structKeyExists(local.user, "userid")>


			<cfquery name="qryRole" datasource="ans28">
                		SELECT role
                		FROM user
                		WHERE userid = <cfqueryparam value="#local.user.userid#" cfsqltype="cf_sql_integer">
            		</cfquery>

			<cfif qryRole.recordCount EQ 1>
        		<cflock scope="session" timeout="10">
            			<cfset session.username = local.user.username>
            			<cfset session.role = qryRole.role>
        		</cflock>

        		<cfif session.role EQ "admin" OR session.role EQ "editor">
            			<cflocation url="admindashboard.cfm">
        		<cfelse>
            			<cflocation url="userview_pages.cfm">
        		</cfif>
			<cfelse>
				<cfset errorMessage = "Invalid Role">
				<cfoutput>"#errorMessage#"</cfoutput>	
			</cfif>

    		<cfelse>
        		<cfset errorMessage = "Invalid Username, Password, or Role">
			<h4 style="color:red;"><cfoutput>"#errorMessage#"</cfoutput></h4>
    		</cfif>
	</cfif>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

<html>
    	<head>
        	<title>Login Page</title>
    	</head>
    	<body>
        	<h2 style="color:green;">Login Page</h2>

        
        	<form method="POST" action="login.cfm">
            		Username: <input type="text" name="username" required><br><br>
            		Password: <input type="password" name="password" required><br><br>
            		<!---Role:
            		<select name="role" required>
                		<option value="admin">Admin</option>
                		<option value="editor">Editor</option>
                		<option value="user">User</option>
            		</select><br><br>--->
            		<input type="submit" name="submit" value="Login">
        	</form>
    	</body>
</html>

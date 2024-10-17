
<cftry>
	<cfif structKeyExists(form, "submit")>
    		
		<cfset local.user = application.userService.validateUser(form.username, form.password)>

		<cfif structKeyExists(local.user, "username")>
        
			<cfset local.role = application.userService.getUserRole(local.user.userid)>
			
			<cfif len(local.role) GT 0>
				<cfdump var="#local.role#">
				<cfset session.username = local.user.username>
            			<cfset session.role = local.role>
        			
				<cfdump var="#session.role#">
				<cfif session.role EQ "admin" OR session.role EQ "editor">
            				<cflocation url="admindashboard.cfm" addtoken="false">
					
        			<cfelse>
            				<cflocation url="userview_pages.cfm" addtoken="false">
        			</cfif>
			<cfelse>
				<cfset errorMessage = "Invalid Role">
				<cfoutput>"#errorMessage#"</cfoutput>	
			</cfif>
		<cfelse>
        		<cfset errorMessage = "Invalid Username, Password, or Role">
			<h4><cfoutput>"#errorMessage#"</cfoutput></h4>
	
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

            		<input type="submit" name="submit" value="Login">
        	</form>
    	</body>
</html>

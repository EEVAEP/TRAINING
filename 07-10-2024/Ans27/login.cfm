
<cfinclude template="db.cfm">

<cfif structKeyExists(form, "submit")>
    
    	<cfif validateUser(form.username, form.password)>
        
        	<cfset session.username = form.username>
        	<cflocation url="welcome.cfm">
    	<cfelse>
        	<cfset errorMessage = "Invalid Username or Password">
		<cfoutput>"#errorMessage#"</cfoutput>
    	</cfif>
</cfif>

<html>
    <head>
        <title>Login Page</title>
    </head>
    <body>
        <h2>Login</h2>
        
        
        <form method="POST" action="login.cfm">
            Username: <input type="text" name="username" required><br><br>
            Password: <input type="password" name="password" required><br><br>
            <input type="submit" name="submit" value="Login">
        </form>
    </body>
</html>

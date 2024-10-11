

<cfif structKeyExists(form, "submit")>

   
    	<cfset userService = createObject("component", "components.db")> 
	
	<cfset local.user = userService.validateUser(form.username, form.password)>

	
	<cfif structKeyExists(local.user, "username") AND local.user.username EQ form.username>
   		<cfset session.username = local.user.username>
		<cfset session.userid = local.user.userid>
        	<cflocation url="welcome.cfm">
    	<cfelse>
        	<cfset errorMessage = "Invalid Username or Password">
        	<h3><cfoutput>#errorMessage#</cfoutput></h3>
    	</cfif>

</cfif>


<html>
    <head>
        <title>Login Page</title>
    </head>
    <body>

	<h1>CF TASK 27</h1>
        <h2>Login</h2>
	
        
        
        <form method="POST" action="login.cfm">
            Username: <input type="text" name="username" required><br><br>
            Password: <input type="password" name="password" required><br><br>
            <input type="submit" name="submit" value="Login">
        </form>
    </body>
</html>

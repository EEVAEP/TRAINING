
<cfif structKeyExists(form, 'submit')>
	
	<cfset local.result = application.userService.registerUser(form.username, form.password)>
		<cfif local.result.success>
            		<cfset successMessage = local.result.message>
			<h4><cfoutput>"#successMessage#"</cfoutput></h4>
			
    		<cfelse>
			<cfset errorMessage = local.result.message>
			<h4><cfoutput>"#errorMessage#"</cfoutput></h4>
		</cfif>


</cfif>

<html>
    <head>
        <title>Register</title>
    </head>
    <body>
	<h1>CF TASK 27</h1>
        <h3>Register</h3>
       
        <form method="POST" action="register.cfm">
            	Username: <input type="text" name="username" required pattern="[A-Za-z]+" title="Username should only contain letters (A-Z  or a-z), no spaces or special characters"><br><br>
            	Password: <input type="password" name="password" required minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
              				title="Must contain at least one number, one uppercase, one lowercase letter, and at least 8 or more characters"><br><br>
            	<input type="submit" name="submit" value="Register">
        </form>
    </body>
</html>

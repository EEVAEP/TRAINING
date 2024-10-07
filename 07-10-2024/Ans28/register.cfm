
<cfinclude template="db.cfm">

<cfif structKeyExists(form, "submit")>
	<cfif form.password EQ form.passwordConfirm>
        	<cfset local.registerSuccess = registerUser(form.username, form.password, form.role)>
        	<cfif local.registerSuccess>
            		<cfset successMessage = "Registration successful. Please log in.">
			<cfoutput>"#successMessage#"</cfoutput>
        	</cfif>
    	<cfelse>
        	<cfset errorMessage = "Passwords do not match.">
    	</cfif>
</cfif>

<html>
	<head>
        	<title>Register</title>
    	</head>
    	<body>
        	<h2>Register</h2>

        
        	<form method="POST" action="register.cfm">
            		Username: <input type="text" name="username" required><br><br>
            		Password: <input type="password" name="password" required><br><br>
            		Confirm Password: <input type="password" name="passwordConfirm" required><br><br>
            		Role: 
            		<select name="role" required>
                		<option value="admin">Admin</option>
                		<option value="editor">Editor</option>
                		<option value="user">User</option>
            		</select><br><br>
            		<input type="submit" name="submit" value="Register">
        	</form>
    	</body>
</html>

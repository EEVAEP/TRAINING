
<cfinclude template="db.cfm">

<cfif structKeyExists(form, "submit")>


	<cfquery name="qryCheckUser" datasource="ans28">
        	SELECT *
        	FROM user
        	WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    	</cfquery>

	<cfif qryCheckUser.recordCount EQ 0>
		<cfif form.password EQ form.passwordConfirm>
        		<cfset local.registerSuccess = registerUser(form.username, form.password, form.role)>
        		<cfif local.registerSuccess>
            			<cfset successMessage = "Registration successful. Please log in.">
				<h4 style="color:green;"><cfoutput>"#successMessage#"</cfoutput></h4>
				<cflocation url="login.cfm">
        		</cfif>
    			<cfelse>
        			<cfset errorMessage = "Passwords do not match.">
				<h4 style="color:green;"><cfoutput>"#errorMessage#"</cfoutput></h4>
    			</cfif>
		<cfelse>
        		<cfset errorMessage = "Username already exists. Please choose another.">
			<h4 style="color:red;"><cfoutput>#errorMessage#</cfoutput></h4>
			

    		</cfif>
	</cfif>

<html>
	<head>
        	<title>Register</title>
    	</head>
    	<body>
		<h1>CF TASK 28</h1>
        	<h2>Register</h2>

        
        	<form method="POST" action="register.cfm">
            		Username: <input type="text" name="username" required pattern="[A-Za-z]+" title="Username should only contain letters (A-Z  or a-z), no spaces or special characters"><br><br>
            		Password: <input type="password" name="password" required minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
              				title="Must contain at least one number, one uppercase, one lowercase letter, and at least 8 or more characters"><br><br>
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

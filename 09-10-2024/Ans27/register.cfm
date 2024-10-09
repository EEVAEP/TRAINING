
<cftry>
	<cfif structKeyExists(form, "submit")>
    		<cfinclude template="db.cfm">
    
    
    		<cfquery name="qryCheckUser" datasource="ans27">
        		SELECT *
        		FROM users
        		WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    		</cfquery>

    		<cfif qryCheckUser.recordCount EQ 0>
        
        		<cfset registerUser(form.username, form.password)>
        		<cfset successMessage = "Registration successful! Please login.">
			<h3 style="color:green"><cfoutput>#successMessage#</cfoutput></h3>
    		<cfelse>
        		<cfset errorMessage = "Username already exists. Please choose another.">
			<h4 style="color:red"><cfoutput>#errorMessage#</cfoutput></h4>

    		</cfif>
	</cfif>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

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

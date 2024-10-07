
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
			<cfoutput>#successMessage#</cfoutput>
    		<cfelse>
        		<cfset errorMessage = "Username already exists. Please choose another.">
			<cfoutput>#errorMessage#</cfoutput>

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
            	Username: <input type="text" name="username" required><br><br>
            	Password: <input type="password" name="password" required><br><br>
            	<input type="submit" name="submit" value="Register">
        </form>
    </body>
</html>

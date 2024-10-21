<cfcomponent>

	
	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
	</cffunction>

	

    	<cffunction name="validateUserInput" access="public" returntype="array">
        
        	
        	<cfargument name="fullname" type="string" required="true">
		<cfargument name="email" type="string" required="true">
        	<cfargument name="username" type="string" required="true">
        	<cfargument name="password" type="string" required="true">
        	<cfargument name="confirmPassword" type="string" required="true">

		
        
        
        	<cfset var errors = []>

        
        	<cfif len(trim(arguments.fullname)) EQ 0>
            		<cfset arrayAppend(errors, "*Fullname is required")>
        	<cfelseif NOT reFindNoCase("^[A-Za-z]+(\s[A-Za-z]+)?$", arguments.fullname)>
            		<cfset arrayAppend(errors, "*Enter a valid fullname")>
        	</cfif>

        
        	<cfif len(trim(arguments.email)) EQ 0>
            		<cfset arrayAppend(errors, "*Email is required")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", arguments.email)>
            		<cfset arrayAppend(errors, "*Enter a valid email")>
        	</cfif>

       
        	<cfif len(trim(arguments.username)) EQ 0>
            		<cfset arrayAppend(errors, "*Please enter the username")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z_][a-zA-Z0-9_]{3,13}$", arguments.username)>
            		<cfset arrayAppend(errors, "*Please enter a valid username")>
        	</cfif>

       
        	<cfif len(trim(arguments.password)) EQ 0>
            		<cfset arrayAppend(errors, "*Please enter the password")>
        	<cfelseif NOT reFindNoCase("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$", arguments.password)>
            		<cfset arrayAppend(errors, "*Please enter a valid password (minimum 8 characters, 1 lowercase, 1 uppercase, 1 special character)")>
        	</cfif>

        
        	<cfif len(trim(arguments.confirmPassword)) EQ 0>
        		<cfset arrayAppend(errors, "*Password confirmation is required")>
        	<cfelseif arguments.confirmPassword NEQ arguments.password>
            		<cfset arrayAppend(errors, "*Password confirmation does not match the password")>
        	</cfif>

        
        	<cfreturn errors>

    	</cffunction>



	


	<cffunction name="registerUser" returntype="struct">
    		<cfargument name="username" required="true" type="string">
    		<cfargument name="password" required="true" type="string">


		<cfset var local ={}>

		<cfquery name="qryCheckUser" datasource="ans27">
        		SELECT *
        		FROM users
        		WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    		</cfquery>

		<cfif qryCheckUser.recordCount EQ 0>
			<cfset local.hashedPassword = hashPassword(arguments.password)>

			<cfquery datasource="ans27">
        			INSERT INTO 
					users (username, password)
        			VALUES(
					<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            				<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        			)
    			</cfquery>
			<cfset local.result.success = true>
			<cfset local.result.message = "Registration successful. Please log in">

		<cfelse>
			<cfset local.result.success = false>
			<cfset local.result.message = "Username already exists. Please choose another one">


		</cfif>

		<cfreturn local.result>

	</cffunction>

	


	<cffunction name="validateUser" access="public" returntype="struct">
    		<cfargument name="username" required="true" type="string">
    		<cfargument name="password" required="true" type="string">
		
		<cfset var local={}>
    
        	<cfset local.hashedPassword = hashPassword(arguments.password)>
		
		<cfquery name="local.qryLogin" datasource="addressbook">
        		SELECT 
				id AS userid,
				username
        		FROM 
				register
        		WHERE 
				username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        		AND 
				password = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
    		</cfquery>
	
		<cfset local.result = {}>
		

    		<cfif local.qryLogin.recordCount EQ 1>
        		<cfset local.result.userid = local.qryLogin.userid>
			<cfset local.result.username = local.qryLogin.username>
		</cfif>
    		
		<cfreturn local.result>
	</cffunction>

</cfcomponent>




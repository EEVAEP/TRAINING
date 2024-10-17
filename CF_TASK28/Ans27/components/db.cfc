<cfcomponent>

	
	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
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
		<cfdump var="#local.hashedPassword#">

    
    		<cfquery name="local.qryLogin" datasource="ans27">
        		SELECT 
				id AS userid,
				username
        		FROM 
				users
        		WHERE 
				username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        		AND 
				password = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
    		</cfquery>

		<cfset local.result = {}>
		<cfdump var="#qryLogin#">

    		<cfif local.qryLogin.recordCount EQ 1>
        		<cfset local.result.userid = local.qryLogin.userid>
			<cfset local.result.username = local.qryLogin.username>
		</cfif>
    		
		<cfreturn local.result>
	</cffunction>

</cfcomponent>




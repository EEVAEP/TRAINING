<cfcomponent>

	
	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
	</cffunction>

	<cffunction name="checkmail" access="remote" returnformat="JSON" >
        	<cfargument name="email" type="string" required="true">
		<cfargument name="fullname" type="string" required="true">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
        
    		<cfset var local = {}>
		<cfset local.cleanEmail = trim(arguments.email)>

       
        	<cfquery datasource="addressbook" name="local.checkEmailQuery">
            		SELECT 
				COUNT(*) AS emailCount
            		FROM 
				register
            		WHERE 
				LOWER(email) = <cfqueryparam value="#lcase(local.cleanEmail)#" cfsqltype="cf_sql_varchar" maxlength="40">
        	</cfquery>

        	<cfif local.checkEmailQuery.emailCount GT 0>
            		<cfset local.result = "exists">
			<cfreturn local.result>
        	<cfelse>
            		<cfset local.result = "NotExists">
			<cfset local.hashedPassword = hashPassword(arguments.password)>

			<cfquery datasource="addressbook">
        			INSERT INTO 
					register (fullname, email, username, password)
        			VALUES(
					<cfqueryparam value="#arguments.fullname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            				<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        			)
    			</cfquery>
			<cfreturn local.result>
        	</cfif>
	</cffunction>

	


	<cffunction name="validateUser" access="public" returntype="struct">
    		<cfargument name="username" required="true" type="string">
    		<cfargument name="password" required="true" type="string">
		
		<cfset var local={}>
    
        	<cfset local.hashedPassword = hashPassword(arguments.password)>
		<cfdump var="#local.hashedPassword#">

    
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
		<cfdump var="#local.qryLogin#">

    		<cfif local.qryLogin.recordCount EQ 1>
        		<cfset local.result.userid = local.qryLogin.userid>
			<cfset local.result.username = local.qryLogin.username>
		</cfif>
    		
		<cfreturn local.result>
	</cffunction>

</cfcomponent>




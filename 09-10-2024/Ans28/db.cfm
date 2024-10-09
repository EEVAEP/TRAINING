
<cfparam name="dsn" default="ans28">
<cfparam name="dbUser" default="root">
<cfparam name="dbPassword" default="Tech@123">


<cffunction name="hashPassword" returntype="string">
    	<cfargument name="password" required="true" type="string">
    	<cfreturn hash(arguments.password, "SHA-512")>
</cffunction>


<cffunction name="registerUser" returntype="boolean">
    	<cfargument name="username" required="true" type="string">
    	<cfargument name="password" required="true" type="string">
    	<cfargument name="role" required="true" type="string">
    
    	<cfset local.hashedPassword = hashPassword(arguments.password)>

    	<cfquery datasource="ans28">
        	INSERT INTO user (username, pwd, role)
        	VALUES (
            		<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            		<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">,
            		<cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_varchar">
        	)
    	</cfquery>

    	<cfreturn true>
</cffunction>




<cffunction name="validateUser" returntype="struct">
    	<cfargument name="username" required="true" type="string">
    	<cfargument name="password" required="true" type="string">
    	<!---<cfargument name="role" required="true" type="string">---> 
    
    	<cfset local.hashedPassword = hashPassword(arguments.password)>
    
    	<cfquery name="qryUser" datasource="ans28">
        	SELECT userid, username, role
        	FROM user
        	WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        	AND pwd = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        	<!---AND role = <cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_varchar">---> 
    	</cfquery>
	

    	<cfset local.result = {}> 
    	<cfif qryUser.recordCount EQ 1>
        	<cfset local.result.userid = qryUser.userid>
        	<cfset local.result.username = qryUser.username>
        	<!---<cfset local.result.role = qryUser.role>--->
    	</cfif>

    	<cfreturn local.result> 
</cffunction>
	

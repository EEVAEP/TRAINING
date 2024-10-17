
<cfparam name="ans27" default="ans27">
<cfparam name="dbUser" default="root">
<cfparam name="dbPassword" default="Tech@123">


<cffunction name="hashPassword" returntype="string">
    	<cfargument name="password" required="true" type="string">
    	<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    	<cfreturn local.hashedPassword>
</cffunction>


<cffunction name="registerUser" returntype="void">
    	<cfargument name="username" required="true" type="string">
    	<cfargument name="password" required="true" type="string">
    
    
    	<cfset local.hashedPassword = hashPassword(arguments.password)>

    
    	<cfquery datasource="ans27">
        	INSERT INTO users (username, password)
        	VALUES (
            		<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            		<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        	)
    	</cfquery>
</cffunction>


<cffunction name="validateUser" returntype="boolean">
    	<cfargument name="username" required="true" type="string">
    	<cfargument name="password" required="true" type="string">
    
        <cfset local.hashedPassword = hashPassword(arguments.password)>

    
    	<cfquery name="qryLogin" datasource="ans27">
        	SELECT *
        	FROM users
        	WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        	AND password = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
    	</cfquery>

    	<cfif qryLogin.recordCount EQ 1>
        	<cfreturn true>
    	<cfelse>
        	<cfreturn false>
    	</cfif>
</cffunction>



<!--- USE user_authentication;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);--->


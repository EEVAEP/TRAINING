<cfcomponent>

	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
	</cffunction>


	<cffunction name="registerUser" access="public" returntype="struct">
    		<cfargument name="username" required="true" type="string">
    		<cfargument name="password" required="true" type="string">
    		<cfargument name="role" required="true" type="string">
		
		<cfset var local={}>

		<cfquery name="local.qryCheckUser" datasource="ans28">
        		SELECT 
				*
        		FROM 
				user
        		WHERE 
				username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
    		</cfquery>

		<cfif qryCheckUser.recordCount EQ 0>
			<cfset local.hashedPassword = hashPassword(arguments.password)>
			<cfquery datasource="ans28">
        			INSERT INTO 
					user (username, pwd, role)
        			VALUES(
					<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            				<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">,
            				<cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_varchar">
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
    
    		<cfquery name="local.qryUser" datasource="ans28">
        		SELECT
				userid,
				username, 
				role
        		FROM 
				user
        		WHERE 
				username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        		AND 
				pwd = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        	</cfquery>
	

    		<cfset local.result = {}> 

    		<cfif local.qryUser.recordCount EQ 1>
        		<cfset local.result.userid = qryUser.userid>
        		<cfset local.result.username = qryUser.username>
		<cfelse>
			<cfset local.result = {}>
		</cfif>

    		<cfreturn local.result> 
	</cffunction>
	

	<cffunction name = "getUserRole" access="public" returntype = "string">
		<cfargument name = "userid" required = "true" type="numeric">
	
		<cfquery name="qryRole" datasource="ans28">
               		SELECT 
				role
                	FROM 
				user
                	WHERE 
				userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            	</cfquery>
		<cfdump var = "#qryRole#">

		<cfif qryRole.recordCount EQ 1>
			<cfreturn qryRole.role>
			
		<cfelse>
			<cfreturn "">
		</cfif>
	</cffunction>


	<cffunction name = "getPages" access= "public" returntype="query">
		<cfset var local = {}>
		<cfquery name="local.qryPages" datasource="ans28">
    			SELECT pageid, pagename, pagedesc
    			FROM page
		</cfquery>

		<cfreturn local.qryPages>

	</cffunction>

	<cffunction name="addPage" access="public" returntype="void">
		<cfargument name="pagename" required="true" type="string">
		<cfargument name="pagedesc" required="true" type="string">


		<cfquery datasource="ans28">
        		INSERT INTO 
				page (pagename, pagedesc)
        		VALUES (
	
            			<cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
            			<cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_longvarchar">
        		)
    		</cfquery>

	</cffunction>


	<cffunction name="getPageById" access="public" returntype="query">
		<cfargument name="pageid" required="true" type="numeric">
		
		<cfquery name="qryPage" datasource="ans28">
            		SELECT 
				pagename,
				pagedesc
            		FROM 
				page
            		WHERE 
				pageid = <cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">
        	</cfquery>
		
		<cfreturn qryPage>

	</cffunction>


	<cffunction name="updatePage" access="public" returntype="void">
        	<cfargument name="pageid" required="true" type="numeric">
        	<cfargument name="pagename" required="true" type="string">
        	<cfargument name="pagedesc" required="true" type="string">

        	<cfquery datasource="ans28">
            		UPDATE 
				page
            		SET 
				pagename = <cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
                		pagedesc = <cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_longvarchar">
            		WHERE 
				pageid = <cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">
        	</cfquery>
    	</cffunction>


	
    	<cffunction name="deletePage" access="public" returntype="void">
        	<cfargument name="pageid" required="true" type="numeric">
		

        	<cfquery datasource="ans28">
            		DELETE 
			FROM 
				page
            		WHERE 
				pageid = <cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">
        	</cfquery>

    	</cffunction>
	

</cfcomponent>	

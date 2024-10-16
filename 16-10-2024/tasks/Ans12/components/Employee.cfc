<cfcomponent>

	<cffunction name="getAllEmployees" returntype="query" access="public">
		
		<cfquery name="local.EmpDetails" datasource="task28">
            		SELECT firstname, lastname
            		FROM persondetails
        	</cfquery>
        	<cfreturn local.EmpDetails>
    	</cffunction>

    
    	<cffunction name="getNthEmployee" returntype="query" access="public">
        	<cfargument name="rowNum" type="numeric" required="true">

        		<cfquery name="local.nthRow" datasource="task28">
            			SELECT firstname
            			FROM persondetails
            			ORDER BY firstname
            			LIMIT #arguments.rowNum - 1#, 1
        		</cfquery>
        	<cfreturn local.nthRow>
    	</cffunction>

</cfcomponent>





<cfcomponent>
	
	<cffunction name="generateQuery" returntype="query" access="public">
        	<cfset var local = {}>

        
        	<cfset local.myQuery = queryNew("ID,Name,email", "integer,varchar,varchar")>

       
        	<cfset queryAddRow(local.myQuery, 3)>

        
        	<cfset querySetCell(local.myQuery, "ID", 1, 1)>
        	<cfset querySetCell(local.myQuery, "Name", "Megha Sara", 1)>
        	<cfset querySetCell(local.myQuery, "email", "meghasara@gmail.com", 1)>

        
        	<cfset querySetCell(local.myQuery, "ID", 2, 2)>
        	<cfset querySetCell(local.myQuery, "Name", "Shan Shaji", 2)>
        	<cfset querySetCell(local.myQuery, "email", "shan123@gmail.com", 2)>

        
        	<cfset querySetCell(local.myQuery, "ID", 3, 3)>
        	<cfset querySetCell(local.myQuery, "Name", "Ananya S", 3)>
        	<cfset querySetCell(local.myQuery, "email", "ananyas@gmail.com", 3)>

        
        	<cfreturn local.myQuery>
    	</cffunction>

</cfcomponent>

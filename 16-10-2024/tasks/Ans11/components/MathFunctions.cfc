<cfcomponent displayname="MathFunctions" output="false">
	<cffunction name="multiply" access="public" returntype="numeric" output="false">
        	<cfargument name="args" type="array" required="true">
        
        	<cfset var local = {}>         
		<cfset local.result = 1>

        	<cfloop index="i" from="1" to="#arrayLen(arguments.args)#">
            		<cfset local.result *= arguments.args[i]> 
        	</cfloop>

        	<cfreturn local.result> 
    	</cffunction>

</cfcomponent>

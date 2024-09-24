
<cfcomponent displayname="Multiplication" hint="This component multiplies given numbers.">
	<cffunction name="multiply" access="public" returntype="numeric" output="false" hint="Multiplies the numbers passed as arguments.">
        	<cfargument name="a" type="numeric" required="false" default="1">
        	<cfargument name="b" type="numeric" required="false" default="1">
        	<cfargument name="c" type="numeric" required="false" default="1">
        	<cfargument name="d" type="numeric" required="false" default="1">
        
        
        	<cfset var result = 1>

       
        	<cfloop index="i" from="1" to="#arrayLen(arguments)#">
            		<cfset result = result * arguments[i]>
        	</cfloop>
        
     
        	<cfreturn result>
    </cffunction>

</cfcomponent>

<cffunction name="multiply" access="public" returntype="numeric" output="false">
	<cfargument name="args" type="array" required="true">
    
    	<cfset var result = 1>

    
    	<cfloop index="i" from="1" to="#arrayLen(arguments.args)#">
        	<cfset result *= arguments.args[i]> 
    	</cfloop>

    	<cfreturn result> 
</cffunction>

<h1>Mutiply...Output</h1>

<cfset res = multiply([1, 2])>
<cfdump var="#res#" label="Result of multiply(1, 2)"><br>

<cfset res = multiply([1, 2, 3])>
<cfdump var="#res#" label="Result of multiply(1, 2, 3)"><br>

<cfset res = multiply([1, 2, 3, 4])>
<cfdump var="#res#" label="Result of multiply(1, 2, 3, 4)">

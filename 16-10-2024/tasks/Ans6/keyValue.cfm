

<cfif structKeyExists(form, "forkey") AND structKeyExists(form, "forvalue")>
	<cfset userStructure = structNew()>
    	<cfset structInsert(userStructure, form.forkey, form.forvalue)>

   
    	<h3>Structure:</h3>
    	<cfdump var="#userStructure#">
</cfif>


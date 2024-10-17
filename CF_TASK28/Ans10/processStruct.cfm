

<cfif NOT structKeyExists(session, "myStruct")>
    <cfset session.myStruct = structNew()>
</cfif>

<cfset myStruct = session.myStruct>

 
<cfif structKeyExists(form, "submit") AND structKeyExists(form, "key") AND structKeyExists(form, "value")>
        <cfset myStruct[form.key] = form.value>

	<cfset sortedKeys = StructKeyArray(myStruct)>


	<cfset arraySort(sortedKeys, "textnocase", "asc")>

   
    	<cfset orderedStruct = structNew()>
    	<cfloop array="#sortedKeys#" index="key">
        	<cfset orderedStruct[key] = myStruct[key]>
    	</cfloop>

    
    	<cfset session.myStruct = orderedStruct>

       
	<cfoutput>
    		<h2>Output:</h2>
    		<cfdump var="#session.myStruct#">
	</cfoutput>
</cfif>










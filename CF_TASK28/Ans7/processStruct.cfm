

<cfif NOT structKeyExists(session, "myStruct")>
    <cfset session.myStruct = structNew()>
</cfif>

<cfset myStruct = session.myStruct>

 
<cfif structKeyExists(form, "submit") AND structKeyExists(form, "key") AND structKeyExists(form, "value")>
        <cfset myStruct[form.key] = form.value>

        <cfset session.myStruct = myStruct>

	<cfoutput>
    		<h2>Output:</h2>
    		<cfdump var="#session.myStruct#">
	</cfoutput>
</cfif>










<cfapplication name="KeyValueApp" sessionManagement="true" sessionTimeout="#createTimeSpan(0,0,30,0)#">


<cfif NOT structKeyExists(session, "keyValueStruct")>
   	<cfset session.keyValueStruct = structNew()>
</cfif>

<cfset keyValueStruct = session.keyValueStruct>


<cfif structKeyExists(form, "key") AND structKeyExists(form, "value")>
    
	<cfset key = trim(form.key)>
    	<cfset value = trim(form.value)>

        <cfif structKeyExists(keyValueStruct, key)>
        
        <cfoutput>
            <p style="color: red;">'#key#' already present. Cannot add again.</p>
        </cfoutput>
    	<cfelse>
                <cfset keyValueStruct[key] = value>

        
        	<cfset session.keyValueStruct = keyValueStruct>

                <cfoutput>
            		<p style="color: green;">'#key#' added successfully.</p>
        	</cfoutput>
    	</cfif>
</cfif>


<cfoutput>
    <h2>Output:</h2>
    <cfdump var="#session.keyValueStruct#">
</cfoutput>

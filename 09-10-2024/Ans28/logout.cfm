<!---<cflock scope="session" timeout="5">
    	<cfset structClear(session)>
</cflock>--->


<cfset structClear(session)>
<cflocation url="login.cfm">

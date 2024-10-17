<cflock scope="session" timeout="10">
    	<cfset structClear(session)>
</cflock>

<cflocation url="login.cfm">

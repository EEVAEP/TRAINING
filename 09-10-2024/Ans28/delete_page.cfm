
<cfif session.role NEQ "admin" AND session.role NEQ "editor">
    	<cfoutput>You do not have permission to delete pages.</cfoutput>
	<cflocation url="./login.cfm">
    	
</cfif>


<cfif structKeyExists(url, "pageid") AND IsNumeric(url.pageid)>
	<cfquery name="qryPage" datasource="ans28">
        	SELECT pageid, pagename
        	FROM page
        	WHERE pageid = <cfqueryparam value="#url.pageid#" cfsqltype="cf_sql_integer">
    	</cfquery>

   
    	<cfif qryPage.RecordCount EQ 1>
        	<cfquery datasource="ans28">
            		DELETE FROM page
            		WHERE pageid = <cfqueryparam value="#url.pageid#" cfsqltype="cf_sql_integer">
        	</cfquery>
        	<cfoutput>Page <strong>#qryPage.pagename#</strong> has been successfully deleted.</cfoutput>
        	<a href="admindashboard.cfm">Go Back to Dashboard</a>
    	<cfelse>
        	<cfoutput>Page not found.</cfoutput>
    	</cfif>

<cfelse>
    <cfoutput>You do not have permission to this page</cfoutput>
</cfif>

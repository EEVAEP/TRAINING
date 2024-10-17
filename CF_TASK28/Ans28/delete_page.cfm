<cfif session.role NEQ "admin" AND session.role NEQ "editor">
    	<cfoutput>{"error": "You do not have permission to delete pages."}</cfoutput>
    	<cfexit>
</cfif>

<cfif structKeyExists(form, "pageid") AND IsNumeric(form.pageid)>
	
    	<cfset application.userService.deletePage(form.pageid)>
    	<cfoutput>Page deleted successfully!</cfoutput>
	<cfelse>
    		<cfoutput>Invalid Page ID.</cfoutput>
</cfif>


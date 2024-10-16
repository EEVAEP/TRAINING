
<cftry>
	<cfif NOT structKeyExists(session, "username") OR NOT structKeyExists(session, "role") OR (session.role NEQ 'admin' AND session.role NEQ 'editor')>
        	<cflocation url="./login.cfm" addtoken="false">
    	</cfif>

    
    	<cfif structKeyExists(url, "pageid") AND isNumeric(url.pageid)>
        
        	

        	<cfset qryPage = application.userService.getPageById(url.pageid)>

        
        	<cfif qryPage.RecordCount EQ 1>
           
            	<cfif structKeyExists(form, "submit") AND structKeyExists(url, "pageid")>
                	<cfoutput>"#url.pageid#"</cfoutput>

                
                	<cfset application.userService.updatePage(url.pageid, form.pagename, form.pagedesc)>

                	<cfset result="Page updated successfully">
                	<cfoutput>"#result#"</cfoutput>
                
                
                	<cflocation url="admindashboard.cfm" addtoken="false">
            
            
            	<cfelse>
                	<form method="POST" action="">
                    		<h1>Edit Page</h1>
                    		<input type="hidden" name="pageid" value="#url.pageid#">

                    		Page Name: <input type="text" name="pagename" value="<cfoutput>#qryPage.pagename#</cfoutput>" required><br><br><br>
                    		Page Description: <textarea name="pagedesc" required><cfoutput>#qryPage.pagedesc#</cfoutput></textarea><br><br>

                    		<input type="submit" name="submit" value="Update Page">
                	</form>
                		<p><a href="admindashboard.cfm">Back to Dashboard</a></p>
            	</cfif>
       
        	<cfelse>
            		<cfoutput>Page not found.</cfoutput>
        	</cfif>
    
    <cfelse>
        	<cfoutput>Invalid Page ID.</cfoutput>
    </cfif>

    <cfcatch>
        <cfdump var="#cfcatch#">
    </cfcatch>
</cftry>







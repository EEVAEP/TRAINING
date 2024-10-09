


<cfcomponent output="false">
   
    	<cfset this.name = "CMSApp">
    	<cfset this.applicationTimeout = createTimeSpan(0, 2, 0, 0)>
    	<cfset this.sessionManagement = true>
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 5, 0)> 
    	<cfset this.setClientCookies = true>
    	<cfset this.loginPage = "login.cfm">

    
    	<cffunction name="onApplicationStart" returnType="boolean" output="false">
        	<cfset application.started = now()>
        	<cfreturn true>
    	</cffunction>

    
    	<cffunction name="onSessionStart" returnType="void" output="false">
        
        	<cfset session.username = "">
        	<cfset session.role = "">
    	</cffunction>

    
    	<cffunction name="onRequestStart" returnType="void" output="false">
        	<cfargument name="targetPage" type="string" required="true">

        
        	<cfif listFindNoCase("admindashboard.cfm", arguments.targetPage)>
           
            		<cfif NOT structKeyExists(session, "username") OR NOT structKeyExists(session, "role") OR (session.role NEQ "admin" AND session.role NEQ "editor")>
                		<cflocation url="#this.loginPage#" addtoken="false">
            		</cfif>
        	</cfif>
    	</cffunction>

    
</cfcomponent>





<cfcomponent output="false">
	
	<cfset this.name = "UserAuthenticationApp"> <!-- Your application name -->
    	<cfset this.applicationTimeout = createTimeSpan(1, 0, 0, 0)> <!-- Application timeout: 1 day -->
    	<cfset this.sessionManagement = true> <!-- Enable session management -->
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> <!-- Session timeout: 30 minutes -->
    	<cfset this.setClientCookies = true> <!-- Enable automatic session cookies -->
    
    	<cffunction name="onApplicationStart" returnType="boolean">
        
        	<cfreturn true>
    	</cffunction>

    	<cffunction name="onSessionStart" returnType="void">
        </cffunction>

    	<cffunction name="onSessionEnd" returnType="void">
        	<cfargument name="sessionScope" type="struct" required="true">
        	<cfargument name="appScope" type="struct" required="true">
        
    	</cffunction>
    
</cfcomponent>

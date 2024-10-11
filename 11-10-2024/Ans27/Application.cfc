
<cfcomponent output="false">
	
	<cfset this.name = "UserAuthenticationApp"> 
    	<cfset this.applicationTimeout = createTimeSpan(1, 0, 0, 0)> 
    	<cfset this.sessionManagement = true> 
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> >
    	<cfset this.setClientCookies = true> 
    
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

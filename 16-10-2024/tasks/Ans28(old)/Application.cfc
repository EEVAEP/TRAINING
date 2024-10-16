<cfcomponent output="false">
   
    	<cfset this.name = "CMSApp">
    	<cfset this.applicationTimeout = createTimeSpan(0, 2, 0, 0)>
    	<cfset this.sessionManagement = true>
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> 
    	<cfset this.setClientCookies = true>
    	

    
    	<cffunction name="onApplicationStart" returnType="boolean">
        	<cfset application.userService = createObject('component', 'components.db')>
        	<cfreturn true>
    	</cffunction>

    
    	<cffunction name="onSessionStart" returnType="void" output="false">
        	<cfset session.username = "">
        	<cfset session.role = "">
    	</cffunction>

</cfcomponent>




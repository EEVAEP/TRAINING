
<cfcomponent output="false">
	
	<cfset this.name = "AddressBookAuthentication"> 
    	<cfset this.applicationTimeout = createTimeSpan(1, 0, 0, 0)> 
    	<cfset this.sessionManagement = true> 
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> >
    	<cfset this.setClientCookies = true> 
    
    	<cffunction name="onApplicationStart" returnType="boolean">
		<cfset application.userService = createObject("component","components.db")>
        	<cfreturn true>
    	</cffunction>

</cfcomponent>

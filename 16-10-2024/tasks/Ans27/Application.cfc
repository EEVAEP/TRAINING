
<cfcomponent output="false">
	
	<cfset this.name = "UserAuthenticationApp"> 
    	<cfset this.applicationTimeout = createTimeSpan(1, 0, 0, 0)> 
    	<cfset this.sessionManagement = true> 
    	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> >
    	<cfset this.setClientCookies = true> 
    
    	<cffunction name="onApplicationStart" returnType="boolean">
		<cfset application.userService = createObject("component","components.db")>
        	<cfreturn true>
    	</cffunction>

	<cffunction name="onRequestStart" returnType="void" output="false">
        	<cfargument name="targetPage" type="string" required="true">

        	<cfif NOT structKeyExists(session, "username") AND (listLast(arguments.targetPage, "/") != "login.cfm")>
			<cflocation url="./login.cfm" addtoken="false">
		</cfif>
        	
    	</cffunction>

</cfcomponent>

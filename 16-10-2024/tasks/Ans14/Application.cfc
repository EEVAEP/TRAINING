<cfcomponent>
	<cfset this.name = "MyApplication"> 
    	<cfset this.sessionManagement = true> 
    	<cfset this.sessionTimeout = createDateTime(2024, 10, 3, 0, 0, 0)> 

    	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.imageUploader = createObject('component', 'components.ImageUploader')>

        	<cfreturn true> 
    	</cffunction>

    	<cffunction name="onSessionStart">
        
        	<cfset session.imageName = ""> 
        	<cfset session.description = ""> 
    	</cffunction>

</cfcomponent>

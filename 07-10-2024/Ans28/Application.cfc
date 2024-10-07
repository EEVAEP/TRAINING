<!-- Application.cfc -->
<cfcomponent output="false">

    <cfset this.name = "SimpleCMS">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)> <!-- Session expires in 30 minutes -->

</cfcomponent>

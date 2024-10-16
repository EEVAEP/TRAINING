<cfcomponent>
    	<cfset this.name = "cf_captcha_app">
    	<cfset this.sessionManagement = true>

	<cffunction name="onApplicationStart" returnType="boolean">
		<cfset application.local.captchaChecker = createObject("component", "components.CaptchaChecker")>
		<cfreturn true>

	</cffunction>


</cfcomponent>

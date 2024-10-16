<cfcomponent displayName="CaptchaChecker">

	<cffunction name="validateCaptcha" access="public" returntype="boolean">

        	<cfargument name="enteredCaptcha" type="string" required="true">
        	<cfargument name="captchaKey" type="string" required="true">

       
        	<cfset local.hashedEnteredCaptcha = Hash(arguments.enteredCaptcha, "SHA-256")>
		<cfreturn (local.hashedEnteredCaptcha EQ arguments.captchaKey)>
    	</cffunction>

       <cffunction name="validateEmail" access="public" returntype="boolean">
        	<cfargument name="email" type="string" required="true">

        
        	<cfset var local = {}>

        
        	<cfset local.isValidEmail = isValid("email", arguments.email)>
		<cfreturn local.isValidEmail>
    	</cffunction>

</cfcomponent>

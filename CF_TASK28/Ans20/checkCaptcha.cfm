<cfif structKeyExists(form, "email")>
	
    	<cfset local.enteredCaptcha = form.captcha>
    	<cfset local.enteredEmail = form.email>
    	<cfset local.captchaKey = session.captchaKey>


	<cfoutput>
		#local.enteredCaptcha#
		#local.enteredEmail#
		#local.CaptchaKey#
	</cfoutput>

    	
    	
        <cfset local.isCaptchaValid = application.local.captchaChecker.validateCaptcha(local.enteredCaptcha, local.captchaKey)>

    
    	<cfset local.isEmailValid = application.local.captchaChecker.validateEmail(local.enteredEmail)>

   
    	<cfif local.isCaptchaValid AND local.isEmailValid>
        	<cfset local.message = "Email Address successfully subscribed to our newsletter.">
    	<cfelse>
        	<cfset local.message = "Invalid Captcha or Email. Please try again.">
    	</cfif>
	
</cfif>

<h2>Subscription Result</h2>

<cfif isDefined("local.message")>
    	<cfoutput>
        	<p>#local.message#</p>
    	</cfoutput>
</cfif>

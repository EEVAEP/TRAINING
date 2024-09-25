

<cfif structKeyExists(form, "submit")>
	<cfset captchaValid = form.captchaText eq form.hiddenCaptchakey>

    	<cfset emailValid = reFindNoCase("^[\w\.\-]+@[a-zA-Z\d\-]+\.[a-zA-Z]{2,}$", form.email)>

    	<cfif captchaValid and emailValid>
        	<cfoutput>
            		<p style="color:green;">Email Address successfully subscribed to our newsletter.</p>
        	</cfoutput>
    	<cfelse>
        	<cfoutput>
            		<p style="color:red;">Invalid captcha or email. Please try again.</p>
        	</cfoutput>

    	</cfif>
</cfif>








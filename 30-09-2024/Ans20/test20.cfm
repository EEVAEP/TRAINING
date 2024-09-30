<cfif structKeyExists(form, "email")>
	<cfset enteredCaptcha = form.captcha>
    	<cfset enteredEmail = form.email>
    	<cfset captchaKey = session.captchaKey>

	<cfdump var="#enteredCaptcha#"><br>
	<cfdump var="#enteredEmail#"><br>
	<cfdump var="#captchaKey#"><br>
	
    
    	<!-- Hash the entered captcha to compare with stored hashed value -->
    	<cfset hashedEnteredCaptcha = Hash(enteredCaptcha, "SHA-256")>

	
    	<cfif hashedEnteredCaptcha EQ captchaKey AND isValid("email", form.email)>
        	<cfset message = "Email Address successfully subscribed to our newsletter.">
		
   	 <cfelse>
        	<cfset message = "Invalid Captcha. Please try again.">
		    	</cfif>
</cfif>




<h2>Subscription Result</h2>

<cfif isDefined("message")>
	<cfoutput>
		<p >#message#</p>
	</cfoutput>
</cfif>

 
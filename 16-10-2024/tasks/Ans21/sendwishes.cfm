<cfparam name="form.babyName" default="">
<cfparam name="form.emailId" default="">
<cfparam name="form.birthdayWishes" default="">

<cfoutput>
	<p>Baby Name: #form.babyName#</p>
    	<p>Email: #form.emailId#</p>
    	<p>Birthday Wishes: #form.birthdayWishes#</p>
</cfoutput>

<cfif structKeyExists(form, 'greetingImage')>
	<cftry>
	

    	<cfset local.uploadPath = ExpandPath('./uploads/')>
	<cfdump var="#local.uploadPath#">

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	</cftry>

   	<cfset local.birthdayWishes = createObject("component", "components.BirthdayWishes")>
	<cfset local.uploadedFilePath = local.birthdayWishes.uploadFile("greetingImage", local.uploadPath)>
	<cfdump var="#local.uploadedFilePath#">

    
    	<cfset local.birthdayWishes.sendEmail(form.emailId, form.babyName, form.birthdayWishes, local.uploadedFilePath)>

    
    	<cfoutput>
        	<h3>Birthday wishes have been sent successfully!</h3>
    	</cfoutput>
	<cfelse>
        	<cfoutput>
        		<h3>There was an issue. Please try again.</h3>
    		</cfoutput>
</cfif>






<cfparam name="form.rating" default="0">


<cfif form.rating GT 0 AND form.rating LTE 5>
    <cfswitch expression="#form.rating#">
        <cfcase value="5">
            <cfset message = "Very Good">
        </cfcase>
        <cfcase value="4">
            <cfset message = "Good">
        </cfcase>
        <cfcase value="3">
            <cfset message = "Fair">
        </cfcase>
        <cfcase value="2">
            <cfset message = "Ok">
        </cfcase>
        <cfcase value="1">
            <cfset message = "Ok">
        </cfcase>
        <cfdefaultcase>
            <cfset message = "Invalid input. Please enter a number between 1 and 5.">
        </cfdefaultcase>
    </cfswitch>
<cfelse>
    <cfset message = "Invalid input. Please enter a number between 1 and 5.">
</cfif>

<h2>Your Rating is:</h2>
<h3><cfoutput>#message#</cfoutput></h3>

<cfparam name="form.rating" default="0">


<cfif form.rating GT 0 AND form.rating LTE 5>
    <cfif form.rating EQ 5>
        <cfset message = "Very good">
    <cfelseif form.rating EQ 4>
        <cfset message = "Good">
    <cfelseif form.rating EQ 3>
        <cfset message = "Fair">
    <cfelseif form.rating EQ 1 OR form.rating EQ 2>
        <cfset message = "Ok">
    <cfelse>
        <cfset message = "Invalid input. Please enter a number between 1 and 5.">
    </cfif>
<cfelse>
    <cfset message = "Invalid input. Please enter a number between 1 and 5.">
</cfif>


<h2>Your Rating is:</h2>
<h3><cfoutput>#message#</cfoutput></h3>




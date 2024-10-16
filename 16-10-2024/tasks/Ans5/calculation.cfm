<cfif structKeyExists(form, "userDob") AND structKeyExists(form, "motherDob")>
	<cfset userDob = parseDateTime(form.userDob)>
       	<cfset motherDob = parseDateTime(form.motherDob)>
        
        
       <cfset currentDate = Now()>

        
       <cfset userAge = Year(currentDate) - Year(userDob)>
       <cfif Month(currentDate) LT Month(userDob) OR (Month(currentDate) EQ Month(userDob) AND Day(currentDate) LT Day(userDob))>
            	<cfset userAge = userAge - 1>
        </cfif>

        
        <cfset motherAgeWhenUserBorn = Year(userDob) - Year(motherDob)>
        <cfif Month(userDob) LT Month(motherDob) OR (Month(userDob) EQ Month(motherDob) AND Day(userDob) LT Day(motherDob))>
        	<cfset motherAgeWhenUserBorn = motherAgeWhenUserBorn - 1>
        </cfif>


       
        <cfset userNextBirthday = CreateDate(Year(currentDate), Month(userDob), Day(userDob))>
        <cfif DateDiff("d", currentDate, userNextBirthday) LT 0>
        	<cfset userNextBirthday = DateAdd("yyyy", 1, userNextBirthday)>
        </cfif>
       	<cfset daysUntilUserBirthday = DateDiff("d", currentDate, userNextBirthday)>


       
       	<cfset motherNextBirthday = CreateDate(Year(currentDate), Month(motherDob), Day(motherDob))>
        <cfif DateDiff("d", currentDate, motherNextBirthday) LT 0>
            	<cfset motherNextBirthday = DateAdd("yyyy", 1, motherNextBirthday)>
        </cfif>
        <cfset daysUntilMotherBirthday = DateDiff("d", currentDate, motherNextBirthday)>


	<h2>Output:</h2>
			<cfoutput>
        			<p>Your Age: <strong>#userAge#</strong> years</p>
        			<p>Your Mother was <strong>#motherAgeWhenUserBorn#</strong> years old when you were born.</p>
        			<p>Days Remaining for Your Next Birthday: <strong>#daysUntilUserBirthday#</strong> days</p>
        			<p>Days Remaining for Your Mother's Next Birthday: <strong>#daysUntilMotherBirthday#</strong> days</p>
			</cfoutput>

</cfif>
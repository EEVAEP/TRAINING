<cfparam name="form.numbers" default="">

<cfoutput>
    <h2>Numbers Divisible by 3:</h2>
    <ul>
        
        <cfset numberList = ListToArray(form.numbers)>

        
        <cfloop index="num" array="#numberList#">
           
            <cfset num = Trim(num)>

           
            <cfif NOT IsNumeric(num)>
                <cfcontinue>
            </cfif>

            
            <cfif (num MOD 3) EQ 0>
                <li>#num#</li>
            <cfelse>
                
                <cfcontinue>
            </cfif>
		
        </cfloop>
    </ul>
</cfoutput>

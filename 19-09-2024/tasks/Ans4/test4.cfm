
<cfset currentDate = Now() />
<cfset today = DateFormat(currentDate, "dd-mmm-yyyy") />
<cfset currentMonthNumeric = Month(currentDate) />
<cfset currentMonthWord = MonthName(Month(currentDate)) />
<cfset lastFriday = DateAdd("d", -((DayOfWeek(currentDate) + 1) mod 7 + 2), currentDate) />
<cfset lastDayOfMonth = CreateDate(Year(currentDate), Month(currentDate) + 1, 1) - 1 />
<cfset lastFiveDays = [] />


<cfloop from="0" to="4" index="i">
    <cfset dateValue = DateAdd("d", -i, currentDate) />
    <cfset arrayAppend(lastFiveDays, dateValue) />
</cfloop>

<!-- Display Details -->
<p>Today's Date: #today#</p>
<p>Current Month (Numeric): #currentMonthNumeric#</p>
<p>Current Month (Word): #currentMonthWord#</p>
<p>Last Friday Date: #DateFormat(lastFriday, "dd-mmm-yyyy")#</p>
<p>Last Day of Month: #DateFormat(lastDayOfMonth, "dd-mmm-yyyy")#</p>

<h2>Last 5 Days:</h2>
<ul>
    <cfloop array="#lastFiveDays#" index="day">
        <cfset dayName = DayOfWeekName(day) />
        <cfset dayColorClass = "" />
        <cfif dayName EQ "Sunday"> <cfset dayColorClass = "sunday" />
        <cfelseif dayName EQ "Monday"> <cfset dayColorClass = "monday" />
        <cfelseif dayName EQ "Tuesday"> <cfset dayColorClass = "tuesday" />
        <cfelseif dayName EQ "Wednesday"> <cfset dayColorClass = "wednesday" />
        <cfelseif dayName EQ "Thursday"> <cfset dayColorClass = "thursday" />
        <cfelseif dayName EQ "Friday"> <cfset dayColorClass = "friday" />
        <cfelseif dayName EQ "Saturday"> <cfset dayColorClass = "saturday" />
        </cfif>
        <li class="#dayColorClass#">#DateFormat(day, "dd-mmm-yyyy")# - #dayName#</li>
    </cfloop>
</ul>

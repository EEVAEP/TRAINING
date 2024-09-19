<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Date Display</title>
    		<style>
        		.sunday { color: red; }
        		.monday { color: green; }
        		.tuesday { color: orange; }
        		.wednesday { color: yellow; }
        		.thursday { font-weight: bold; color: black; }
        		.friday { color: blue; }
        		.saturday { font-weight: bold; color: red; }
    		</style>
	</head>
	<body>
    		<h1>Date Details</h1>
    
    		<cfset currentDate = Now() >
		<cfset today = DateFormat(currentDate, "dd-mmm-yyyy")>
		<cfoutput><p>Today's Date: #today#</p></cfoutput>

    		
		<cfset currentMonthNumeric = Month(currentDate)>
		<cfoutput><p>Current Month (Numeric): #currentMonthNumeric#</p></cfoutput>

		
		
		<cfset currentMonthWord = DateFormat(currentDate, "mmmm")>
		<cfoutput><p>Current Month (Word): #currentMonthWord#</p></cfoutput>

		

		
		<cfset currentDayOfWeek = DayOfWeek(currentDate)>
		<cfif currentDayOfWeek GTE 6>
   			<cfset daysToLastFriday = currentDayOfWeek - 6 >
		<cfelse>
    			<cfset daysToLastFriday = currentDayOfWeek + 1 >
		</cfif>
		<cfset lastFriday = DateAdd("d", -daysToLastFriday, currentDate)>
		<cfoutput>
    			<p>Last Friday Date: #DateFormat(lastFriday, "dd-mmm-yyyy")#</p>
		</cfoutput>



    	
		<cfset firstDayOfCurrentMonth = CreateDate(Year(currentDate), Month(currentDate), 1) >
		<cfset lastDayOfPreviousMonth = DateAdd("d", -1, firstDayOfCurrentMonth)>
		<cfset lastDayOfPreviousMonthDayName = DateFormat(lastDayOfPreviousMonth, "ddd") />
		<cfoutput>
    			<p>Day Name of Last Day of Previous Month: #lastDayOfPreviousMonthDayName#</p>
		</cfoutput>

		

    
    		
		<!---<cfset lastFiveDays = []> 

		<cfloop from="0" to="4" index="i">
        		<cfset dateValue = DateAdd("d", -i, currentDate) >
        		<cfset arrayAppend(lastFiveDays, dateValue) >
    		</cfloop>

   
    		<h4>Last 5 Days:</h4>
   		<ul>

			
        		<cfloop array="#lastFiveDays#" index="day">
            			<cfset dayName = DayOfWeekName(day) >
            			<cfset dayColorClass = "">
            			<cfif dayName EQ "Sunday"> <cfset dayColorClass = "sunday" >
            			<cfelseif dayName EQ "Monday"> <cfset dayColorClass = "monday" >
            			<cfelseif dayName EQ "Tuesday"> <cfset dayColorClass = "tuesday" >
            			<cfelseif dayName EQ "Wednesday"> <cfset dayColorClass = "wednesday" >
            			<cfelseif dayName EQ "Thursday"> <cfset dayColorClass = "thursday" >
            			<cfelseif dayName EQ "Friday"> <cfset dayColorClass = "friday" >
            			<cfelseif dayName EQ "Saturday"> <cfset dayColorClass = "saturday" >
            			</cfif>
            			<li class="#dayColorClass#">#DateFormat(day, "dd-mmm-yyyy")# - #dayName#</li>
        		</cfloop>
    		</ul> --->





	</body>
</html>

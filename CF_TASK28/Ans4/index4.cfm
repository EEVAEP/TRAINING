<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Date Display</title>
    		<link rel="stylesheet" href="./css/style.css">
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

		

    
    		
		<cfset currentDate = Now()>
		<cfset lastFiveDays = []> 
		<cfloop from="1" to="5" index="i">
    			<cfset dateValue = DateAdd("d", -i, currentDate)>
    			<cfset arrayAppend(lastFiveDays, dateValue)>
		</cfloop>

		<h3>Last 5 Days:</h3>
		<ul>
    			<cfloop array="#lastFiveDays#" index="day">
        			<cfset dayName = DateFormat(day, "dddd")> 
        			<cfset formattedDate = DateFormat(day, "dd-mmm-yyyy")>

        			<cfset dayColorClass = "">
				<cfif dayName EQ "Sunday"> 
            				<cfset dayColorClass = "sunday">
        			<cfelseif dayName EQ "Monday"> 
            				<cfset dayColorClass = "monday" >
        			<cfelseif dayName EQ "Tuesday"> 
            				<cfset dayColorClass = "tuesday">
        			<cfelseif dayName EQ "Wednesday"> 
            				<cfset dayColorClass = "wednesday">
        			<cfelseif dayName EQ "Thursday"> 
            				<cfset dayColorClass = "thursday">
        			<cfelseif dayName EQ "Friday"> 
            				<cfset dayColorClass = "friday">
        			<cfelseif dayName EQ "Saturday"> 
            				<cfset dayColorClass = "saturday">
        			</cfif>

       				<cfoutput>
        				<li class="#dayColorClass#">#formattedDate# - #dayName#</li>
				</cfoutput>
    			</cfloop>
		</ul>




	</body>
</html>

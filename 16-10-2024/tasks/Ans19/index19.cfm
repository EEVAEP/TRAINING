<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Visits Counter</title>
	</head>
	<body>

    
    	<cfoutput>
                <cfif structKeyExists(cookie, "VisitsCounter")>
            
            		<cfset newCounterValue = cookie.VisitsCounter + 1>
        	<cfelse>
                        <cfset newCounterValue = 1>
        	</cfif>

                <cfcookie name="VisitsCounter" value="#newCounterValue#">

                <h1>You have visited this page #newCounterValue# time(s).</h1>
    	</cfoutput>

        	<form method="post" action="">
        		<button type="submit">Submit</button>
    		</form>
	</body>
</html>

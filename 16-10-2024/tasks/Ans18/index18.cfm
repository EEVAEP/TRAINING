
<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<title>Query Example</title>
	</head>
	<body>

    		<h2>CF TASK 18</h2>

   
    		<cfset queryGenerator = createObject("component", "components.QueryGenerator")>

    
    		<cfset myQuery = queryGenerator.generateQuery()>

    
    		<cfdump var="#myQuery#">

	</body>
</html>


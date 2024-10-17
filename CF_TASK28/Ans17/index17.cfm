<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Number Input with ColdFusion</title>
    
    		<script src="./js/script.js"></script>
		<link href="./css/style.css" rel="stylesheet">

    	</head>
	<body>

    		<h2>CF TASK 17</h2>
    
    		<form id="numberForm" method="post" onsubmit="return validateInput()">
        		<label for="numberInput">Enter a number:</label>
        		<input type="text" id="numberInput" name="numberInput" />
        		<button type="submit">Submit</button>
    		</form>
	
	</body>
	<cfinclude template="valid.cfm">
</html>

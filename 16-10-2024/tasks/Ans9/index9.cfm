<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Key-Value Form</title>
	</head>
	<body>
		
		<h1>CF Task9</h1>
        	<form method="POST">
        		<label for="key">Key:</label>
        		<input type="text" id="key" name="key" placeholder= "key" required><br><br>

        		<label for="value">Value:</label>
        		<input type="text" id="value" name="value" placeholder= "value" required><br><br>

        		<input type="submit" value="Submit">
    		</form>

        	<cfinclude template="alert.cfm">

	</body>
</html>

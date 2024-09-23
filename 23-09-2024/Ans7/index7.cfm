<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Submit Form</title>
	</head>
	<body>
    		<h1>CF Task7</h1>
    		<form method="POST">
        		<label for="key">Key:</label>
        		<input type="text" id="key" name="key" placeholder = "key" required><br><br>

        		<label for="value">Value:</label>
        		<input type="text" id="value" name="value" placeholder = "value" required><br><br>

        		<input type="submit" name="submit" value="Submit">
    		</form>

         	
		<cfinclude template="test7.cfm">
	</body>
</html>

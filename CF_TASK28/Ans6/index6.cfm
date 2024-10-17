<!DOCTYPE html>
<html>
	<head>
    		<title>CF TASK6</title>
	</head>
	<body>
		<h2>CF TASK 6</h2>
    		<form method="post" action="">
        		<label for="forkey">Enter the Key:</label>
        		<input type="text" id="forkey" name="forkey" placeholder="key" required><br><br>
        
        		<label for="forvalue">Enter the Value:</label>
        		<input type="text" id="forvalue" name="forvalue" placeholder="value" required><br><br>
        
        		<input type="submit" value="Submit">
    		</form>

    		<cfinclude template="keyValue.cfm">
	</body>
</html>




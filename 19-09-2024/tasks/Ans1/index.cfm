<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Rating Input</title>
	</head>
	<body>
    	<h2>CF TASK 1</h2>
    	<form action="test.cfm" method="post">
       		<label for="rating">Enter a number between 1 and 5:</label>
        	<input type="number" id="rating" name="rating" min="1" max="5" required>
        	<button type="submit">Submit</button>
    	</form>
	</body>
</html>

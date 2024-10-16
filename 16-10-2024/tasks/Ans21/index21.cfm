<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">	
		<title>Birthday Wishes</title>
	</head>
	<body>
    		<h2>CF TASK 21</h2>
    			<form action="sendwishes.cfm" method="post" enctype="multipart/form-data">
        			<label for="babyName">Birthday Baby Name:</label>
        			<input type="text" name="babyName" id="babyName" required><br><br>

        			<label for="emailId">His Email Id:</label>
        			<input type="email" name="emailId" id="emailId" required><br><br>

        			<label for="birthdayWishes">Birthday Wishes:</label><br>
        			<textarea name="birthdayWishes" id="birthdayWishes" rows="5" cols="30" required></textarea><br><br>

        			<label for="greetingImage">Greeting Image:</label>
        			<input type="file" name="greetingImage" id="greetingImage" accept="image/*" required><br><br>

        			<input type="submit" value="Send Wishes">
    			</form>
	</body>
</html>


<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Word Count from Uploaded File</title>
	</head>
	<body>
		<h1>CF TASK 26</h1>
    		<h5>Upload a Text File for Word Count</h5>
    		<form action="processUpload.cfm" method="post" enctype="multipart/form-data">
        		<label for="fileUpload">Select a text file:</label>
        		<input type="file" id="fileUpload" name="fileUpload" accept=".txt" required>
        		<br><br>
        		<input type="submit" value="Upload File">
    		</form>
	</body>
</html>

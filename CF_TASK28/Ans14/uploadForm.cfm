<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Image Upload Form</title>
	</head>
	<body>
    		<h1>Upload Image</h1>
    			<form action="uploadImage.cfm" method="post" enctype="multipart/form-data">
        			<label for="imageName">Image Name:</label><br>
        			<input type="text" id="imageName" name="imageName" required><br><br>

        			<label for="description">Description:</label><br>
        			<textarea id="description" name="description" required></textarea><br><br>

        			<label for="imageFile">Upload Image (jpg, png, gif max 1MB):</label><br>
        			<input type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png, .gif" required><br><br>

        			<input type="submit" value="Upload Image">
    			</form>

    			<br>
    			<a href="listImages.cfm">View Uploaded Images</a>
		</body>
</html>

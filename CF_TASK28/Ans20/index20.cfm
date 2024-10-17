<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<title>Subscribe to Newsletter</title>
	</head>
	<body>
    		<h2>CF TASK 20</h2>

    		<cfset captchaText = "">
		<cfset chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890">

		<cfloop from="1" to="4" index="i">
    			<cfset captchaText = captchaText & Mid(chars, RandRange(1, Len(chars)), 1)>
		</cfloop>
		<cfset captchaKey = Hash(captchaText, "SHA-256")>
		<!---<cfcookie name="captchaKey" value="#captchaKey#" expires="1">--->
		<cfset session.captchaKey= captchaKey>
		
		
        	<form action="checkCaptcha.cfm" method="POST">
			<label>Email:</label>
        		<input type="email" name="email" required><br><br>

                	<cfimage action="captcha" text="#captchaText#" width="150" height="50" fontsize="22" font="Arial"><br><br>

        
        		<label>Enter Captcha:</label>
        		<input type="text" name="captcha" required><br><br>
			

			
               		<input type="submit" value="Subscribe">
    		</form>

		   
    

	</body>
</html>

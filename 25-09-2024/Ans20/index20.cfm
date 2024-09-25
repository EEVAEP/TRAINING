
<h2>CF TASK 20</h2>

<cfset secretkey="randRange(1000,9999)">

<form action="test20" method="post">
	
	<cfimage action="captcha", text="#secretkey#", width="150", height="50" >

	<label for="captcha">Enter the captcha:</label>
    	<input type="text" id="captcha" name="captchaText" placeholder="captcha" required><br><br>
	<input type="hidden" name="hiddenCaptchakey" value="#secretkey#">

    
    	<label for="email">Enter your email:</label>
    	<input type="text" id="email" name="email" placeholder="email" required><br><br>

	
	<input type="submit" name="submit" value="Submit">
</form>
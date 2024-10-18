
<cfif structKeyExists(form, "submit")>
	<cfdump var="#form#">

   	<cfset local.user = application.userService.validateUser(form.username, form.password)>

	<cfif structKeyExists(local.user, "username") AND local.user.username EQ form.username>
		<cfdump var="#session.username#">
		<cfdump var="#session.userid#">
   		<cfset session.username = local.user.username>
		<cfset session.userid = local.user.userid>
        	<cflocation url="welcome.cfm" addtoken="false">
		
    	<cfelse>
        	<cfset errorMessage = "Invalid Username or Password">
        	<h3><cfoutput>#errorMessage#</cfoutput></h3>
    	</cfif>

</cfif>

<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Login Page</title>
    		<link rel="stylesheet" href="./css/styleLogin.css">
	</head>
	<body>
        	<nav class="navbar">
        		<div class="navbar-left">
            			<img src="./img/addressbook.png" alt="Address Book Icon" class="nav-icon">
            			<span>ADDRESS BOOK</span>
        		</div>
        		<div class="navbar-right">
            			<a href="./signup.cfm" class="nav-link">Sign Up</a>
            			<!---<a href="#" class="nav-link">Login</a>--->
        		</div>
    		</nav>

    
    		<div class="container">
        		<div class="login-box">
            			<div class="icon-side">
                			<img src="./img/addressbook.png" alt="Address Book Icon" class="icon">
            			</div>
            			<div class="form-side">
                			<h2>LOGIN</h2>
                			<form method="post" action="login.cfm">
                    				<div class="input-box">
                        				<label for="username">Username</label>
                        				<input type="text" id="username" name="username">
                    				</div>
                    				<div class="input-box">
                        				<label for="password">Password</label>
                        				<input type="password" id="password" name="password">
                    				</div>
                    				<button type="submit" class="login-btn">LOGIN</button>
                			</form>
                			
                			<div class="register-link">
                    				<p>Don't have an account? <a href="./signup.cfm">Register Here</a></p>
                			</div>
            			</div>
        		</div>
    		</div>
	</body>
</html>

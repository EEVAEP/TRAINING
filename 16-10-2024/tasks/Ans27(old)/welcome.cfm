
<cfif NOT structKeyExists(session, "username")>
	<cflocation url="login.cfm">
</cfif>

<html>
    	<head>
        	<title>Welcome Page</title>
    	</head>
    	<body>
        	<h2 style="color:green;">welcome to WELCOME page!! You have successfully logged In</h2>
        	<p><a href="logout.cfm">Logout</a></p>
    	</body>
</html>

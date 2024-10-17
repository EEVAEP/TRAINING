function validateForm(event) {
	event.preventDefault();
    
    	let valid = true;

  	document.getElementById("fullnameError").innerHTML = "";
    	document.getElementById("emailError").innerHTML = "";
	document.getElementById("usernameError").innerHTML = "";
    	document.getElementById("passwordError").innerHTML = "";
	document.getElementById("confirmPasswordError").innerHTML = "";
    	

	//name validation
	const name = document.getElementById("fullname").value;
    	if (name.length < 2) {

        	document.getElementById("fullnameError").innerHTML = "Name must be at least 2 characters long.";
        	valid = false;
    	}

    
	//email validation
    	const email = document.getElementById("email").value;
    	const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    	if (!email.match(emailPattern)) {
        	document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
        	valid = false;
    	}


	//username validation
	const username = document.getElementById("username").value;
	const usernamePattern = /^[A-Za-z]+$/;

	
	if (!username.match(usernamePattern)) {
		document.getElementById("usernameError").innerHTML = "Username should only contain letters (A-Z  or a-z).";
		valid = false;
	}


	//password validation
	const password = document.getElementById("password").value;
	const passwordPattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	if(!passwordPattern.test(password))
	{
		document.getElementById('passwordError').innerHTML = 'should contain atleast 8 characters,1 lowercase, 1 uppercase, 1 special character';
        	valid = false;
	}

	//confirm password
	const confirmPassword = document.getElementById("confirmPassword").value;
	if (confirmPassword !== password)
	{
        	document.getElementById('confirmPasswordError').innerHTML = 'Password do not match';
        	valid = false;
    	}

       

        if (valid) {
        	document.getElementById("myForm").action = "login.cfm"; 
        	document.getElementById("myForm").submit();
    	} else {
        	return false;     
	}
	}

document.getElementById("myForm").addEventListener("submit", validateForm);



















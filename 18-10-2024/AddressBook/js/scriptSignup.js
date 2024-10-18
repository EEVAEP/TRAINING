
function validateForm(event) {
	event.preventDefault();
   
	const fullname = document.getElementById('fullname').value.trim();
    	const email = document.getElementById('email').value.trim();
    	const username = document.getElementById('username').value.trim();
    	const password = document.getElementById('password').value.trim();
    	const confirmPassword = document.getElementById('confirmPassword').value.trim();

    
    	const fullnameError = document.getElementById('fullnameError');
    	const emailError = document.getElementById('emailError');
    	const usernameError = document.getElementById('usernameError');
    	const passwordError = document.getElementById('passwordError');
    	const confirmPasswordError = document.getElementById('confirmPasswordError');
	const successMessage = document.getElementById('successMessage');

    	let isValid = true;

    
    	if (fullname === "") {
        	fullnameError.textContent = "Full name is required.";
        	isValid = false;
    	}
	else {
        	fullnameError.textContent = "";
    	}

   
    	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    	if (email === "") {
        	emailError.textContent = "Email is required.";
        	isValid = false;
    	} else if (!emailPattern.test(email)) {
        	emailError.textContent = "Please enter a valid email address.";
        	isValid = false;
    	} else {
        	emailError.textContent = "";
    	}

    
    	if (username === "") {
        	usernameError.textContent = "Username is required.";
        	isValid = false;
    	} else if (username.length < 3) {
        	usernameError.textContent = "Username must be at least 3 characters long.";
        	isValid = false;
    	} else {
        	usernameError.textContent = "";
    	}

   
	const passwordPattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    	if (password === "") {
        	passwordError.textContent = "Password is required.";
        	isValid = false;
    	} else if (!passwordPattern.test(password)) {
        	passwordError.textContent = "should contain atleast 8 characters,1 lowercase, 1 uppercase, 1 special character";
        	isValid = false;
    	} else {
        	passwordError.textContent = "";
    	}



    	if (confirmPassword === "") {
        	confirmPasswordError.textContent = "Confirm password is required.";
        	isValid = false;
    	} else if (confirmPassword !== password) {
        	confirmPasswordError.textContent = "Passwords do not match.";
        	isValid = false;
    	} else {
        	confirmPasswordError.textContent = "";
    	}

	if (isValid) {
        	checkUserExists(email, fullname, username, password, function(emailExists) {
            		if (emailExists) {
                		emailError.textContent = "This User already exists. Please LogIn";
            		} else {
                		emailError.textContent = "";
				successMessage.textContent = "Registered successfully. Please LogIn !!";
			}
        	});
    	}

    	return false; 
}

document.getElementById("myForm").addEventListener("submit", validateForm);

function checkUserExists(email, fullname, username, password, callback) {
    	$.ajax({
        	url: './components/db.cfc?method=checkmail',
        	type: 'POST', 
        	data: {
            		email: email,
			fullname:fullname,
			username:username,
			password:password
        	},
        	dataType: 'json',
        	success: function(response) {
            		if (response === 'exists') {
                		callback(true); 
            		} else {
                		callback(false); 
            		}
        	},
        	error: function(xhr, status, error) {
            		console.error('Error checking email: ' + error);
            		callback(false); 
        	}
    	});
}
	

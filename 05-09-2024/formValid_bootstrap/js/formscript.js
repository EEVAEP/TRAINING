$(document).ready(function() {
    $("#myForm").submit(function(event) {
	let isValid = true;

       	// Name validation
	const name = $("#name").val().trim();
	const nameRegex = /^[A-Za-z\s]+$/; 

	if (name === "") {
    		$("#nameError").text("Please enter your name.");
    		isValid = false;
	} else if (!nameRegex.test(name)) {
    		$("#nameError").text("Name should not contain numbers or special characters.");
    		isValid = false;
	} else {
    		$("#nameError").text("");
	}


        // Email validation
        const email = $("#email").val().trim();
        if (email === "") {
            $("#emailError").text("Please enter your email.");
            isValid = false;
        } else if (!/^[\w\-.]+@[a-zA-Z\d\-.]+\.[a-zA-Z]{2,}$/.test(email)) {
            $("#emailError").text("Please enter a valid email address.");
            isValid = false;
        } else {
            $("#emailError").text("");
        }

        // Password validation
	const password = $("#password").val().trim();
	const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

	if (password === "") {
    		$("#passwordError").text("Please enter your password.");
    		isValid = false;
		} else if (!passwordPattern.test(password)) {
    			$("#passwordError").text("Should be at least 8 characters long, at least one lowercase , one uppercase , one digit, one special 			character.");
    			isValid = false;
		} else {
    			$("#passwordError").text("");
		}


        // Confirm Password validation
        const confirmPassword = $("#confirmPassword").val().trim();
        if (confirmPassword === "") {
            $("#confirmPasswordError").text("Please confirm your password.");
            isValid = false;
        } else if (password !== confirmPassword) {
            $("#confirmPasswordError").text("Passwords do not match.");
            isValid = false;
        } else {
            $("#confirmPasswordError").text("");
        }

        // Joined Date validation
	const joinedDate = $("#joinedDate").val();
	const today = new Date();
	const selectedDate = new Date(joinedDate);

	if (joinedDate === "") {
    		$("#joinedDateError").text("Please select your joined date.");
    		isValid = false;
	} else if (selectedDate > today) {
    		$("#joinedDateError").text("Joined date cannot be in the future.");
    		isValid = false;
	} else {
    		$("#joinedDateError").text("");
	}


        // Phone Number validation
        const clientPhone = $("#clientPhone").val().trim();
        if (clientPhone === "") {
            $("#clientPhoneError").text("Please enter the client's phone number.");
            isValid = false;
        } else if (!/^\d{10}$/.test(clientPhone)) {
            $("#clientPhoneError").text("Please enter a valid 10-digit phone number.");
            isValid = false;
        } else {
            $("#clientPhoneError").text("");
        }

        // Supervisors validation
        const supervisors = $("#supervisors").val().trim();
        if (supervisors === "" || supervisors <= 0) {
            $("#supervisorsError").text("Please enter the number of supervisors.");
            isValid = false;
        } else {
            $("#supervisorsError").text("");
        }

        
        // Owner Type validation
        const ownerType = $("input[name='ownerType']:checked").val();
        if (!ownerType) {
            $("#ownerTypeError").text("Please select an owner type.");
            isValid = false;
        } else {
            $("#ownerTypeError").text("");
        }

        // Message validation
        const message = $("#message").val().trim();
        if (message === "") {
            $("#messageError").text("Please enter a message.");
            isValid = false;
        } else {
            $("#messageError").text("");
        }

        // File upload validation
	const fileInput = $("#file")[0];
	const file = fileInput.files[0];
	const validExtensions = ["jpeg", "jpg", "png"];
	const maxSize = 2 * 1024 * 1024; 

	if (!file) {
		$("#fileError").text("Please upload a file.");
    		isValid = false;
	} else {
    		const fileExtension = file.name.split('.').pop().toLowerCase();

    		if (!validExtensions.includes(fileExtension)) {
        		$("#fileError").text("Invalid file type. Only JPEG and PNG files are allowed.");
        		isValid = false;
    		} else if (file.size > maxSize) {
        		$("#fileError").text("File size must not exceed 2 MB.");
        		isValid = false;
    		} else {
        		$("#fileError").text("");
    		}
	}


        // Terms and Conditions validation
        if (!$("#terms").is(":checked")) {
	    $('#termsError').text("Please agree to the Terms and Conditions.");
            
            isValid = false;
        }

        // Prevent form submission if any validation failed
        if (isValid) {
            return true;
        }
	else {
		event.preventDefault();
	}
    });
});

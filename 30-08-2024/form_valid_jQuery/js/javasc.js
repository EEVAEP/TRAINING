$(document.ready(function() {
	$('#myForm').on('submit',function(event)  {
	event.preventDefault;

	$('nameError').empty();
	$('emailError').empty();
	$('phoneNumberError').empty();
	$('passwordError').empty();
	$('confirmPasswordError').empty();
	$('odeskProfileError').empty();
	$('supervisorError').empty();
	$('ownerTypeError').empty();
	$('messageError').empty();
	$('startDateError').empty();
	$('fileError').empty();
	$('termsError').empty();

	
	var name=$('#name').val().trim();
	var email=$('#email').val().trim();
	var phoneNumber=$('#phoneNumber').val().trim();
	var email=$('#email').val().trim();
	var password=$('#password').val().trim();
	var confirmPassword=$('#confirmPassword').val().trim();
	var odeskProfile=$('#odeskProfile').val().trim();
	var supervisor=$('#supervisor').val().trim();


	//name validation
	if (name === "") {
		$('#nameError').text("Name is required."); 
            	return false;
        } else if (!namePattern.test(name)) {
            	$('#nameError').text("Name can only contain letters and spaces."); // Error for invalid characters
            	return false;
        } 

	//email validation
	var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
	if (email === "") {
		$('#emailError').text("Email is required."); 
            	return false;
	}
	else if(!emailpattern.test(email)) {
		$('#emailError').text("Please enter a valid email address.");
		return false;
	}

	if (phoneNumber ==""){
		$('#phoneNumberError').text("Phone is required."); 
            	return false;
	}
	

	//radio button validation
	$('input[name="owner"]').on('change', function() {
        
        	var selectedValue = $('input[name="owner"]:checked').val();
        
        	$('#selectedOwnerType').text("Selected Owner Type: " + selectedValue);
    	});

	var message=$('#message').val().trim();
	var startDate=$('#startDate').val().trim();
	var file=$('#file').val().trim();
	
	//check box validation
	var isChecked = $('#terms').prop('checked');
        if (isChecked) {
            	$('#termsError').text("");  
        } else {
            	$('#termsError').text("You must accept the terms and conditions.");
	}

	
        	
	


});


});
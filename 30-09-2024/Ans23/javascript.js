function validateForm(event) {
	event.preventDefault();
    
    	let valid = true;

   	
	
	
	document.getElementById("jobPositionTypeError").innerHTML = "";
	document.getElementById("relocateError").innerHTML = "";
	document.getElementById("startDateError").innerHTML = "";
	document.getElementById("portfolioError").innerHTML = "";
	document.getElementById("fileError").innerHTML = "";
    	document.getElementById("nameError").innerHTML = "";
    	document.getElementById("emailError").innerHTML = "";
    	
    	document.getElementById("clientPhoneError").innerHTML = "";

	//jobposition
	const jobPosition=document.getElementById("jobPosition").value;
	if (jobPosition === "") {
        	document.getElementById('jobPositionTypeError').innerHTML = "Please select a position.";
        	valid=false; 
    	} 

	//radio button
	const willingness = document.querySelector('input[name="willingness"]:checked');
    	if (!willingness) { 
        	document.getElementById("relocateError").innerHTML = "Please select an option for relocation.";
        	valid = false;
    	}
	
	//joining date

	const startDate = document.getElementById('startDate');
    	
	
	const today=new Date();
	today.setHours(0, 0, 0, 0);
	const selectedDate = new Date(startDate.value);
	if (!startDate.value) {
        	document.getElementById("startDateError").innerHTML = 'Please select a date.';
		valid=false;
    	}
	else if (selectedDate < today) {
		document.getElementById("startDateError").innerHTML = 'Date cannot be in the past.';
        	
		valid=false;
    	}
	
	//url validation
	const portfolio = document.getElementById('portfolio').value;
        
	//const regex = /^https:\/\/www\.odesk\.com\/jobs\.[a-zA-Z0-9-]+$/;
	//if (!regex.test(portfolio)) 
	if(!portfolio)
	{
		document.getElementById("portfolioError").innerHTML = 'Enter a valid url';
		valid=false;
        } 
	//file validation
	const fileInput = document.getElementById('file');
        

	const file = fileInput.files[0];

    	if (!file) {
		document.getElementById("fileError").innerHTML = 'Please select a file to upload.';
        	valid = false;
    	} 
	else {
        	const allowedTypes = ['application/pdf', 'application/msword']; 
        	const maxSize = 2 * 1024 * 1024; 
        	if (!allowedTypes.includes(file.type)) {
            		document.getElementById("fileError").innerHTML = 'Only JPEG, PNG, and GIF files are allowed.';
            		valid = false;
        	} 
		else if (file.size > maxSize) {
            		document.getElementById("fileError").innerHTML = 'File size must be less than 2 MB.';
            		valid = false;
        	}
    	}
	
	// salary requirements
	const salary=document.getElementById('salary').value;
	
	if (!salary)
	{
		document.getElementById("salaryError").innerHTML = 'Should not be empty';
		
        	valid = false;
	}	
	

    
    	const name = document.getElementById("name").value;
    	if (name.length < 3) {
        	document.getElementById("nameError").innerHTML = "Name must be at least 3 characters long.";
        	valid = false;
    	}

    
    	const email = document.getElementById("email").value;
    	const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    	if (!email.match(emailPattern)) {
        	document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
        	valid = false;
    	}

        

    
    	const clientPhone = document.getElementById("clientPhone").value;
    	const phonePattern = /^\d{10}$/; // 10-digit phone number validation
    	if (!clientPhone.match(phonePattern)) {
        	document.getElementById("clientPhoneError").innerHTML = "Please enter a valid 10-digit phone number.";
        	valid = false;
    	}

        if (valid) {
        	document.getElementById("myForm").action = "processEmployee.cfm"; 
        	document.getElementById("myForm").submit();
    	} else {
        	return false;     
	}
	}

document.getElementById("myForm").addEventListener("submit", validateForm);












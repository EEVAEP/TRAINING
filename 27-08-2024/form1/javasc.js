document.getElementById('myForm').addEventListener('submit', function(event) {
	event.preventDefault(); 
   
    	const name = document.getElementById('name').value;
    	const email = document.getElementById('email').value;
    	const password = document.getElementById('password').value;
    	const confirmPassword = document.getElementById('confirmPassword').value;
	const radioButtons=document.getElementsByName('owner');
	const ownerTypeError=document.getElementById('ownerTypeError');
	const message=document.getElementById('message');
	const messageError=document.getElementById('messageError');
	const startDate = document.getElementById('startDate');
    	const startDateError = document.getElementById('startDateError');
	const fileInput = document.getElementById('file');
        const fileError = document.getElementById('fileError');
	
	

    
    	document.getElementById('nameError').textContent = '';
   	document.getElementById('passwordError').textContent = '';
    	document.getElementById('confirmPasswordError').textContent = '';
	ownerTypeError.textContent = '';
	messageError.textContent='';
	startDateError.textContent = '';
	fileError.textContent = '';

    	let valid = true;

    
    	if (name.length<2) 
	{
        	document.getElementById('nameError').textContent = 'Name should contain atleast 2 characters';
        	valid = false;
    	}

    
    	const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    	if (!emailPattern.test(email)) 

	{
        	document.getElementById('emailError').textContent = 'Enter a valid email';
        	valid = false;
    	}
	
	const passwordPattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	if(!passwordPattern.test(password))
	{
		document.getElementById('passwordError').textContent = 'should contain atleast 8 characters,1 lowercase, 1 uppercase, 1 special character';
        	valid = false;
	}
    	

    	
    	if (confirmPassword !== password)
	{
        	document.getElementById('confirmPasswordError').textContent = 'Password do not match';
        	valid = false;
    	}
	
	let isChecked=false;
	for (const radioButton of radioButtons) {
        	if (radioButton.checked) {
            		isChecked = true;
            		break;
        	}
    	}

    
    	if (!isChecked) {
        	ownerTypeError.textContent = 'Please select a Owner Type.';
		valid=false;
	}
	if (message.value.trim() === '') {
        	messageError.textContent = 'Please enter a message.';
		valid=false
    		} 		
	else if (message.value.trim().length < 10) { 
        	messageError.textContent = 'Message must be at least 10 characters long.';
		valid=false;
    	} 
	const today=new Date();
	today.setHours(0, 0, 0, 0);
	const selectedDate = new Date(startDate.value);
	if (!startDate.value) {
        	startDateError.textContent = 'Please select a date.';
		valid=false;
    	}
	else if (selectedDate > today) {
        	startDateError.textContent = 'Date cannot be in the future.';
		valid=false;
    	}
	const file = fileInput.files[0];

    	if (!file) {
        	fileError.textContent = 'Please select a file to upload.';
        	valid = false;
    	} 
	else {
        	const allowedTypes = ['image/jpeg', 'image/png', 'image/gif']; // Allowed file types
        	const maxSize = 2 * 1024 * 1024; 
        	if (!allowedTypes.includes(file.type)) {
            		fileError.textContent = 'Only JPEG, PNG, and GIF files are allowed.';
            		valid = false;
        	} 
		else if (file.size > maxSize) {
            		fileError.textContent = 'File size must be less than 2 MB.';
            		valid = false;
        	}
    	}
	
    	if (valid)
	{
        	alert('Form submitted successfully!');
       	}

});

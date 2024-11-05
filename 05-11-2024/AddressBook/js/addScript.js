$(document).ready(function() {
	$('#saveContactBtn').click(function(event) {
        	event.preventDefault();
		
		
		const formData = {
                	title: $('#title').val(),
			firstName: $('#firstName').val(),
			lastName: $('#lastName').val(),
			gender: $('#gender').val(),
			dob: $('#dob').val(),
			photo: $('#photo').val(),
			address: $('#address').val(),
			street: $('#street').val(),
			pincode: $('#pincode').val(),
			email: $('#email').val(),
			phone: $('#phone').val()
		};
		console.log(formData);
			
		/*$.ajax({
                	url: 'components/db.cfc?method=validateContact',
                	type: 'POST',
                	dataType: 'json',
                	data: formData,
                		success: function(response) {
                    			if (response.errors && response.errors.length > 0) {
                       
                        $('#errorMessages').html(response.errors.join('<br>')).show();
                    } else {
                        // Proceed with further actions if no errors
                        $('#errorMessages').hide();
                        // Call the next function or perform additional actions here
                        // For example: callAnotherFunction();
                    }
                },
                error: function(xhr, status, error) {
                    $('#errorMessages').html("An error occurred: " + error).show();
                }
            });*/
	});
});


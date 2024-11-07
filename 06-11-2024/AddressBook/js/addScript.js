
$(document).ready(function() {
	var contactId;

	$('#createContactBtn').on('click',function(){
		document.getElementById("createContactModalLabel").innerText = "CREATE CONTACT";
		$('#contactForm').trigger('reset');
		$('#saveContactBtn').show();
		$('#updateContactBtn').hide();	
		
	});

	$('#saveContactBtn').click(function(event) {
        	event.preventDefault();
		
		var title=$('#title');
		var firstName=$('#firstName');
		var lastName=$('#lastName');
		var gender=$('#gender');
		var dob=$('#dob');
		var photo=$('#photo');
		var address=$('#address');
		var street=$('#street');
		var pincode=$('#pincode');
		var email=$('#email');
		var phone=$('#phone');

		var fileInput = $('#photo')[0];
		var file=fileInput.files[0];

		var formData = new FormData();
		formData.append('title', title.val());
		formData.append('firstName', firstName.val());
		formData.append('lastName', lastName.val());
		formData.append('gender', gender.val());
		formData.append('dob', dob.val());
		formData.append('photo', file);
		formData.append('email', email.val());
		formData.append('phone', phone.val());
		formData.append('address', address.val());
		formData.append('street', street.val());
		formData.append('pincode', pincode.val());

		
		for (let [key, value] of formData.entries()) {
   		 	console.log(key + ':', value);
		}


		$.ajax({
			url:'components/db.cfc?method=validateContact',
			type:'POST',
			data:formData,
			processData:false,
			contentType:false,
			success:function(response){
				let data = JSON.parse(response);
				console.log(data);	
				if(data.length === 0){
					$('#createContactModal').modal('hide');
					location.reload();
				}
				else{
					addOnError(data);
				}
				
			},
			error:function(){
				console.log("Request Failed");
			}
		});
	});


	$(document).on('click', '.edit', function() {
		document.getElementById('saveContactBtn').style.display="none";
		$('#updateContactBtn').show();
		contactId = $(this).data('id');
		console.log(contactId);
		document.getElementById("contactId").value = contactId;
		var contact = jsonContactData.find(c => c.id == contactId);
		let dob = new Date(contact.dob);
                let formattedDob = dob.toISOString().split('T')[0];
                	
			

               if (contact) {
			document.getElementById("title").value = contact.title;
			document.getElementById("firstName").value = contact.firstname;
                	document.getElementById("lastName").value = contact.lastname;
                    	document.getElementById("gender").value = contact.gender;
                    	document.getElementById("dob").value = formattedDob;
                    	document.getElementById("address").value = contact.address;
                    	document.getElementById("street").value = contact.street;
                    	document.getElementById("pincode").value = contact.pincode;
                    	document.getElementById("email").value = contact.email;
                    	document.getElementById("phone").value = contact.phone;


				

                }
		document.getElementById("createContactModalLabel").innerText = "EDIT CONTACT";
               	
	});


	$('#updateContactBtn').on('click',function(event){	
		event.preventDefault();
		var title=$('#title');
		var firstName=$('#firstName');
		var lastName=$('#lastName');
		var gender=$('#gender');
		var dob=$('#dob');
		var photo=$('#photo');
		var address=$('#address');
		var street=$('#street');
		var pincode=$('#pincode');
		var email=$('#email');
		var phone=$('#phone');
		var fileInput = $('#photo')[0];
		var file=fileInput.files[0];


		var formData = new FormData();
		formData.append('title', title.val());
		formData.append('firstName', firstName.val());
		formData.append('lastName', lastName.val());
		formData.append('gender', gender.val());
		formData.append('dob', dob.val());
		formData.append('photo', file);
		formData.append('email', email.val());
		formData.append('phone', phone.val());
		formData.append('address', address.val());
		formData.append('street', street.val());
		formData.append('pincode', pincode.val());
		formData.append('contactId',contactId);
		for (let [key, value] of formData.entries()) {
   		 	console.log(key + ':', value);
		}

		$.ajax({
			url:'components/db.cfc?method=validateContact',
			type:'POST',
			data:formData,
			processData:false,
			contentType:false,
			success:function(response){
				let data = JSON.parse(response);
				console.log(data);	
				if(data.length === 0){
					$('#createContactModal').modal('hide');
					location.reload();
				}
				else{
					addOnError(data);
				}
				
			},
			error:function(){
				console.log("Request Failed");
			}
		});

	});

});

function addOnError(errors) {
	$('#errorMessages').empty();

	 errors.forEach(function(error) {
        	$('#errorMessages').append('<div class="alert alert-danger">' + error + '</div>');
 	});
}



	
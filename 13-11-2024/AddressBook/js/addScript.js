
$(document).ready(function() {
	var contactId;

		var title=$('#title');
		var firstName=$('#firstName');
		var lastName=$('#lastName');
		var gender=$('#gender');
		var cntdob=$('#dob');
		var photo=$('#photo');
		var address=$('#address');
		var street=$('#street');
		var pincode=$('#pincode');
		var email=$('#email');
		var phone=$('#phone');
		var hobbies=$('#hobbies');

	$('#createContactBtn').on('click',function(){
		document.getElementById("createContactModalLabel").innerText = "CREATE CONTACT";
		$('#contactForm').trigger('reset');
		$('#saveContactBtn').show();
		$('#updateContactBtn').hide();
		$('#errorMessages').empty();	
		
	});

	$('#saveContactBtn').click(function(event) {
        	event.preventDefault();
		
		var fileInput = $('#photo')[0];
		var file=fileInput.files[0];

		var formData = new FormData();
		formData.append('title', title.val());
		formData.append('firstName', firstName.val());
		formData.append('lastName', lastName.val());
		formData.append('gender', gender.val());
		formData.append('dob', cntdob.val());
		formData.append('photo', file);
		formData.append('email', email.val());
		formData.append('phone', phone.val());
		formData.append('address', address.val());
		formData.append('street', street.val());
		formData.append('pincode', pincode.val());
		formData.append('hobbies', hobbies.val())

		
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
		$('#errorMessages').empty();
		contactId = $(this).data('id');
		console.log(contactId);
		$.ajax({
			url:'components/db.cfc?method=getDataById',
			type:'POST',
			data:{
				contactId:contactId
			},
			success:function(response){
				const data= JSON.parse(response);
				console.log(data);
				const contactData=data.DATA[0];
				console.log(contactData);
				const hobby=data.DATA.map(row=>row[data.COLUMNS.indexOf("HOBBY_IDS")]);
				console.log(hobby);
				
				title.val(contactData[data.COLUMNS.indexOf("TITLEID")]);
				firstName.val(contactData[data.COLUMNS.indexOf("FIRSTNAME")]);
				lastName.val(contactData[data.COLUMNS.indexOf("LASTNAME")]);
				gender.val(contactData[data.COLUMNS.indexOf("GENDERID")]);
				cntdob.val(contactData[data.COLUMNS.indexOf("DOB")]);
				
				email.val(contactData[data.COLUMNS.indexOf("EMAIL")]);
				phone.val(contactData[data.COLUMNS.indexOf("PHONE")]);
				address.val(contactData[data.COLUMNS.indexOf("ADDRESS")]);
				pincode.val(contactData[data.COLUMNS.indexOf("PINCODE")]);
				street.val(contactData[data.COLUMNS.indexOf("STREET")]);
				photo.attr("src", contactData[data.COLUMNS.indexOf("PHOTO")]);			
				hobbies.val(hobby[0].split(","));	
			},
			error:function(){
				console.log("Request Failed");
			}
		});


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
		var hobbies=$('#hobbies');
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
		formData.append('hobbies',hobbies.val());
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



	
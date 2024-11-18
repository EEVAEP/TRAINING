
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
	var isPublic = $('#isPublic')

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
		
		isPublic = $('#isPublic').is(':checked') ? '1' : '0'
		formData.append('is_public', isPublic);

		
		for (let [key, value] of formData.entries()) {
   		 	console.log(key + ':', value);
		}


		$.ajax({
			url:'components/db.cfc?method=validateAddEditContactDetails',
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

				const contIsPublic = contactData[data.COLUMNS.indexOf("IS_PUBLIC")];
				if(contIsPublic == '1') {
                			$('#isPublic').prop('checked', true);  
            			} else {
                			$('#isPublic').prop('checked', false); 
            			}	
			},
			error:function(){
				console.log("Request Failed");
			}
		});


		document.getElementById("createContactModalLabel").innerText = "EDIT CONTACT";
               	
	});


	$('#updateContactBtn').on('click',function(event){	
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
		formData.append('hobbies',hobbies.val());
		formData.append('contactId',contactId);

		isPublic = $('#isPublic').is(':checked') ? '1' : '0'
		formData.append('is_public', isPublic);

		for (let [key, value] of formData.entries()) {
   		 	console.log(key + ':', value);
		}

		$.ajax({
			url:'components/db.cfc?method=validateAddEditContactDetails',
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


	$(document).on('click', '.view', function() {
		
		contactId = $(this).data('id');
		console.log(contactId);
		$.ajax({
			url:'components/db.cfc?method=getDataById',
			type:'POST',
			data:{
				contactId:contactId
			},
			success:function(response){
				const data=JSON.parse(response);
				console.log(data);
				const hobbies=	data.DATA.map(row=>row[data.COLUMNS.indexOf("HOBBY_NAMES")]);
				console.log(hobbies);
				const dataRow = data.DATA[0];

				const dob=dataRow[6];
				let dobDate = new Date(dob);
				let day = String(dobDate.getDate()).padStart(2, '0'); 
				let month = String(dobDate.getMonth() + 1).padStart(2, '0'); 
				let year = dobDate.getFullYear();
				let formattedDob = `${day}-${month}-${year}`;
				console.log(formattedDob);

				
				$('#viewPhoto').attr('src',`./${dataRow[7]}`);
				$('#viewName').text(`${dataRow[13]} ${dataRow[3]} ${dataRow[4]}`);
				$('#viewFirstName').text(`${dataRow[3]}`);
				$('#viewLastName').text(`${dataRow[4]}`);
				$('#viewDob').text(formattedDob);
				$('#viewAddress').text(`${dataRow[8]}`);
				$('#viewStreet').text(`${dataRow[9]}`);
				$('#viewPincode').text(`${dataRow[10]}`);
				$('#viewEmail').text(`${dataRow[11]}`);
				$('#viewPhone').text(`${dataRow[12]}`);	
				$('#viewTitle').text(`${dataRow[13]}`);
				$('#viewGender').text(`${dataRow[14]}`);
				$('#viewHobbies').text(hobbies.join(","));	
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



	
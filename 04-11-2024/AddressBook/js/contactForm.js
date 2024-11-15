
document.addEventListener("DOMContentLoaded", function() {
	document.querySelectorAll(".edit").forEach(function(button) {
		button.addEventListener("click", function() {
               		var contactId = this.getAttribute("data-id");
			document.getElementById("contactId").value = contactId;
			

			var contact = jsonContactData.find(c => c.id == contactId);
			console.log(contact);

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
                	document.getElementById("saveContactBtn").innerText = "Update Contact";
		
            	});
        });
	

	document.querySelector(".add").addEventListener("click", function() {
        	document.getElementById("contactId").value = ""; 
		document.getElementById("title").value = "";
        	document.getElementById("firstName").value = "";
        	document.getElementById("lastName").value = "";
        	document.getElementById("gender").value = "";
        	document.getElementById("dob").value = "";
        	document.getElementById("address").value = "";
        	document.getElementById("street").value = "";
        	document.getElementById("pincode").value = "";
        	document.getElementById("email").value = "";
        	document.getElementById("phone").value = "";
        	document.getElementById("createContactModalLabel").innerText = "CREATE CONTACT";
        	document.getElementById("saveContactBtn").innerText = "Save Contact";
    	});
});

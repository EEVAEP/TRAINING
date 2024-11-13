document.addEventListener("DOMContentLoaded", function () {
        const contacts = jsonContactData; 
	console.log(jsonContactData);
	
    
    	document.querySelectorAll(".view").forEach(function (button) {
        	button.addEventListener("click", function () {
                        const contactId = this.getAttribute("data-id");
			console.log(contactId);
            
                        const contact = contacts.find(c => c.id === (contactId));
			
			
			let dob = new Date(contact.dob);
			console.log(dob);

			let day = String(dob.getDate()).padStart(2, '0'); 
			let month = String(dob.getMonth() + 1).padStart(2, '0'); 
			let year = dob.getFullYear();

			let formattedDob = `${day}-${month}-${year}`;

			
            
            		if (contacts) {
				document.getElementById("viewPhoto").src = contact.photo;
				document.getElementById("viewName").textContent = contact.titleFullname;
                		document.getElementById("viewTitle").textContent = contact.titlename;
                		document.getElementById("viewFirstName").textContent = contact.firstname;
                		document.getElementById("viewLastName").textContent = contact.lastname;
                		document.getElementById("viewGender").textContent = contact.gendername;
                		document.getElementById("viewDob").textContent = formattedDob;
                		document.getElementById("viewAddress").textContent = contact.address;
                		document.getElementById("viewStreet").textContent = contact.street;
                		document.getElementById("viewPincode").textContent = contact.pincode;
                		document.getElementById("viewEmail").textContent = contact.email;
                		document.getElementById("viewPhone").textContent = contact.phone;


				const hobbiesElement = document.getElementById("viewHobbies");
    				if (contact.hobbies && Array.isArray(contact.hobbies)) 
				{
					const hobbiesList = contact.hobbies.map(hobby => hobby.hobbyName).join(", ");
       					hobbiesElement.textContent = hobbiesList || "None";
    				} 
				else {
        				hobbiesElement.textContent = "None";
				}
   		 		
            		}else {
                		console.error("Contact not found for ID:", contactId);
            		}
				
        	});
    	});
});

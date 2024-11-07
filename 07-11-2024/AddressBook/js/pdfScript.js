
function generatePdf(){
	var contacts = [];
	var rows = document.querySelectorAll('tbody tr');
	console.log(rows);
	rows.forEach(row =>{
		var id =row.getAttribute('data-id');
		
		var name = row.querySelector('td:nth-child(2)').innerText;
		var email = row.querySelector('td:nth-child(3)').innerText;
		var phone = row.querySelector('td:nth-child(4)').innerText;

		contacts.push({
                id: id,
                name: name,
                email: email,
                phone: phone

		
            });
		
		
	})
	
	window.location.href = 'pdfPage.cfm?contacts=' + encodeURIComponent(JSON.stringify(contacts));
	
	
}
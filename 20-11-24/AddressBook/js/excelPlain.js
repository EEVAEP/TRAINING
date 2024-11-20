function uploadExcelFile()
{
	const fileInput = document.getElementById("excelFile");
	const file = fileInput.files[0];

	if(!file)
	{
		alert("Please select a file first");
		return;
	}
	const formData = new FormData();
	formData.append("excelFile", file);
	
	$.ajax({
		url:'components/db.cfc?method=excelUploadedFile',
		type:'POST',
		dataType:'json',
		data:formData,
		processData:false,
		contentType:false,
		success:function (response) {
			console.log("AJAX response:", response);
                	if (response.STATUS === "success") {
				console.log("File found");
			
                    	} else {
				console.log("File not found ");
                    	}
                    
                } 
	            
			
	});
	
}
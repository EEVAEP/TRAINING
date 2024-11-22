
const excelDatas = jsonExcelData;

	
excelDatas.forEach(function(row){
	console.log(row);
	$.ajax({
		url:"components/db.cfc?method=validateAddEditContactDetails",
		type:"POST",
		data:{
			title: row.title,
			firstName: row.firstName,
                	lastName: row.lastName,
                	gender: row.gender,
                	dob: row.dob,
                	address: row.address,
                	street: row.street,
                	pincode: row.pincode,
                	email: row.email,
                	phone: row.phone,
                	hobbies: row.hobbies
            
		},
		dataType:"json",
		success: function(response) {
			console.log(response);
			
			console.log("data is ok");	
			
            	},
		error:function(){
			console.log("Request Failed");
		}
		
	})
})



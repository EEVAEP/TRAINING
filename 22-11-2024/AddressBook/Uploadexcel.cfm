<cftry>
	<cfset uploadPath = ExpandPath('./excelUploads/')>

	<cffile action = "upload" 
		destination = "#uploadPath#" 
		fileField = "excelFile" 
		nameConflict = "makeUnique" 
		result = "fileUploadResult">

	<cfset uploadedFilePath = uploadPath & fileUploadResult.serverFile>
	
	<cfspreadsheet action = "read" 
		src = "#uploadedFilePath#"
		query = "excelData"
		headerrow = "1"> 

	
	<cfset excelDataArray = []>
	<cfloop from="2" to="#excelData.recordCount#" index="i">
		<cfset rowStruct = {
			"title": excelData.TITLE[i],
			"firstName": excelData.FIRSTNAME[i],
			"lastName": excelData.LASTNAME[i],
			"gender": excelData.GENDER[i],
			"dob": excelData.DOB[i],
			"address": excelData.ADDRESS[i],
			"street": excelData.STREET[i],
			"pincode": excelData.PINCODE[i],
			"email": excelData.EMAIL[i],
			"phone": excelData.PHONE[i],
			"hobbies": excelData.hobbies[i]
		}>
		<cfset arrayAppend(excelDataArray, rowStruct)>
	</cfloop>
	
	<cfset jsonExcelData = serializeJSON(excelDataArray)>
	<script>
		var jsonExcelData = <cfoutput>#serializeJSON(excelDataArray)#</cfoutput>;
    	</script>
	
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>


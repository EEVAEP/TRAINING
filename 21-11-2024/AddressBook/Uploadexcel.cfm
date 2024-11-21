
<cftry>
	<cfset uploadPath = ExpandPath('./excelUploads/')>

	<cffile action = "upload" 
		destination="#uploadPath#" 
		fileField="excelFile" 
		nameConflict="makeUnique" 
		result="fileUploadResult">

	<cfset uploadedFilePath = uploadPath & fileUploadResult.serverFile>

	<cfset spreadsheetObj = SpreadsheetRead(uploadedFilePath)>
	<cfset totalRows = spreadsheetObj.ROWCOUNT>
	
	
	
	

	
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>


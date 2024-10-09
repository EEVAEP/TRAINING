<!DOCTYPE html>
<html>
	<head>
    		<title>Upload Text File</title>
	</head>
	<body>
      		<cfif structKeyExists(form, "submit")>

			<cfset uploadPath = expandPath('./uploads')>
        		<cffile action="upload" fileField="textFile" destination="#uploadPath#" nameconflict="overwrite">
			<cfdump var="#cffile#">
	
			<cfdump var="#uploadPath#\#cffile.serverFile#">
	
        		<cffile action="read" file="#uploadPath#\#cffile.serverFile#" variable="uploadedText">

        		<cfset words = listToArray(reReplace(uploadedText, "[^a-zA-Z\s]", "", "ALL"), " ")>
        		<cfset wordStruct = {}>

        
        		<cfloop array="#words#" index="local.word">
            			<cfif len(local.word) GTE 3 AND NOT isNumeric(local.word)>
                			<cftry>
                    				<cfquery datasource="ans25">
                        				INSERT INTO tags (word) VALUES (<cfqueryparam value="#local.word#" cfsqltype="cf_sql_varchar">)
                    				</cfquery>
                    				<cfcatch> <!-- Ignore errors --></cfcatch>
                			</cftry>
            			</cfif>
        		</cfloop>
        			<p>File uploaded and words saved successfully!</p>
		</cfif>

    

    		<form action="index.cfm" method="post" enctype="multipart/form-data">
			<h1>CF TASK 26</h1>
			<h3>Upload text file</h3>
        		<input type="file" name="textFile" accept=".txt"><br><br>
        		<input type="submit" name="submit" value="Upload">
    		</form>
	</body>
</html>

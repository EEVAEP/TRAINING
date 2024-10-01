
<cfif structKeyExists(form, "fileUpload") AND len(form.fileUpload) GT 0>
	<cfset uploadPath = expandPath('./uploads/')>
	<cffile action="upload" fileField="fileUpload" destination="#uploadPath#" accept="text/plain" nameConflict="overwrite">

    	<cfdump var="#uploadPath##cffile.serverFile#">
	<cfdump var=#cffile#>
	
   
    	<cfif fileExists("#uploadPath##cffile.serverFile#")>
      	<cfset fileContent = fileRead("#uploadPath##cffile.serverFile#")>


	 
        <cfquery datasource="ans26">
            	INSERT INTO filewordcounts (filename, filecontent)
            	VALUES (
                	<cfqueryparam value="#cffile.clientFile#" cfsqltype="cf_sql_varchar" maxlength="255">,
                	<cfqueryparam value="#fileContent#" cfsqltype="cf_sql_longvarchar">
            	)
        </cfquery>

        
        <cfoutput>
            <p>File uploaded and content saved to the database successfully!</p>
        </cfoutput>
        
    	<cfelse>
        	<cfoutput>Error: File upload failed. Please try again.</cfoutput>
    	</cfif>

	
        <cfquery name="getFileID" datasource="ans26">
            SELECT LAST_INSERT_ID() AS id
        </cfquery>


	<cfquery name="getFileContent" datasource="ans26">
		SELECT filecontent
		FROM filewordcounts
		WHERE id = <cfqueryparam value="#getFileID.id#" cfsqltype="cf_sql_integer">
	</cfquery>
	

	<cfset fileContent = getFileContent.filecontent>
	<cfset wordCount = listLen(trim(fileContent), " ")>
	<cfoutput>
    		<h3>Word Count: #wordCount#</h3>
	</cfoutput>

<cfelse>
    <cfoutput>Error: No file was uploaded. Please upload a valid text file.</cfoutput>
</cfif>











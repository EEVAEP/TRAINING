
<cftry>
    
	<cfparam name="form.jobPosition" default="">
	<cfparam name="form.willingness" default="">
	<cfparam name="form.startDate" default="">
	<cfparam name="form.portfolio" default="">
	<cfparam name="form.file" default="">
	<cfparam name="form.salary" default="">
	<cfparam name="form.name" default="">
    	<cfparam name="form.email" default="">
   	<cfparam name="form.clientPhone" default="">
	
	<cfset resumepath = "">
   
    	<cfif form.name neq "" and form.email neq "" and form.startDate neq "" and form.clientPhone neq "" and form.jobPosition neq "" and form.willingness neq "" and form.file neq "">

		<cfset path=ExpandPath('./uploads/')>
       		
		<cffile action="upload" fileField="file" destination="#path#" nameConflict="makeUnique" result="fileUploadResult">

		<cfset resumepath = fileUploadResult.serverFile>
		
		

        	<cfquery datasource="formdetails">
            		INSERT INTO employees (jobposition, willingness, startdate, portfolio, resumepath, salary, name, email, clientphone)
            		VALUES (
				<cfqueryparam value="#form.jobPosition#" cfsqltype="cf_sql_varchar" maxlength="45">,
				<cfqueryparam value="#form.willingness#" cfsqltype="cf_sql_varchar" maxlength="5">,
				<cfqueryparam value="#form.startDate#" cfsqltype="cf_sql_date">,
				<cfqueryparam value="#form.portfolio#" cfsqltype="cf_sql_varchar" maxlength="40">,
				<cfqueryparam value="#resumepath#" cfsqltype="cf_sql_varchar" maxlength="255">,
				<cfqueryparam value="#form.salary#" cfsqltype="cf_sql_numeric">,
				<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar" maxlength="45">,
                		<cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="45">,               
                		<cfqueryparam value="#form.clientPhone#" cfsqltype="cf_sql_varchar" maxlength="10">
            			)
        	</cfquery>

       
        	<cfoutput>
            		<p style="color:green;">Form submitted successfully and data has been inserted into the database.</p>
        	</cfoutput>

    	<cfelse>
       
        	<cfoutput>
            		<p style="color:red;">Please make sure all fields are filled out correctly before submitting.</p>
        	</cfoutput>
    	</cfif>

  
	<cfcatch type="any">
        	<cfoutput>
            		<p style="color:red;">An error occurred: #cfcatch.message#</p>
        	</cfoutput>
    	</cfcatch>
</cftry>

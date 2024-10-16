<cfcomponent displayName="EmployeeService" output="false">

	<cffunction name="getJobPositions" access="public" returntype="query">
        	
        	<cfquery name="local.jobPositions" datasource="formdetails">
            		SELECT 
				id,
				job_title
			 FROM 
				job_positions
        	</cfquery>
        	<cfreturn local.jobPositions>
    	</cffunction>

        <cffunction name="processEmployeeForm" access="public" returntype="struct">
        
        	<cfargument name="jobPosition" type="string" required="true">
        	<cfargument name="willingness" type="string" required="true">
        	<cfargument name="startDate" type="date" required="true">
        	<cfargument name="portfolio" type="string" required="false">
        	<cfargument name="file" type="string" required="true">
        	<cfargument name="salary" type="numeric" required="true">
        	<cfargument name="name" type="string" required="true">
        	<cfargument name="email" type="string" required="true">
        	<cfargument name="clientPhone" type="string" required="true">

       
        	<cfset local.uploadPath = ExpandPath('./uploads/')>

        
        	<cffile action="upload" fileField="file" destination="#local.uploadPath#" nameConflict="makeUnique" result="fileUploadResult">

        	<cfset local.resumepath = fileUploadResult.serverFile>

        	<cfquery datasource="formdetails">
            		INSERT INTO 
				employees (job_position_id, willingness, startdate, portfolio, resumepath, salary, name, email, clientphone)
            		VALUES (
                		<cfqueryparam value="#arguments.jobPosition#" cfsqltype="cf_sql_varchar" maxlength="45">,
                		<cfqueryparam value="#arguments.willingness#" cfsqltype="cf_sql_varchar" maxlength="5">,
                		<cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date">,
                		<cfqueryparam value="#arguments.portfolio#" cfsqltype="cf_sql_varchar" maxlength="60">,
                		<cfqueryparam value="#local.resumepath#" cfsqltype="cf_sql_varchar" maxlength="255">,
                		<cfqueryparam value="#arguments.salary#" cfsqltype="cf_sql_numeric">,
                		<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" maxlength="45">,
                		<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" maxlength="45">,
                		<cfqueryparam value="#arguments.clientPhone#" cfsqltype="cf_sql_varchar" maxlength="10">
            		)
        	</cfquery>

        	<cfset local.result = {success = true, message = "Form submitted successfully and data has been inserted into the database."}>
        	<cfreturn local.result>
    	</cffunction>

</cfcomponent>

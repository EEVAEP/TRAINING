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

   
    	<cfif form.name neq "" and form.email neq "" and form.startDate neq "" and form.clientPhone neq "" and form.jobPosition neq "" and form.willingness neq "" and form.file neq "">

        	<cfset local.employeeService = createObject("component", "components.EmployeeService")>
        	<cfset local.result = local.employeeService.processEmployeeForm(
            		jobPosition = form.jobPosition,
            		willingness = form.willingness,
            		startDate = form.startDate,
            		portfolio = form.portfolio,
            		file = form.file,
            		salary = form.salary,
            		name = form.name,
            		email = form.email,
            		clientPhone = form.clientPhone
        	)>

        
        	<cfoutput>
            		<p>#local.result.message#</p>
        	</cfoutput>

    	<cfelse>
        	<cfoutput>
            		<p>Please make sure all fields are filled out correctly before submitting.</p>
        	</cfoutput>
    	</cfif>

        <cfcatch>
        	<cfoutput>
            		<p>#cfcatch#</p>
        	</cfoutput>
    	</cfcatch>

</cftry>


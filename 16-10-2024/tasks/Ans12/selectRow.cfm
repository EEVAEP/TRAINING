<cfparam name="rowNum" default="0">


<cfif not isNumeric(rowNum) or rowNum LT 1 or rowNum GT 9>
	<cfoutput>
        	<p>Invalid input. Please enter a valid input</p>
    	</cfoutput>
    	<cfabort>
</cfif>


<cfset empObj = createObject("component", "components.Employee")>


<cfset EmpDetails = empObj.getAllEmployees()>
<cfoutput>
    	<h3>Table Records</h3>
    	<table border="1">
        	<tr>
            		<th>FirstName</th>
            		<th>LastName</th>
        	</tr>
        	<cfloop query="EmpDetails">
            		<tr>
                		<td>#EmpDetails.firstname#</td>
                		<td>#EmpDetails.lastname#</td>
            		</tr>
        	</cfloop>
    	</table>
</cfoutput>


<cfset nthRow = empObj.getNthEmployee(rowNum=rowNum)>
<cfoutput>
    	<h4>FirstName of the #rowNum#th Row</h4>
    	<p>#nthRow.firstname#</p>
</cfoutput>

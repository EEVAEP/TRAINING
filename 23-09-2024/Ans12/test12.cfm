
<h3>Table Records</h3>
<cfparam name="rowNum" default="0">

<cfif not isNumeric(rowNum) or rowNum LT 1 or rowNum GT 9>
	<cfoutput>
		<p>invalid input. Please enter a valid input<p>
	</cfoutput>
	<cfabort>
</cfif>

<cfquery name="EmpDetails" datasource="task28">
	SELECT Firstname, Lastname
	FROM personDetails
</cfquery>


<cfoutput>
	
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

<cfquery name="nthRow" datasource="task28">
	SELECT firstname
    	FROM persondetails
    	ORDER BY firstname
    	LIMIT #rowNum - 1#, 1
</cfquery>
	
<cfoutput>
	<h4>FirstName of the #rowNum#th Row</h4>
    	<p>#nthRow.firstname#</p>
</cfoutput>


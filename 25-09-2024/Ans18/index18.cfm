<cfset myQuery = queryNew("ID,Name,email", "integer,varchar,varchar")>

<cfset queryAddRow(myQuery,3)>

<cfset querySetCell(myQuery, "ID", 1, 1)>
<cfset querySetCell(myQuery, "Name", "Megha Sara", 1)>
<cfset querySetCell(myQuery, "email", "meghasara@gmail.com",1)>



<cfset querySetCell(myQuery, "ID", 2, 2)>
<cfset querySetCell(myQuery, "Name", "Shan Shaji", 2)>
<cfset querySetCell(myQuery, "email", "shan123@gmail.com",2)>



<cfset querySetCell(myQuery, "ID", 3, 3)>
<cfset querySetCell(myQuery, "Name", "Ananya S", 3)>
<cfset querySetCell(myQuery, "email", "ananyas@gmail.com",3)>


<cfdump var="#myQuery#">




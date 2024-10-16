
<cfscript>
	jsonData = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]';
    
    	data = deserializeJson(jsonData);

</cfscript>


<table border="1">
	<thead>
        	<tr>
            		<th>Name</th>
            		<th>Age</th>
            		<th>Location</th>
        	</tr>
    	</thead>
    	<tbody>
        	<cfloop array="#data#" index="item">
            		<tr>
                		<cfoutput><td>#item.Name#</td>
                		<td>#item.Age#</td>
                		<td>#item.LOCATION#</td></cfoutput>
            		</tr>
        	</cfloop>
    	</tbody>
</table>

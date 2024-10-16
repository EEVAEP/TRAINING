<cfif NOT structKeyExists(session, "role") OR (session.role NEQ 'admin' AND session.role NEQ 'editor')>
	<cflocation url="./login.cfm" addtoken="false">
</cfif>

<cftry>
	<cfset qryPages = application.userService.getPages()>
	
	<cfcatch>
		<cfdump var="#cfcatch#">
		
	</cfcatch>
</cftry>

<html>
    	<head>
        	<title>Admin Dashboard</title>
		<link rel="stylesheet" href="./css/style.css">
		<script src="./js/jquery.js"></script>
		<script src="./js/script.js"></script>
    	</head>
    	<body>
        	<h2 style="color:green;">Admin Dashboard</h2>
        	<h3>Welcome, to admin dashboard</h3>

        	<button><a href="add_page.cfm">Add New Page</a></button><br><br>

        	<table border="1">
            		<tr>
                		<th>Page Name</th>
                		<th>Description</th>
               	 		<th>Actions</th>
            		</tr>
            		<cfoutput query="qryPages">
            			<tr>
                			<td>#pagename#</td>
                			<td>#pagedesc#</td>
                			<td>
                    				<button><a href="edit_page.cfm?pageid=#pageid#">Edit</a></button>
                    				<button><a href="javascript:void(0);" onclick="confirmDelete(#pageid#)">Delete</a></button>
                			</td>
            			</tr>
            		</cfoutput>
        	</table>
		<p><a href="logout.cfm">Logout</a></p>

		<div id="modalOverlay"></div>
        	<div id="confirmModal">
            		<p>Are you sure you want to delete this page?</p>
            		<input type="hidden" id="deletePageId">
            		<button onclick="deletePage()">Yes</button>
            		<button onclick="closeModal()">No</button>
        	</div>
    	</body>
</html>

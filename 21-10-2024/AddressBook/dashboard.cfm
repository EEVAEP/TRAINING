<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Address Book Dashboard</title>
    		<link rel="stylesheet" href="styleDashboard.css">
	</head>
	<body>
    		<div class="dashboard-container">
        		<div class="header">
            			<h2>ADDRESS BOOK</h2>
            			<button class="logout-button">Logout</button>
        		</div>

        		<div class="main-content">
           			<div class="left-panel">
                			<div class="user-info">
                    				<img src="user-placeholder.png" alt="User Image">
                    				<h3>user name</h3>
                			</div>
                			<button class="create-contact">Create Contact</button>
            			</div>

           
            			<div class="content">
                			<div class="toolbar">
                    				<button class="toolbar-button"><img src="pdf-icon.png" alt="Export PDF"></button>
                    				<button class="toolbar-button"><img src="excel-icon.png" alt="Export Excel"></button>
                    				<button class="toolbar-button"><img src="print-icon.png" alt="Print"></button>
                			</div>

                			<table class="contacts-table">
                    				<thead>
                        				<tr>
                            					<th>NAME</th>
                            					<th>EMAIL ID</th>
                            					<th>PHONE NUMBER</th>
                            					<th>ACTIONS</th>
                        				</tr>
                    				</thead>
                    				<tbody>
                        				<tr>
                            					<td></td>
                            					<td></td>
                            					<td></td>
                            					<td>
                                					<button class="action-button">EDIT</button>
                                					<button class="action-button">DELETE</button>
                                					<button class="action-button">VIEW</button>
                            					</td>
                        				</tr>
                        				<tr>
                            					<td></td>
                            					<td></td>
                            					<td></td>
                            					<td>
                                					<button class="action-button">EDIT</button>
                                					<button class="action-button">DELETE</button>
                                					<button class="action-button">VIEW</button>
                            					</td>
                        				</tr>
                    				</tbody>
                			</table>
            			</div>
        		</div>
    		</div>
	</body>
</html>

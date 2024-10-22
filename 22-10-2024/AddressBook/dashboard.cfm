
<cfif NOT structKeyExists(session, "username")>
	<cflocation url="login.cfm" addtoken="false">
</cfif>

<!DOCTYPE html>
<html lang="en">

	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Address Book Dashboard</title>
    		<link href="./css/styleDashboard.css" rel="stylesheet">
    		<link href="./css/bootstrap.min.css" rel="stylesheet">
    
	</head>

	<body>
    		<div class="container-fluid h-100 d-flex flex-column">
        
        		<header class="custom-bg text-white d-flex justify-content-between align-items-center py-3 px-4 fixed-top">
            			<h2 class="m-0">ADDRESS BOOK</h2>
            			<a href="logout.cfm" class="btn btn-light">Logout</a>
        		</header>

       
        		<div class="row flex-grow-1 mt-4 pt-4">
            			<div class="col-lg-3 col-md-4 p-4 custom-background d-flex flex-column align-items-center">
                			<div class="text-center mb-3">
                    				<img src="./img/user.png" alt="User Image" class="img-thumbnail rounded-circle mt-3" width="140">
                    				<h3 class="mt-3">user name</h3>
                			</div>
                			<button class="btn btn-primary w-100 mb-4" data-bs-toggle="modal" data-bs-target="#createContactModal">Create Contact</button>
            			</div>

           
            			<div class="col-lg-9 col-md-8 p-4 mt-2">
                			<div class="d-flex justify-content-end mb-3">
                    				<button class="btn btn-primary me-2">PDF</button>
                    				<button class="btn btn-primary me-2">Export Excel</button>
                    				<button class="btn btn-primary">Print</button>
                			</div>

                
                			<div class="table-responsive">
                    				<table class="table table-striped">
                        				<thead class="table-primary">
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
                                    						<button class="btn btn-sm btn-outline-primary me-2">EDIT</button>
                                    						<button class="btn btn-sm btn-outline-danger me-2">DELETE</button>
                                    						<button class="btn btn-sm btn-outline-info">VIEW</button>
                                					</td>
                            					</tr>
                            					<tr>
                                					<td></td>
                                					<td></td>
                                					<td></td>
                                					<td>
                                    						<button class="btn btn-sm btn-outline-primary me-2">EDIT</button>
                                    						<button class="btn btn-sm btn-outline-danger me-2">DELETE</button>
                                    						<button class="btn btn-sm btn-outline-info">VIEW</button>
                                					</td>
                            					</tr>
                        				</tbody>
                    				</table>
                			</div>
            			</div>
        		</div>
    		
		<div class="modal fade" id="createContactModal" tabindex="-1" role="dialog" aria-labelledby="createContactModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createContactModalLabel">Create Contact</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h6>Personal Contact</h6>
                <form>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <select class="form-control" id="title">
                            <option value="">Select Title</option>
                            <option value="Mr">Mr</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Ms">Ms</option>
                            <option value="Dr">Dr</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="Enter First Name" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender">
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" class="form-control" id="dob" required>
                    </div>
                    <div class="form-group">
                        <label for="photo">Upload Photo</label>
                        <input type="file" class="form-control-file" id="photo">
                    </div>
                    
                    <h6>Contact Details</h6>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="Enter Address" required>
                    </div>
                    <div class="form-group">
                        <label for="pincode">Pincode</label>
                        <input type="text" class="form-control" id="pincode" placeholder="Enter Pincode" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter Email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Enter Phone Number" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save Contact</button>
            </div>
        </div>
    </div>
</div></div>
		<script src="./js/bootstrap.min.js"></script>
		<script src="./js/bootstrap.bundle.min.js"></script>

		
	</body>
</html>



<cfif NOT structKeyExists(session, "username")>
	<cflocation url="login.cfm" addtoken="false">
</cfif>

<cfif structKeyExists(form, "submit")>
	<cfset variables.validationContact = application.userService.validateContact(form.title, 
									form.firstName,
									form.lastName, 
									form.gender, 
									form.dob, 
									form.photo, 
									form.address, 
									form.street, 
									form.pincode, 
									form.email, 
									form.phone)>
	
</cfif>
<cftry>
<cfif structKeyExists(variables, "validationContact") AND arrayLen(validationContact) EQ 0>
	<cfset contactUser = application.userService.contactUser( form.contactId, 
									form.title,
									form.firstName,
									form.lastName, 
									form.gender, 
									form.dob, 
									form.photo, 
									form.address, 
									form.street, 
									form.pincode, 
									form.email, 
									form.phone)>


</cfif>
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cftry>
	<cfset qryPages = application.userService.getPages()>
	
	<cfcatch>
		<cfdump var="#cfcatch#">
		
	</cfcatch>
</cftry>


<!DOCTYPE html>
<html lang="en">

	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Address Book Dashboard</title>
    		<link href="./css/styleDashboard.css" rel="stylesheet">
		<link href="./css/pdfStyle.css" rel="stylesheet">
		<link href="./css/printPage.css" rel="stylesheet" media="print">
    		<link href="./css/bootstrap.min.css" rel="stylesheet">
		

    
	</head>

	<body>
    		<div class="container-fluid h-100 d-flex flex-column">
        
        		<header class="custom-bg text-white d-flex justify-content-between align-items-center py-3 px-4 fixed-top">
            			<h2 class="m-0 addresshead">ADDRESS BOOK</h2>
            			<a href="login.cfm?logOut" class="btn btn-light">Logout</a>
        		</header>

       
        		<div class="row mt-4 pt-4">
            			<div class="col-lg-3 col-md-4 p-5 custom-background d-flex flex-column align-items-center">
                			<div class="text-center mb-3">
                    				<img src="./img/user.png" alt="User Image" class="img-thumbnail rounded-circle mt-3" width="140">
                    				<h3 class="mt-3">
							<cfoutput>
								#session.username#
							</cfoutput>
						</h3>
                			</div>
                			<button type="button" 
						class="btn btn-primary w-100 mb-4 add" 
						data-bs-toggle="modal" data-bs-target="#createContactModal">
						Create Contact
					</button>

            			</div>

           
            			<div class="col-lg-9 col-md-8 p-4 mt-2">
                			<div class="d-flex justify-content-end mb-3">
                    				<button class="btn btn-primary me-2" onclick="generatePdf()">PDF</button>
                    				<button class="btn btn-primary me-2" onclick="window.location.href='excelPage.cfm'">Export Excel</button>
                    				<button class="btn btn-primary no-print" media="print" onclick="window.print()">Print</button>
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
    								<cfloop from="1" to="#qryPages.recordCount#" index="i">
        								<tr data-id=<cfoutput>"#qryPages.idcontact[i]#"</cfoutput>>
									<cfoutput>
            									<td>#qryPages.Fullname[i]#</td>
            									<td>#qryPages.email[i]#</td>
            									<td>#qryPages.phone[i]#</td>
									</cfoutput>
            								<td>
										<button type="button" 
											class="btn btn-sm btn-outline-primary me-2 edit" 
											data-bs-toggle="modal" 
											data-bs-target="#createContactModal"
											data-id=<cfoutput>"#qryPages.idcontact[i]#"</cfoutput>>
											
											EDIT
										</button>
										<button class="btn btn-sm btn-outline-danger me-2 delete"
											data-bs-toggle="modal" 
											data-bs-target="#deleteConfirmModal"
											data-id=<cfoutput>"#qryPages.idcontact[i]#"</cfoutput>>
	
											DELETE
										</button>
                								<button class="btn btn-sm btn-outline-info view"
											data-bs-toggle="modal" 
											data-bs-target="#viewContactModal"
											data-id=<cfoutput>"#qryPages.idcontact[i]#"</cfoutput>>
											VIEW
										</button>
									</td>


        								</tr>
    								</cfloop>
							</tbody>

						</table>
						<cftry>
						<cfset contactData = []> 
						<cfloop from="1" to="#qryPages.recordCount#" index="i">
    							<cfset contact = {
        							"id" : qryPages.idcontact[i],
								"titleFullname" : qryPages.titleFullname[i],
        							"firstname" : qryPages.firstname[i],
								"lastname" : qryPages.lastname[i],
        							"email" : qryPages.email[i],
        							"phone" : qryPages.phone[i],
        							"title" : qryPages.titleid[i],
        							"gender" : qryPages.genderid[i],
        							"dob" : qryPages.dob[i],
        							"address" : qryPages.address[i],
        							"street" : qryPages.street[i],
        							"pincode" : qryPages.pincode[i],
								"titlename":qryPages.titlename[i],
								"gendername":qryPages.gendername[i]
    								}>
    								<cfset arrayAppend(contactData, contact)>
						</cfloop>
						<cfset session.contactData = contactData>
						<cfset jsonContactData = serializeJSON(contactData)>
						
						
						<script>
        						var jsonContactData = <cfoutput>#serializeJSON(contactData)#</cfoutput>;
    						</script>

						<cfcatch>
							<cfdump var="#cfcatch#">
						</cfcatch>
						</cftry>
                			</div>
            			</div>
        		</div>
    		
			<div class="modal fade" 
				id="createContactModal"  
				data-bs-backdrop="static" 
				data-bs-keyboard="false" 
				tabindex="-1" 
				role="dialog" 
				aria-labelledby="createContactModalLabel" 
				aria-hidden="true">

    				<div class="modal-dialog" role="document">
        				<div class="modal-content">
            					<div class="modal-header">
							<h5 class="modal-title mx-auto d-block" id="createContactModalLabel">Contact Details</h5>
                					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    						<span aria-hidden="true">&times;</span>
                					</button>
            					</div>
            					<div class="modal-body">
                					<h6 class="pt-2">Personal Contact</h6>
                					<form method="post" action="dashboard.cfm" enctype="multipart/form-data">
								<div class="row">
		
									<cfset titleNameQuery = application.userService.getTitleName()>
										<div class="form-group col-md-2">
                        							<label for="title">Title</label>
                        							<select class="form-control" id="title" name="title">
                            								<cfoutput query="titleNameQuery">
                        									<option value="#titleNameQuery.idtitle#">#titleNameQuery.titlename#</option>
                    									</cfoutput>
                        							</select>
                    							</div>
									
                    							<div class="form-group col-md-5">
                        							<label for="firstName">First Name</label>
                        							<input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name" required>
                    							</div>
                    							<div class="form-group col-md-5">
                        							<label for="lastName">Last Name</label>
                        							<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name" required>
                    							</div>
								</div>
								<div class="row">
									<cftry>
									<cfset genderNameQuery = application.userService.getGenderName()>
                    							<div class="form-group col-md-6 pt-2">
										
                        							<label for="gender">Gender</label>
                        							<select class="form-control" id="gender" name="gender">
											<cfoutput query="genderNameQuery">
                            									<option value="#genderNameQuery.idgender#">#genderNameQuery.gendername#</option>
											</cfoutput>
                        							</select>
                    							</div>
									<cfcatch>
										<cfdump var="#cfcatch#">
									</cfcatch>
									</cftry>
                    							<div class="form-group col-md-6 pt-2">
                        							<label for="dob">Date of Birth</label>
                        							<input type="date" class="form-control" id="dob" name="dob" required>
                    							</div>
								</div>
                    						<div class="form-group pt-3">
                        						<label for="photo">Upload Photo</label>
                        						<input type="file" class="form-control-file" id="photo" name="photo" required>
                    						</div>
                    
                    						<h6 class="pt-3">Contact Details</h6>
                    						<div class="form-group pt-1">
                        						<label for="address">Address</label>
                        						<input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" required>
                    						</div>
								<div class="form-group pt-1">
                        						<label for="address">Street</label>
                        						<input type="text" class="form-control" id="street" name="street" placeholder="Enter Address" required>
                    						</div>
                    						<div class="form-group pt-1">
                        						<label for="pincode">Pincode</label>
                        						<input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter Pincode" required>
                    						</div>
                    						<div class="form-group pt-1">
                        						<label for="email">Email</label>
                        						<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
                    						</div>
                    						<div class="form-group pt-1">
                        						<label for="phone">Phone</label>
                        						<input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone Number" required>
                    						</div>
								
								<button id="saveContactBtn" name="submit" class="btn btn-primary mt-3 mb-4 mx-auto d-block col-md-5">Save Contact</button>
								<input type="hidden" id="contactId" name="contactId">
								<div id="errorMessages"></div>
								
                					</form>
							
            					</div>
            				</div>
    				</div>
			</div>
			<cfif structKeyExists(variables, "validationContact") AND arrayLen(validationContact) GT 0>
				<cfoutput>
					<cfloop array="#validationContact#" index="error">
                    				<span class="error">#error#</span>
                			</cfloop>
            			</cfoutput>

        						
    			</cfif>


			<div class="modal fade" 
				id="deleteConfirmModal" 
				tabindex="-1" 
				aria-labelledby="deleteConfirmLabel" 
				aria-hidden="true">
    				<div class="modal-dialog">
        				<div class="modal-content">
            					<div class="modal-header">
                					<h5 class="modal-title" id="deleteConfirmLabel">Confirm Deletion</h5>
                					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            					</div>
            					<div class="modal-body">
                					Are you sure you want to delete this contact?
            					</div>
            					<div class="modal-footer">
                					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
               
                					<button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
            					</div>
        				</div>
    				</div>
			</div>


			<div class="modal fade" 
					id="viewContactModal"
					data-bs-backdrop="static" 
					data-bs-keyboard="false" 
					tabindex="-1" 
					aria-labelledby="viewContactModalLabel" 
					aria-hidden="true">
    					<div class="modal-dialog">
        					<div class="modal-content">
            						<div class="modal-header">
                						<h5 class="modal-title  mx-auto d-block" id="viewContactModalLabel">View Contact Details</h5>
                						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            						</div>
            						<div class="modal-body">
								<p><strong>Name:</strong> <span id="viewName"></span></p>
                						<p><strong>Title:</strong> <span id="viewTitle"></span></p>
                						<p><strong>First Name:</strong> <span id="viewFirstName"></span></p>
                						<p><strong>Last Name:</strong> <span id="viewLastName"></span></p>
                						<p><strong>Gender:</strong> <span id="viewGender"></span></p>
                						<p><strong>Date of Birth:</strong> <span id="viewDob"></span></p>
                						<p><strong>Address:</strong> <span id="viewAddress"></span></p>
                						<p><strong>Street:</strong> <span id="viewStreet"></span></p>
                						<p><strong>Pincode:</strong> <span id="viewPincode"></span></p>
                						<p><strong>Email:</strong> <span id="viewEmail"></span></p>
                						<p><strong>Phone:</strong> <span id="viewPhone"></span></p>
            						</div>
        					</div>
    					</div>
				</div>

			
		</div>
		<script src="./js/bootstrap.min.js"></script>
		<script src="./js/bootstrap.bundle.min.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/contactForm.js"></script>
		<script src="js/deleteScript.js"></script>
		<script src="js/viewScript.js"></script>
		<script src="js/pdfScript.js"></script>
		

		
	</body>
</html>


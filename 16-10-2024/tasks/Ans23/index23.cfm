<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Complete Form with Validation</title>
    		<link rel="stylesheet" href="./css/style.css">
    
	</head>
	<body>
    		<div class="container">
    			<div class="form-container">
        			<form id="myForm" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
            				<h2>Employee Application</h2>

					<cfset employeeService = createObject("component", "components.EmployeeService")>
                			<cfset jobPositionsQuery = employeeService.getJobPositions()>

                               		<label for="jobPosition">Which position are you applying for?</label>
                			<select id="jobPosition" name="jobPosition">
                    				<option value="" disabled selected></option>
                    				<cfoutput query="jobPositionsQuery">
                        				<option value="#jobPositionsQuery.id#">#jobPositionsQuery.job_title#</option>
                    				</cfoutput>
                			</select>
					<span id="jobPositionTypeError" class="error"></span>


					<div class="radio-group">
    						<label for="relocate">Are you willing to relocate?</label>
    						<label for="positive">Yes</label>
    						<input type="radio" id="positive" name="willingness" value="Yes">
    						<label for="negative">No</label>
    						<input type="radio" id="negative" name="willingness" value="No">
	    				</div>
					<span id="relocateError" class="error"></span>


					<label for="startDate">When can you start?</label>
            				<input type="date" id="startDate" name="startDate" >
            				<span id="startDateError" class="error"></span>


					<label for="portfolio">portfolio website</label>
            				<input type="url" id="portfolio" name="portfolio" placeholder="https://" >
					<!--- https://www.odesk.com/jobs/Frontend-engineer --->
            				<span id="portfolioError" class="error"></span>
					
					<label for="file">Attach a copy of your resume</label>
            				<input type="file" id="file" name="file" >
            				<span id="fileError" class="error"></span>
			
					<label for="salary">Salary Requirements<label>
					<input type="number" id="salary" name="salary">
					<span id="salaryError" class="error"></span>


            				<label for="name">Name:</label>
            				<input type="text" id="name" name="name" >
            				<span id="nameError" class="error"></span>

            				<label for="email">Email:</label>
            				<input type="email" id="email" name="email" >
            				<span id="emailError" class="error"></span>

  
            
            				<label for="clientPhone">Client Phone Number:</label>
            				<input type="tel" id="clientPhone" name="clientPhone" >
            				<span id="clientPhoneError" class="error"></span>

            

            				<button type="submit">Submit</button>
        			</form>
			</div>
    		</div>
    		<script src="./js/javascript.js"></script>
	</body>
</html>



<!---CREATE TABLE job_positions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(100) NOT NULL
);

INSERT INTO job_positions (job_title)
VALUES 
    ('Interface Designer'),
    ('Software Engineer'),
    ('System Administrator'),
    ('Office Manager');


ALTER TABLE employees
ADD job_position_id INT,
ADD CONSTRAINT fk_job_position
FOREIGN KEY (job_position_id) REFERENCES job_positions(id);--->



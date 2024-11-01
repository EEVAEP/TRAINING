<cfcomponent>

	
	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
	</cffunction>

	

    	<cffunction name="validateUserInput" access="public" returntype="array">
        
        	<cfargument name="fullname" type="string" required="true">
		<cfargument name="email" type="string" required="true">
        	<cfargument name="username" type="string" required="true">
        	<cfargument name="password" type="string" required="true">
        	<cfargument name="confirmPassword" type="string" required="true">

		<cfset var errors = []>

        
        	<cfif len(trim(arguments.fullname)) EQ 0>
            		<cfset arrayAppend(errors, "*Fullname is required")>
        	<cfelseif NOT reFindNoCase("^[A-Za-z]+(\s[A-Za-z]+)*$", arguments.fullname)>
			<cfset arrayAppend(errors, "*Enter a valid fullname")>
        	</cfif>

        
        	<cfif len(trim(arguments.email)) EQ 0>
            		<cfset arrayAppend(errors, "*Email is required")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", arguments.email)>
            		<cfset arrayAppend(errors, "*Enter a valid email")>
        	</cfif>

       
        	<cfif len(trim(arguments.username)) EQ 0>
            		<cfset arrayAppend(errors, "*Please enter the username")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z_][a-zA-Z0-9_]{3,13}$", arguments.username)>
            		<cfset arrayAppend(errors, "*Please enter a valid username")>
        	</cfif>

       
        	<cfif len(trim(arguments.password)) EQ 0>
            		<cfset arrayAppend(errors, "*Please enter the password")>
        	<cfelseif NOT reFindNoCase("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$", arguments.password)>
            		<cfset arrayAppend(errors, "*Please enter a valid password (minimum 8 characters, 1 lowercase, 1 uppercase, 1 special character)")>
        	</cfif>

        
        	<cfif len(trim(arguments.confirmPassword)) EQ 0>
        		<cfset arrayAppend(errors, "*Password confirmation is required")>
        	<cfelseif arguments.confirmPassword NEQ arguments.password>
            		<cfset arrayAppend(errors, "*Password confirmation does not match the password")>
        	</cfif>

        
        	<cfreturn errors>

    	</cffunction>

	
	<cffunction name="registerUser" returntype="struct">
    		<cfargument name="fullname" type="string" required="true">
		<cfargument name="email" type="string" required="true">
        	<cfargument name="username" type="string" required="true">
        	<cfargument name="password" type="string" required="true">
        	
		<cfset var local ={}>

		<cfquery name="qryCheckUser" datasource="addressbook">
        		SELECT *
        		FROM 
				register
        		WHERE 
				username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
			AND	email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
    		</cfquery>

		<cfif qryCheckUser.recordCount EQ 0>
			<cfset local.hashedPassword = hashPassword(arguments.password)>

			<cfquery datasource="addressbook">
        			INSERT INTO 
					register (fullname, email, username, password)
        			VALUES(
					<cfqueryparam value="#arguments.fullname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
            				<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
        			)
    			</cfquery>
			
			<cfset local.result.success = true>
			<cfset local.result.message = "Registration successful. Please login">

		<cfelse>
			<cfset local.result.success = false>
			<cfset local.result.message = "User already exists. Please login">
		</cfif>

		<cfreturn local.result>

	</cffunction>

	

	<cffunction name="validateUser" access="public" returntype="struct">
    		<cfargument name="username" required="true" type="string">
    		<cfargument name="password" required="true" type="string">
		
		<cfset var local={}>
    
        	<cfset local.hashedPassword = hashPassword(arguments.password)>
		
		<cfquery name="local.qryLogin" datasource="addressbook">
        		SELECT 
				id AS userid,
				username
        		FROM 
				register
        		WHERE 
				username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        		AND 
				password = <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
    		</cfquery>
	
		<cfset local.result = {}>
		

    		<cfif local.qryLogin.recordCount EQ 1>
        		<cfset local.result.userid = local.qryLogin.userid>
			<cfset local.result.username = local.qryLogin.username>
		</cfif>
    		
		<cfreturn local.result>
	</cffunction>



	<cffunction name="getTitleName" access="public" returntype="query">
        	<cfquery name="local.titleName" datasource="addressbook">
            		SELECT 
				idtitle,
				titlename
			 FROM 
				title
        	</cfquery>
        	<cfreturn local.titleName>
    	</cffunction>


	<cftry>
	<cffunction name="getGenderName" access="public" returntype="query">
		<cfquery name="local.genderTitle" datasource="addressbook">
			SELECT
				idgender,
				gendername
			FROM
				gender
				
		</cfquery>
		<cfreturn local.genderTitle>
	</cffunction>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	</cftry>

	<cffunction name="validateContact" access="public" returntype="array">

		<cfargument name="title" type="string" required="true">
		<cfargument name="firstName" type="string" required="true">
        	<cfargument name="lastName" type="string" required="true">
        	<cfargument name="gender" type="string" required="true">
		
        	<cfargument name="dob" type="string" required="true">
		<cfargument name="photo" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="street" type="string" required="true">
		<cfargument name="pincode" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="phone" type="string" required="true">

		<cfset var errors = []>


		<cfset var validTitles = []>
    		<cfset titleQuery = getTitleName()>
    		<cfloop query="titleQuery">
        		<cfset arrayAppend(validTitles, titleQuery.idtitle)>
    		</cfloop>
		<cfif NOT arrayContains(validTitles, arguments.title)>
        		<cfset arrayAppend(errors, "*The title must be one of the following: " & arrayToList(validTitles, ", "))>
    		</cfif>
	
		
		<cfif trim(arguments.firstName) EQ "">
        		<cfset arrayAppend(errors, "*First Name is required.")>
    		<cfelseif not reFind("^[A-Za-z]+$", trim(arguments.firstName))>
        		<cfset arrayAppend(errors, "*First Name cannot contain numbers or special characters.")>
    		</cfif>


		<cfif trim(arguments.lastName) EQ "">
    			<cfset arrayAppend(errors, "*Last Name is required.")>
		<cfelseif not reFind("^[A-Za-z]+(\s[A-Za-z]+)*$", trim(arguments.lastName))>
    			<cfset arrayAppend(errors, "*Last Name cannot contain numbers or special characters.")>
		</cfif>



		<cfset var validGender = []>
		<cfset genderQuery= getGenderName()>
		<cfloop query="genderQuery">
			<cfset arrayAppend(validGender, genderQuery.idgender)>
		</cfloop>
		<cfif NOT arrayContains(validGender, arguments.gender)>
			<cfset arrayAppend(errors, "*Enter a valid gender")>
		</cfif>	
		


		<cfif not isDate(arguments.dob)>
        		<cfset arrayAppend(errors, "*Date of Birth must be a valid date.")>
    		</cfif>


		<cfset local.uploadPath = ExpandPath('./uploads/')>
		<cfif structKeyExists(form, "photo") AND form.photo NEQ "">
			<cffile action="upload" fileField="photo" destination="#local.uploadPath#" nameConflict="makeUnique" result="fileUploadResult">
			<cfset var originalFileName = fileUploadResult.serverFile>
		

			<cfset var allowedFormats = "jpg,jpeg,png,jfif">
    			<cfset var imageExtension = ListLast(originalFileName, ".")> 
		
			<cfif NOT ListFindNoCase(allowedFormats, imageExtension)>
        			<cfset arrayAppend(errors, "*Invalid image format. Only JPG, JPEG, and PNG are allowed")>
    			</cfif>
		<cfelse>
    			<cfset arrayAppend(errors, "*Image is required. Please upload a valid image file.")>
		</cfif>


		
		<cfif trim(arguments.address) EQ "">
			<cfset arrayAppend(errors, "*Address is required.")>
		</cfif>

		
		<cfif trim(arguments.street) EQ "">
			<cfset arrayAppend(errors, "*Street is required.")>
		</cfif>

		<cfif trim(arguments.pincode) EQ "" OR (NOT isNumeric(arguments.pincode))>
			<cfset arrayAppend(errors, "*pincode must be numeric")>
		<cfelseif len(arguments.pincode) GT 8>
			<cfset arrayAppend(errors, "*pincode length must be less than 9")>
		</cfif>


		<cfif len(trim(arguments.email)) EQ 0>
            		<cfset arrayAppend(errors, "*Email is required")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", arguments.email)>
            		<cfset arrayAppend(errors, "*Enter a valid email")>
        	</cfif>

		
		<cfif trim(arguments.phone) EQ "" OR not reFind("^\d{10}$", arguments.phone)>
    			<cfset arrayAppend(errors, "*Phone number must contain exactly 10 digits.")>
		</cfif>
		
		<cfreturn errors>

	</cffunction>

	<cffunction name="contactUser" returntype="void">

		<cfargument name="contactId" type="string" required="false" default="">
		<cfargument name="title" type="string" required="true">
		<cfargument name="firstName" type="string" required="true">
        	<cfargument name="lastName" type="string" required="true">
        	<cfargument name="gender" type="string" required="true">
        	<cfargument name="dob" type="date" required="true">
		<cfargument name="photo" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="street" type="string" required="true">
		<cfargument name="pincode" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="phone" type="string" required="true">

		


		<cfset local.uploadPath = ExpandPath('./Temp/')>
		<cffile action="upload" fileField="photo" destination="#local.uploadPath#" nameConflict="makeUnique" result="fileUploadResult">
		<!---<cfset local.photopath = local.uploadPath & fileUploadResult.serverFile>--->
		<cfset local.photopath = "./Temp/" & fileUploadResult.serverFile>
		

		<cfif StructKeyExists(arguments, "contactId") AND arguments.contactId NEQ "">
			<cfquery datasource="addressbook">
        			UPDATE contact
				SET 
					idcontact = <cfqueryparam value="#arguments.contactId#" cfsqltype="cf_sql_varchar">,
					titleid = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
					firstname = <cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
					lastname = <cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
					genderid = <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
					dob = <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_date">,
					photo = <cfqueryparam value="#local.photopath#" cfsqltype="cf_sql_varchar">,
					address = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
					street = <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
					pincode = <cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,
					email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
					phone = <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,
					iduser = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_varchar">
					
				WHERE
					 idcontact = <cfqueryparam value="#arguments.contactId#" cfsqltype="cf_sql_integer">
            				
        			
    			</cfquery>
		<cfelse>
			<cfquery datasource="addressbook">
        			INSERT INTO 
					contact (titleid, firstname, lastname, genderid, dob, photo, address, street, pincode, email, phone, iduser)
        			VALUES(
					
					<cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_date">,
					<cfqueryparam value="#local.photopath#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_varchar">
            				
        			)
    			</cfquery>
			
		</cfif>
		
	</cffunction>



	<cffunction name="getPages" access="public" returntype="query">
		<cfset var local= {}>
		<cfquery name="local.qryPages" datasource="addressbook">
			SELECT 
				c.idcontact,
				c.titleid,
				c.genderid,
				CONCAT(firstname," ", lastname) AS Fullname,
				c.firstname,
				c.lastname,
				CONCAT(t.titlename," ", c.firstname," ", c.lastname) AS titleFullname, 
				c.email, 
				c.phone,
				c.photo,
				c.dob,
				c.address,
				c.pincode,
				c.street,
				t.titlename,
				g.gendername
			FROM contact c
			LEFT JOIN
				title t ON c.titleid = t.idtitle
			LEFT JOIN
				gender g ON c.genderid = g.idgender
			WHERE 
				iduser = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
			</cfquery>
			
			<cfreturn local.qryPages>
		</cffunction>

		
		
    
    		<cffunction name="deleteContact" access="remote" returnformat = "JSON" output="false">
    			<cfargument name="contactId" type="string" required="true">
    
    			<cftry>
        			<cfquery datasource="addressbook">
            				DELETE FROM contact 
            				WHERE idcontact = <cfqueryparam value="#arguments.contactId#" cfsqltype="cf_sql_integer">
        			</cfquery>
        
        
        			<cfset response = {status="success", message="Contact deleted successfully."}>
        			<cfreturn response>
    				<cfcatch>
        
        				<cfset response = {status="error", message="An error occurred while deleting the contact."}>
        				<cfreturn response>
    				</cfcatch>
			</cftry>
		</cffunction>




    		


	
</cfcomponent>




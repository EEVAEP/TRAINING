<cfcomponent>
	
	<cffunction name="hashPassword" returntype="string">
    		<cfargument name="password" required="true" type="string">
    		<cfset local.hashedPassword = hash(arguments.password, "SHA-512")>
    		<cfreturn local.hashedPassword>
	</cffunction>

	<cffunction name="decryptId" access="public" returntype="string" output="false">
    		<cfargument name="encryptedId" type="string" required="true">
    		<cfset var decryptedId = decrypt(arguments.encryptedId, application.encryptionKey, "AES", "Hex")>
    		<cfreturn decryptedId>
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

		<cfquery name="qryCheckUser">
        		SELECT *
        		FROM 
				register
        		WHERE 
				username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
			AND	email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
    		</cfquery>

		<cfif qryCheckUser.recordCount EQ 0>
			<cfset local.hashedPassword = hashPassword(arguments.password)>

			<cfquery>
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
		
		<cfquery name="local.qryLogin">
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
        	<cfquery name="local.titleName">
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
		<cfquery name="local.genderTitle" >
			SELECT
				idgender,
				gendername
			FROM
				gender
				
		</cfquery>
		<cfreturn local.genderTitle>
	</cffunction>

	<cffunction name="getHobbyName" access="public" returntype="query">
		<cfquery name="local.insertHobby">
			SELECT
				idhobby,
				hobby_name
			FROM
				hobbies_sample
		</cfquery>
		<cfreturn local.insertHobby>
	
	</cffunction>

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	</cftry>

	<cffunction name="validateContact" access="remote" returntype="any" returnformat="JSON">
			
		
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
		<cfargument name="hobbies" type="string" required="true">
		<cfargument name="contactId" type="string" required="false">

		

		<cfset var local.errors = []>


		<cfset var validTitles = []>
    		<cfset titleQuery = getTitleName()>
    		<cfloop query="titleQuery">
        		<cfset arrayAppend(validTitles, titleQuery.idtitle)>
    		</cfloop>
		<cfif NOT arrayContains(validTitles, arguments.title)>
        		<cfset arrayAppend(local.errors, "*The title must be one of the following: " & arrayToList(validTitles, ", "))>
    		</cfif>
	
		
		<cfif trim(arguments.firstName) EQ "">
        		<cfset arrayAppend(local.errors, "*First Name is required.")>
    		<cfelseif not reFind("^[A-Za-z]+$", trim(arguments.firstName))>
        		<cfset arrayAppend(local.errors, "*First Name cannot contain numbers or special characters.")>
    		</cfif>


		<cfif trim(arguments.lastName) EQ "">
    			<cfset arrayAppend(local.errors, "*Last Name is required.")>
		<cfelseif not reFind("^[A-Za-z]+(\s[A-Za-z]+)*$", trim(arguments.lastName))>
    			<cfset arrayAppend(local.errors, "*Last Name cannot contain numbers or special characters.")>
		</cfif>



		<cfset var validGender = []>
		<cfset genderQuery= getGenderName()>
		<cfloop query="genderQuery">
			<cfset arrayAppend(validGender, genderQuery.idgender)>
		</cfloop>
		<cfif NOT arrayContains(validGender, arguments.gender)>
			<cfset arrayAppend(local.errors, "*Enter a valid gender")>
		</cfif>	
		


		<cfif not isDate(arguments.dob)>
        		<cfset arrayAppend(local.errors, "*Date of Birth must be a valid date.")>
    		</cfif>


		<cfset local.uploadPath = ExpandPath('../uploads/')>
		<cfif structKeyExists(form, "photo") AND form.photo NEQ "">
			<cffile action="upload" fileField="photo" destination="#local.uploadPath#" nameConflict="makeUnique" result="fileUploadResult">
			<cfset var originalFileName = fileUploadResult.serverFile>
		

			<cfset var allowedFormats = "jpg,jpeg,png,jfif">
    			<cfset var imageExtension = ListLast(originalFileName, ".")> 
		
			<cfif NOT ListFindNoCase(allowedFormats, imageExtension)>
        			<cfset arrayAppend(local.errors, "*Invalid image format. Only JPG, JPEG, JFIF and PNG are allowed")>
    			</cfif>
		<cfelse>
    			<cfset arrayAppend(local.errors, "*Image is required. Please upload a valid image file.")>
		</cfif>


		
		<cfif trim(arguments.address) EQ "">
			<cfset arrayAppend(local.errors, "*Address is required.")>
		</cfif>

		
		<cfif trim(arguments.street) EQ "">
			<cfset arrayAppend(local.errors, "*Street is required.")>
		</cfif>

		<cfif trim(arguments.pincode) EQ "" OR (NOT isNumeric(arguments.pincode))>
			<cfset arrayAppend(local.errors, "*pincode must be numeric")>
		<cfelseif len(arguments.pincode) GT 8>
			<cfset arrayAppend(local.errors, "*pincode length must be less than 9")>
		</cfif>


		<cfif len(trim(arguments.email)) EQ 0>
            		<cfset arrayAppend(local.errors, "*Email is required")>
        	<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", arguments.email)>
            		<cfset arrayAppend(local.errors, "*Enter a valid email")>
        	</cfif>

		
		<cfif trim(arguments.phone) EQ "" OR not reFind("^\d{10}$", arguments.phone)>
    			<cfset arrayAppend(local.errors, "*Phone number must contain exactly 10 digits.")>
		</cfif>

		

		<cfset var validHobbies = []>
		<cfset hobbyQuery = getHobbyName()>
		<cfloop query="hobbyquery">
			<cfset ArrayAppend(validHobbies, hobbyQuery.idhobby)>
		</cfloop>
		<cfset var selectedHobbiesArray = ListToArray(arguments.hobbies, ",")>
		<cfloop array="#selectedHobbiesArray#" index="hobbyID">
        		<cfif NOT arrayContains(validHobbies, hobbyID)>
            			<cfset arrayAppend(local.errors, "*Invalid hobby selected: " & hobbyID)>
        		</cfif>
    		</cfloop>

		
		
		<cfif arrayLen(local.errors) EQ 0>
			<cfif NOT structKeyExists(arguments, 'contactId')>
				<cfset local.addUser=contactUser(arguments.title,
						arguments.firstName,
						arguments.lastName,
						arguments.gender,
						arguments.dob,
						arguments.photo,
						arguments.address,
						arguments.street,
						arguments.pincode,
						arguments.email,
						arguments.phone,
						arguments.hobbies)>
				
			<cfelse>
				<cfset local.editUser=contactUser(arguments.title,
						arguments.firstName,
						arguments.lastName,
						arguments.gender,
						arguments.dob,
						arguments.photo,
						arguments.address,
						arguments.street,
						arguments.pincode,
						arguments.email,
						arguments.phone,
						arguments.hobbies,
						arguments.contactId)>
			</cfif>
			<cfreturn local.errors>
		<cfelse>
			<cfreturn local.errors>
		
		</cfif>
		

	</cffunction>

	<cffunction name="contactUser" access="public">
		
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
		<cfargument name="hobbies" type="string" required="false">
		<cfargument name="contactId" type="string" required="false" default="">
		

		


		<cfset local.uploadPath = ExpandPath('../Temp/')>
		<cffile action="upload" fileField="photo" destination="#local.uploadPath#" nameConflict="makeUnique" result="fileUploadResult">
		<cfset local.photopath = "./Temp/" & fileUploadResult.serverFile>
		

		<cfif StructKeyExists(arguments, "contactId") AND arguments.contactId NEQ "">
			<cfset var decryptedId = decryptId(arguments.contactId)>
			<cfquery>
        			UPDATE contact
				SET 
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
					 idcontact = <cfqueryparam value="#decryptedId#" cfsqltype="cf_sql_integer">
            				
        		</cfquery>

			<cfquery>
        			DELETE FROM user_hobbies
       				WHERE contact_id = <cfqueryparam value="#decryptedId#" cfsqltype="cf_sql_integer">
    			</cfquery>

			<cfset var selectedHobbiesArray = ListToArray(arguments.hobbies, ",")>
			<cfloop array="#selectedHobbiesArray#" index="hobbyID">
    				<cfquery name="insertUserHobby">
        				INSERT INTO user_hobbies (contact_id, hobby_id)
        				VALUES (
            					<cfqueryparam value="#decryptedId#" cfsqltype="cf_sql_integer">,
            					<cfqueryparam value="#hobbyID#" cfsqltype="cf_sql_integer">
        				)
    				</cfquery>
			</cfloop>



		<cfelse>
			<cfquery name="insertContact" result="r">
        			INSERT INTO 
					contact (titleid, 
						firstname, 
						lastname, 
						genderid, 
						dob, 
						photo, 
						address, 
						street, 
						pincode, 
						email, 
						phone, 
						iduser)
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
			
			
			<cfset var selectedHobbiesArray = ListToArray(arguments.hobbies, ",")>
			<cfloop array="#selectedHobbiesArray#" index="hobbyID">
    				<cfquery name="insertUserHobby">
        				INSERT INTO user_hobbies (contact_id, hobby_id)
        				VALUES (
            					<cfqueryparam value="#r.generatedkey#" cfsqltype="cf_sql_integer">,
            					<cfqueryparam value="#hobbyID#" cfsqltype="cf_sql_integer">
        				)
    				</cfquery>
			</cfloop>
			
		</cfif>
		
		
	</cffunction>



	<cffunction name="getPages" access="public" returntype="query">
		<cfset var local= {}>
		<cfquery name="local.qryPages">
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
				g.gendername,
				GROUP_CONCAT(h.idhobby) AS hobby_ids,
				GROUP_CONCAT(h.hobby_name) AS hobby_names
			FROM contact c
			LEFT JOIN
				title t ON c.titleid = t.idtitle
			LEFT JOIN
				gender g ON c.genderid = g.idgender
			LEFT JOIN 
        			user_hobbies uh ON c.idcontact = uh.contact_id
			LEFT JOIN 
        			hobbies_sample h ON uh.hobby_id = h.idhobby
			WHERE 
				iduser = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
			GROUP BY c.idcontact
		</cfquery>
			
		<cfreturn local.qryPages>
	</cffunction>

		
		
    
    	<cffunction name="deleteContact" access="remote" returnformat = "JSON" output="false">
    		<cfargument name="contactId" type="string" required="true">
		<cfset var decryptedId = decryptId(arguments.contactId)>
    
    		<cftry>
			<cfquery name="deleteUserHobbies">
            			DELETE FROM user_hobbies 
            			WHERE contact_id = <cfqueryparam value="#decryptedId#" cfsqltype="cf_sql_integer">
        		</cfquery>
        		<cfquery>
            			DELETE FROM contact 
            			WHERE idcontact = <cfqueryparam value="#decryptedId#" cfsqltype="cf_sql_integer">
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



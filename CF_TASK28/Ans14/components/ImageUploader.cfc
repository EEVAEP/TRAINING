
<cfcomponent output="false">

	<cffunction name="uploadImage" access="public" returnType="void" output="false">
        	<cfargument name="formData" type="struct" required="true">
        	<cfset var local = {}>

        	<cfset local.uploadPath = expandPath('uploads/')>
        	<cfset local.thumbnailPath = expandPath('thumbnails/')>
        	<cfset local.descriptionPath = expandPath('description/')>
        	<cfset local.allowedExtensions = "jpg,jpeg,png,gif">
        	<cfset local.maxFileSize = 1 * 1024 * 1024> 

        	<cfif structKeyExists(arguments.formData, "imageFile")>
            		<cffile action="upload"
                		fileField="imageFile"
                		destination="#local.uploadPath#"
                		nameConflict="makeUnique"
                		accept="image/jpeg,image/png,image/gif">

            		<cfset local.uploadedFile = cffile.serverFile>

            		<cfif cffile.fileSize GT local.maxFileSize>
                		<cfthrow type="FileTooLarge" message="The uploaded file is too large. Maximum file size is 1MB.">
            		<cfelse>
                		<cftry>
                    			<cfset local.descriptionFile = local.descriptionPath & listFirst(local.uploadedFile, ".") & ".txt">
                    			<cffile action="write" file="#local.descriptionFile#" output="#arguments.formData.description#">

                    			<cfset local.thumbnailFile = local.thumbnailPath & local.uploadedFile>
                    			<cfset local.image = imageNew("#local.uploadPath##local.uploadedFile#")>
                    			<cfset imageResize(local.image, 20, 20)>
                    			<cfset imageWrite(local.image, local.thumbnailFile)>

                    			<cfset session.imageName = arguments.formData.imageName>
                    			<cfcatch>
                        			<cfdump var="#cfcatch#">
                    			</cfcatch>
                		</cftry>
            		</cfif>
        	<cfelse>
            		<cfthrow type="NoFileUploaded" message="No file uploaded. Please select a file.">
        	</cfif>
    	</cffunction>

	    
    	<cffunction name="listImages" access="public" returnType="query">
        	<cfset var local = {}>

        	<cfset local.thumbnailPath = expandPath('thumbnails/')>
        	<cfdirectory action="list" directory="#local.thumbnailPath#" name="imageList">
        
        	<cfreturn imageList>
    	</cffunction>


	<cffunction name="getImageDetails" access="public" returnType="struct">
    		<cfargument name="imageName" type="string" required="true">
    		<cfset var local = {}>

    		<cfset local.descriptionPath = expandPath('description/')>
    		<cfset local.fullImagePath = expandPath('uploads/') & arguments.imageName>
    		<cfset local.thumbnailImagePath = expandPath('thumbnails/') & arguments.imageName>
    		<cfset local.descriptionFile = local.descriptionPath & listFirst(arguments.imageName, ".") & ".txt">

    		<cfif fileExists(local.fullImagePath)>
        		<cfset local.details = {
            			"fullImagePath": local.fullImagePath,
            			"thumbnailImagePath": local.thumbnailImagePath,
            			"imageName": arguments.imageName,
            			"description": ""
        		}>
        		<cfif fileExists(local.descriptionFile)>
            			<cfset local.details.description = fileRead(local.descriptionFile)>
        		<cfelse>
            			<cfset local.details.description = "No description available.">
        		</cfif>
    		<cfelse>
        		<cfset local.details = {
            			"error": "Image not found."
        		}>
    		</cfif>
    		<cfreturn local.details>
	</cffunction>




</cfcomponent>

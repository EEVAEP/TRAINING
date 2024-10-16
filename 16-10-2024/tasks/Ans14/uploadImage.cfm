
<cftry>
    	<cfset application.imageUploader.uploadImage(form)>
    	<cfoutput>Image uploaded successfully!</cfoutput>
    	<cflocation url="listImages.cfm" addtoken="false">
<cfcatch>
    <cfoutput>#cfcatch.message#</cfoutput>
    <br><br><a href="./uploadForm.cfm">Go back to Upload images page</a>
</cfcatch>
</cftry>


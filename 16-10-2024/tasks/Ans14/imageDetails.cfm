

<cfset imageDetails = application.imageUploader.getImageDetails(url.imageName)>

<cfif structKeyExists(imageDetails, "error")>
	<cfoutput>#imageDetails.error#</cfoutput>
<cfelse>
    	<h2>Image Details</h2>
	
    	<p><strong>Original Image:</strong></p>
	
	
    	<cfoutput><img src="uploads/#urlEncodedFormat(url.imageName)#" alt="Full image of #url.imageName#"></cfoutput>

    	<cfoutput><p><strong>Image Name (User Entered):</strong> #session.imageName#</p></cfoutput>
    	<p><strong>Thumbnail:</strong></p>
    	<cfoutput><img src="thumbnails/#urlEncodedFormat(url.imageName)#" alt="Thumbnail of #url.imageName#" width="20" height="20"></cfoutput>
    	<cfoutput><p><strong>Image Name (original):</strong> #imageDetails.imageName#</p></cfoutput>
    	<p><strong>Description:</strong></p>
    	<cfoutput>#imageDetails.description#</cfoutput>
</cfif>

<br><br><a href="./listImages.cfm">Go back to List images page</a>




<cfset imageList = application.imageUploader.listImages()>

<cfif imageList.recordCount GT 0>
	<table border="1">
        	<tr>
            		<th>Thumbnail</th>
            		<th>Image Name</th>
        	</tr>
        	<cfloop query="imageList">
            		<cfset imageName = listLast(imageList.name, "\")>
            		<tr>
                		<cfoutput>
                    			<td>
                        			<img src="thumbnails/#imageName#" alt="Thumbnail of #imageName#" width="20" height="20">
                    			</td>
                    			<td>
                        			<a href="imageDetails.cfm?imageName=#urlEncodedFormat(imageName)#">#imageName#</a>
                    			</td>
                		</cfoutput>
            		</tr>
        	</cfloop>
    	</table>
<cfelse>
    	<cfoutput>No images found.</cfoutput>
</cfif>

<br><br><a href="./uploadForm.cfm">Go back to Upload images page</a>


<cfif structKeyExists(form, "upload")>
    
    <!-- Create an instance of the tagCloud component -->
    <cfset local.tagCloud = createObject("component", "tagCloud").init()>

    <cfif structKeyExists(form, "fileUpload") AND fileUpload.fileSize GT 0>
       
        <!-- Define the upload directory -->
        <cfset local.filePath = expandPath('./uploads/')>

        <!-- Upload the file -->
        <cffile action="upload" fileField="fileUpload" destination="#local.filePath#" accept="text/plain" nameConflict="overwrite">

        <!-- Check if the file upload was successful -->
        <cfif fileUpload.fileSize GT 0>
            <!-- Read the uploaded text file -->
            <cfset local.fileContent = fileRead(local.filePath & fileUpload.serverFile)>

            <!-- Call the insertWords method to process the file content -->
            <cfset local.tagCloud.insertWords(local.fileContent)>

            <cfoutput>Words have been successfully uploaded and saved!</cfoutput>
        <cfelse>
            <cfoutput>Error: The file is empty or was not uploaded successfully.</cfoutput>
        </cfif>

    <cfelse>
        <cfoutput>Error: No file uploaded or the file is empty.</cfoutput>
    </cfif>
    
</cfif>

<html>
<head>
    <title>Upload Text File</title>
</head>
<body>
    <h2>Upload a Text File</h2>
    <form action="#CGI.SCRIPT_NAME#" method="post" enctype="multipart/form-data">
        <input type="file" name="fileUpload" required />
        <input type="submit" name="upload" value="Upload" />
    </form>
    <a href="tagCloud.cfm">View Tag Cloud</a>
    <a href="wordCount.cfm">View Word Counts</a>
</body>
</html>

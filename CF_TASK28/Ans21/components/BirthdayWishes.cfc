<cfcomponent>
	<cffunction name="uploadFile" access="public" returntype="string">
        	<cfargument name="fileField" type="string" required="true">
        	<cfargument name="uploadPath" type="string" required="true">

        
        	<cfset var local = {}>

        
        	<cffile action="upload" filefield="#arguments.fileField#" destination="#arguments.uploadPath#" nameConflict="makeunique">

        
        	<cfset local.uploadedFilePath = arguments.uploadPath & cffile.serverFile>

        
        	<cfreturn local.uploadedFilePath>
    	</cffunction>


	<cffunction name="sendEmail" access="public" returntype="void">
        	<cfargument name="emailId" type="string" required="true">
        	<cfargument name="babyName" type="string" required="true">
        	<cfargument name="birthdayWishes" type="string" required="true">
        	<cfargument name="uploadedFilePath" type="string" required="false">

        
        	<cfset var local = {}>

                <cfmail to="#arguments.emailId#" from="eevaparayil7@gmail.com" subject="HAPPY BIRTHDAY, #arguments.babyName#" type="html">
            		<h2>Happy Birthday, #arguments.babyName#!</h2>
            		<p>#arguments.birthdayWishes#</p>

            
            		<cfif structKeyExists(arguments, "uploadedFilePath") AND arguments.uploadedFilePath neq "">
                		<cfmailparam file="#arguments.uploadedFilePath#" contentID="greetingImage" disposition="attachment">
            		</cfif>
        	</cfmail>
    	</cffunction>
</cfcomponent>
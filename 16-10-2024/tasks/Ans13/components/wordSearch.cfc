<cfcomponent >

	<cffunction name="convertToList" access="public" returntype="string">
        	<cfargument name="content" type="string" required="true">

                <cfset var local = {}> 
	        <cfset local.listCount = replace(arguments.content, " ", ",", "all")>
        	<cfreturn local.listCount>
    	</cffunction>

    
    	<cffunction name="countKeyword" access="public" returntype="numeric">
        	<cfargument name="listContent" type="string" required="true">
        	<cfargument name="keyword" type="string" required="true">

        
        	<cfset var local = {}> 
        	<cfset local.keywordCount = ListValueCountNoCase(arguments.listContent, arguments.keyword, ",")>
        	<cfreturn local.keywordCount>
    	</cffunction>

</cfcomponent>

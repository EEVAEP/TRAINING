<cfcomponent displayname="tagCloud" output="false">
	<cffunction name="init" access="public" returntype="tagCloud" output="false">
        	<cfreturn this>
    	</cffunction>

    
    	<cffunction name="processWords" access="public" returntype="struct" output="false">
        	<cfargument name="text" type="string" required="true">
        	<cfset local.wordList = listToArray(reReplace(arguments.text, "[^a-zA-Z\s]", "", "ALL"), " ")>
        	<cfset local.wordStruct = {}>

        	<cfloop array="#local.wordList#" index="local.word">
            		<cfif len(local.word) GTE 3 AND NOT isNumeric(local.word)>
                		<cfset local.word = lcase(local.word)>
                		<cfif not structKeyExists(local.wordStruct, local.word)>
                    			<cfset local.wordStruct[local.word] = 1>
                		<cfelse>
                    			<cfset local.wordStruct[local.word]= local.wordStruct[local.word] + 1>
                		</cfif>
            		</cfif>
        	</cfloop>

        	<cfreturn local.wordStruct>
    	</cffunction>


	<cffunction name="getTagCloudData" access="public" returntype="query" output="false">
        	<cfset var local = {}>

        	<cfquery name="local.getWords" datasource="ans25">
            		SELECT 
				word,
				COUNT(word) as wordCount
            		FROM 
				ans25.tags
            		WHERE 
				char_length(word) >= 3
            		GROUP BY 
				word
            		ORDER BY 
				wordCount DESC, char_length(word) DESC, word ASC
        	</cfquery>

        	<cfreturn local.getWords>
    	</cffunction>
</cfcomponent>

<cfcomponent>
	<cffunction name="init" access="public" returntype="any">
        	<cfreturn this>
    	</cffunction>

   
    	<cffunction name="processText" access="public" returntype="struct" output="false">
        	<cfargument name="inputText" type="string" required="true">
        
        
        	<cfset local.wordStruct = structNew()>

        
        	<cfset local.words = listToArray(arguments.inputText, " ,.?!")>

       
        	<cfloop array="#local.words#" index="local.word">
           
            		<cfset local.word = trim(local.word)>

            
            		<cfif len(local.word) GTE 3 AND NOT isNumeric(local.word)>
               
                		<cfset local.word = lcase(local.word)>

                
                		<cfif structKeyExists(local.wordStruct, local.word)>
                    			<cfset local.wordStruct[local.word] = local.wordStruct[local.word] + 1>
                		<cfelse>
                    			<cfset local.wordStruct[local.word] = 1>
                		</cfif>
            		</cfif>
        	</cfloop>

       
        	<cfreturn local.wordStruct>
    	</cffunction>

	<cffunction name="getTagCloud" access="public" returntype="query" output="false">
        	<cfset var local = {}> 

       
        	<cfquery name="local.getWords" datasource="ans25">
            		SELECT 
				word,
				COUNT(word) AS wordCount
            		FROM 
				tags
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

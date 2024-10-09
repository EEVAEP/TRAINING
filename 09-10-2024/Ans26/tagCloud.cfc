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
</cfcomponent>

<cfcomponent>

    <!-- Constructor Method -->
    <cffunction name="init" returntype="any">
        <!-- Initialize the component -->
        <cfreturn this>
    </cffunction>
    
    <!-- Method to insert words into the database -->
    <cffunction name="insertWords" access="remote" returntype="void">
        <cfargument name="textContent" type="string" required="true">
        
        <!-- Initialize local scope -->
        <cfset var local = {}>

        <!-- Convert the text into a list of words, splitting by space -->
        <cfset local.words = ListToArray(arguments.textContent, " ", true)>

        <!-- Loop through each word -->
        <cfloop array="#local.words#" index="local.word">
            <!-- Clean the word by removing any special characters or numbers -->
            <cfset local.word = reReplace(local.word, "[^a-zA-Z]", "", "ALL")>

            <!-- Check if the word length is greater than or equal to 3 and is not a number -->
            <cfif len(trim(local.word)) >= 3 AND NOT isNumeric(local.word)>
                <!-- Try to insert the word into the database, ignoring duplicates -->
                <cftry>
                    <cfquery datasource="ans25">
                        INSERT INTO tags (word) 
                        VALUES (<cfqueryparam value="#trim(local.word)#" cfsqltype="cf_sql_varchar">)
                    </cfquery>
                <cfcatch type="any">
                    <!-- Ignore the error if the word is already in the table -->
                </cfcatch>
                </cftry>
            </cfif>
        </cfloop>
    </cffunction>
    
    <!-- Method to retrieve word counts from the database -->
    <cffunction name="getWordCounts" access="remote" returntype="query">
        <!-- Initialize local scope -->
        <cfset var local = {}>

        <!-- Retrieve words and their counts from the database -->
        <cfquery name="local.result" datasource="ans25">
            SELECT word, COUNT(word) AS wordCount
            FROM tags
            WHERE char_length(word) >= 3 
            GROUP BY word
            ORDER BY wordCount DESC, char_length(word) DESC, word ASC
        </cfquery>

        <!-- Return the result query -->
        <cfreturn local.result>
    </cffunction>

</cfcomponent>

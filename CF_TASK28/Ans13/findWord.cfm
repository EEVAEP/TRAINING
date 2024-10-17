<h2>Output...</h2>
<cfif structKeyExists(form, "keyword")>
	<cfset local.wordSearchObj = createObject("component", "components.WordSearch")>
    
    	<cfset local.content = "the quick brown fox jumps over the lazy dog">

    
    	<cfset local.listContent = local.wordSearchObj.convertToList(local.content)>

        <cfset local.keyword = form.keyword>

    
    	<cfset local.keywordCount = local.wordSearchObj.countKeyword(local.listContent, local.keyword)>

    
    	<cfoutput>
        	<cfif local.keywordCount gt 0>
            		Found the keyword <br>"<strong>#local.keyword#</strong>" #local.keywordCount# time(s) in... #local.content#
        	<cfelse>
            		Keyword "<strong>#local.keyword#</strong>" not found in the content.
        	</cfif>
    	</cfoutput>
</cfif>

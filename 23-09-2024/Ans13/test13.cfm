<cfparam name="form.keyword" default="0">
<cfset content = "the quick brown fox jumps over the lazy dog">


<h1>CF TAsk 13</h1>


<cfif len(trim(form.keyword)) GT 0>
    
    <cfset keyword = trim(form.keyword)>
    <cfset pattern = "(?i)\b#REReplaceNoCase(keyword, "[\W]", "\\\\b")#\b">
    <cfset count = reFindNoCase(pattern, content, 1, "all")>

  
    <cfset highlightedContent = reReplaceNoCase(content, pattern, "<span style='background-color:yellow;'>#keyword#</span>", "all")>

   
    <cfoutput>
        <p>Found the keyword '<strong>#keyword#</strong>' #ArrayLen(count)# time(s) - #highlightedContent#</p>
    </cfoutput>
<cfelse>
    <!--- No keyword provided --->
    <cfoutput>
        <p>Please enter a keyword to search.</p>
    </cfoutput>
</cfif>

<cfset local.tagCloud = createObject("component", "tagCloud").init()>
<cfset local.getWords = local.tagCloud.getWordCounts()>

<html>
<head>
    <title>Tag Cloud</title>
    <style>
        .tag {
            display: inline-block;
            margin: 5px;
        }
    </style>
</head>
<body>
    <h2>Tag Cloud</h2>

    <!--- Loop through the word structure to generate the tag cloud --->
    <cfoutput query="local.getWords">
        <span class="tag" 
              style="font-size: #10 + wordCount * 5#px; color: ##randRange(100000, 999999)#;">
            #word# (#wordCount#)
        </span><br>
    </cfoutput>
    
    <a href="index.cfm">Upload More Words</a>
    <a href="wordCount.cfm">View Word Counts</a>
</body>
</html>

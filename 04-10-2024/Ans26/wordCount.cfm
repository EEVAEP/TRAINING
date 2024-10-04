<cfset local.tagCloud = createObject("component", "tagCloud").init()>
<cfset local.getWords = local.tagCloud.getWordCounts()>

<html>
<head>
    <title>Word Count Report</title>
</head>
<body>
    <h2>Word Count Report</h2>
    
    <cfoutput query="local.getWords">
        <p>#word# (#wordCount# times)</p>
    </cfoutput>
    
    <a href="index.cfm">Upload More Words</a>
    <a href="tagCloud.cfm">View Tag Cloud</a>
</body>
</html>

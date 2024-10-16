<!DOCTYPE html>
<html>
	<head>
    		<title>Tag Cloud</title>
    
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		
		<h1>tagCloud</h1>
    		<cfset tagCloudObj = createObject("component", "components.tagCloud").init()>
        	<cfset tagData = tagCloudObj.getTagCloudData()>
		
		<cftry>
			<cfoutput query="tagData">
    
    				<cfset red = formatBaseN(randRange(0, 255), 16)>
    				<cfset green = formatBaseN(randRange(0, 255), 16)>
    				<cfset blue = formatBaseN(randRange(0, 255), 16)>

    
    				<cfset red = right("0" & red, 2)>
    				<cfset green = right("0" & green, 2)>
    				<cfset blue = right("0" & blue, 2)>

       				<cfset hexColor = "##" & red & green & blue>

   
    				<span class="tag" style="font-size:#10 + wordCount * 10#px; color:#hexColor#;">
        				#word# (#wordCount#)
    				</span><br>
			</cfoutput>


			<cfcatch>
				<cfdump var="#cfcatch#">
			</cfcatch>
		</cftry>
		

	</body>
</html>

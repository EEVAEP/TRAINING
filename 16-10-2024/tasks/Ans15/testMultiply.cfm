<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<title>Test Multiplication Component</title>
	</head>
	<body>
    		<h2>CF Task 15</h2>

    
    		<h3>Using &lt;cfinvoke&gt; tag:</h3>
    		<cfinvoke component="components.Multiplication" method="multiply" returnvariable="result1">
        		<cfinvokeargument name="a" value="1">
        		<cfinvokeargument name="b" value="2">
    		</cfinvoke>
    		<cfoutput>multiply(1, 2) = #result1#</cfoutput><br>

    		<cfinvoke component="components.Multiplication" method="multiply" returnvariable="result2">
        		<cfinvokeargument name="a" value="1">
        		<cfinvokeargument name="b" value="2">
        		<cfinvokeargument name="c" value="3">
    		</cfinvoke>
    		<cfoutput>multiply(1, 2, 3) = #result2#</cfoutput><br>

    		<cfinvoke component="components.Multiplication" method="multiply" returnvariable="result3">
        		<cfinvokeargument name="a" value="1">
        		<cfinvokeargument name="b" value="2">
        		<cfinvokeargument name="c" value="3">
        		<cfinvokeargument name="d" value="4">
    		</cfinvoke>
    		<cfoutput>multiply(1, 2, 3, 4) = #result3#</cfoutput><br>


  
    		<h3>Using &lt;cfobject&gt; tag:</h3>
    		<cfobject component="components.Multiplication" name="multObj">
    		<cfset result4 = multObj.multiply(1, 2)>
    		<cfoutput>multiply(1, 2) = #result4#</cfoutput><br>

    		<cfset result5 = multObj.multiply(1, 2, 3)>
    		<cfoutput>multiply(1, 2, 3) = #result5#</cfoutput><br>
    
    		<cfset result6 = multObj.multiply(1, 2, 3, 4)>
    		<cfoutput>multiply(1, 2, 3, 4) = #result6#</cfoutput><br>

    


    		<h3>Using createObject() function:</h3>
    		<cfset multObjCreate = createObject("component", "components.Multiplication")>
    		<cfset result7 = multObjCreate.multiply(1, 2)>
    		<cfoutput>multiply(1, 2) = #result7#</cfoutput><br>
    
    		<cfset result8 = multObjCreate.multiply(1, 2, 3)>
    		<cfoutput>multiply(1, 2, 3) = #result8#</cfoutput><br>
    
    		<cfset result9 = multObjCreate.multiply(1, 2, 3, 4)>
    		<cfoutput>multiply(1, 2, 3, 4) = #result9#</cfoutput><br>


		
	</body>
</html>

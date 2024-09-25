<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Number Input with ColdFusion</title>
    
    		<script src="script.js"></script>

    		<style>
        		.blue { color: blue; }
        		.green { color: green; }
    		</style>
	</head>
	<body>

    		<h2>CF TASK 17</h2>
    
    		<form id="numberForm" method="post" onsubmit="return validateInput()">
        		<label for="numberInput">Enter a number:</label>
        		<input type="text" id="numberInput" name="numberInput" />
        		<button type="submit">Submit</button>
    		</form>

    
    		<div id="resultContainer">
        		<cfoutput>
                        	<cfif structKeyExists(form, "numberInput") and isNumeric(trim(form.numberInput))>
                			<cfset userInput = trim(form.numberInput)>
                
                
                			<cfloop from="1" to="#userInput#" index="i">
                    
                    				<cfif i MOD 2 EQ 0>
                        				<span class="green">#i# </span>
                    				<cfelse>
                        				<span class="blue">#i# </span>
                    				</cfif>
                			</cfloop>
            			<cfelse>
                                	<cfif structKeyExists(form, "numberInput")>
                    				<p style="color: red;">Invalid input. Please enter a numeric value.</p>
                			</cfif>
            			</cfif>
        		</cfoutput>
    		</div>

	</body>
</html>

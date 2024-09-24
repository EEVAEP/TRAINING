<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Coldfusion plus JS</title>

		<style>
       
        		.odd {
            			color: blue;
            			font-weight: bold;
        		}
        		.even {
            			color: green;
            			font-weight: bold;
        		}
    		</style>
	</head>
	<body>
    		<h2>CF TASK 16</h2>
    		<form onsubmit="return validateInput()">
       			<label for="rating">Enter a number:</label>
        		<input type="text" id="numberInput" name="number" placeholder="Enter a number" required>
        		<input type="submit" value="submit">
    		</form>

		<div id="result">
        
        		<cfoutput>
       
        			<cfif isNumeric(form.number)>
            
            				<cfset inputNumber = form.number>
            				<cfloop from="1" to="#inputNumber#" index="i">
                
             					<cfif i mod 2 neq 0>
                    					<span class="odd">#i#</span>
                				<cfelse>
                    					<span class="even">#i#</span>
                				</cfif>
            				</cfloop>
        			<cfelse>
           
            				<p>Please enter a valid numeric value.</p>
        			</cfif>
        		</cfoutput>
    		</div>
	</body>
</html>



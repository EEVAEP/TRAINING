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

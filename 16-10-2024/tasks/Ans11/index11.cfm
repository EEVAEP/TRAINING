<cfset mathObj = createObject("component", "components.MathFunctions")>

<h1>Multiply...Output</h1>

<cfset res = mathObj.multiply([1, 2])>
<cfdump var="#res#" label="Result of multiply(1, 2)"><br>

<cfset res = mathObj.multiply([1, 2, 3])>
<cfdump var="#res#" label="Result of multiply(1, 2, 3)"><br>

<cfset res = mathObj.multiply([1, 2, 3, 4])>
<cfdump var="#res#" label="Result of multiply(1, 2, 3, 4)">


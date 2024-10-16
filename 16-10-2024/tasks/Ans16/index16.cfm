<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>3x3 format</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>

		<h2 style="color:blue;">CF Task 16</h2>
		<table>
			<cfloop index="i" from="1" to="3">
				<tr>
					<cfloop index="j" from="0" to="2">
						<cfset value=i + (j*3)>
						<td><cfoutput>#value#</cfoutput></td>
					</cfloop>

				</tr>
			</cfloop>

		</table>
	</body>
</html>
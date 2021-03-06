<%@ page contentType = "text/html;charset=utf-8" %>
<%	
%>
<html>
	<head>
	<meta name="generator" content="HTML Tidy, see www.w3.org">
	<link rel="stylesheet" type="text/css" href="oreillyajax.css">
	<title>AJAX Customer Signup</title>
	<script language="JavaScript" src="dojo.js"></script>
	<script language="JavaScript" type="text/javascript"> 
		
		function retrieveCityState() {
		   zip = document.getElementById("zipcode");
			dojo.io.bind({
				url: "/study/Chapter6_zipcodes?zip=" + escape(zip.value),
				load: function(type, data, evt){ displayCityAndState(data); },
				error: function(type, data, evt){ reportError(type,data,evt); },
				mimetype: "text/plain"
			});
		}
		function displayCityAndState(data){
			var jsonData = data;
			var myJSONObject = eval('(' + jsonData + ')');
			if(myJSONObject.location.city== null)
			{
				alert('no entry in database for zip code: '+myJSONObject.location.zip);
				var city = document.getElementById('city').value="";
				var city = document.getElementById('state').value="";
			}
			else
			{
				var city = document.getElementById('city').value=myJSONObject.location.city;
				var city = document.getElementById('state').value=myJSONObject.location.state;
			}
		}
		function reportError(type,data,evt) {
		  alert('error retrieving a city and state for that zip code.');
		}
		</script>
	</head>
	<body>
	<h1>AJAX Zipcode Lookup with Dojo</h1>
	<table align="left" class="borderless">
	<tr>
		<td colspan="3">
			<table align="left" class="borderless">
			<tr>
				<td class="headtext">
					<h2>Fill in your zipcode, state and city..</h2>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			Zip Code:
		</td>
		<td align="left">
			<input type="text" id="zipcode" name="zipcode" onblur="retrieveCityState()">
		</td>
	</tr>
	<tr>
		<td>
			City:
		</td>
		<td align="left">
			<input type="text" id="city" name="city">
		</td>
	</tr>
	<tr>
		<td>
			State:
		</td>
		<td align="left">
			<input type="text" id="state" name="state">
		</td>
	</tr>
	</table>
	</body>
</html>
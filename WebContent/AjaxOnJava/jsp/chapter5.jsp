<%@ page contentType = "text/html;charset=utf-8" %>

<!DOCTYPE html>
<head>

<LINK REL="stylesheet" TYPE="text/css" HREF="../css/Chapter5.css">

<title>AJAX Customer Signup</title>
<script language="JavaScript" src="../js/Chapter5.js">
</script>
 
</head>
<body>
<h1>AJAX CUSTOMER SIGN-UP </h1>

<form name="form1" action="signup" method="get">
<table align="left" class="borderless">
    <tr>
        <td colspan="2">
        <table class="borderless">
            <tr>
                <td class="headtext">
                <h2>Choose a username and password...</h2>
                </td>
            </tr>
        </table>
        </td>
    </tr>

    <tr>
        <td>Username:</td>
        <td align="left"><input type="text" id="ajax_username" name="ajax_username"
            autocomplete="off" onblur="validateUsername();">
        </td>
    </tr>
<!---->
    <tr>
        <td>Password:</td>
        <td align="left"><input type="password" id="password" name="password" ></td>
    </tr>

    <tr>
        <td>Confirm Password:</td>
        <td align="left"><input type="password" id="confirmpassword"
            name="confirmpassword" ></td>
    </tr>
<!---->
    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td colspan="2">
        <table align="left" class="borderless">
            <tr>
                <td class="headtext">
                <h2>Fill in your contact information...</h2>
                </td>
            </tr>
        </table>
        </td>
    </tr>

    <tr>
        <td>Email:</td>
        <td align="left"><input type="text" id="email" name="email" ></td>
    </tr>

    <tr>
        <td>Name:</td>
        <td align="left"><input type="text" id="customername" name="customername" ></td>
    </tr>

    <tr>
        <td>Address:</td>
        <td align="left"><input type="text" id="address" name="address"></td>
    </tr>
    <tr>
        <td>Zip Code:</td>
        <td align="left">
        <input type="text" id="zipcode" name="zipcode" onblur="retrieveCityState()" >
        </td>
    </tr>
    <tr>
        <td>City:</td>
        <td align="left"><input type="text" id="city" name="city"></td>
    </tr>

    <tr>
        <td>State:</td>
        <td align="left"><input type="text" id="state" name="state"></td>
    </tr>

    <tr>
        <td colspan="2" align="center"><input type="submit" value="Sign Up"></td>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="./chapter5_etc/manager.html">Customer Manager</a></td>
    </tr>
</table>
</form>
<br />

</body>
</html>



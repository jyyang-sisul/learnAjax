<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/Chapter3.css">
    <SCRIPT language="JavaScript" src="../js/Chapter3.js"></SCRIPT>
    <title>Ajax On Java, Chapter 3 Example</title>
  </head>
  <body onload="focusIn();">
    <h1> AJAX CHARACTER DECODER </h1>
    <h2> Press a key to find its value. </h2>
      <table>
        <tr>
          <td>
            Enter Key Here ->
            <input type="text" id="key" name="key" onkeyup="convertToDecimal();">
          </td>
      </table>
      <br />
      <table>
        <tr>
          <td colspan="5" style="border-bottom:solid black 1px;">
            Key Pressed:
            <input type="text" readonly id="keypressed">
          </td>
        </tr>
        <tr>
          <td> Decimal </td>
        </tr>
        <tr>
          <td> <input type="text" readonly id="decimal"> </td>
        </tr>
      </table>
  </body>
</html>

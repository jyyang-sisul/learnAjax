<%@ page contentType = "text/html;charset=utf-8" %>
<!DOCTYPE html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script src="../js/chapter4.js" type="text/javascript"></script>
    
    <title>Ajax On Java, Chapter 4 Example</title>
  </head>
  <body onload="focusIn();">
    <h1> AJAX CHARACTER DECODER </h1>

	  <h2>
		  type
	  </h2>
		<select id="SEARCHTYPE">
		  <option value="bufferRead">bufferRead</option>
		  <option value="json">Json</option>
		  <option value="etc">ETC</option>
		</select>		

	  
	  <h2> Press a key to find its value. </h2>
    <div>
      <table>
        <tr>
          <td>
            Enter Key Here -&gt;
            <input type="text" id="key" name="key" style="width:10;border:none" onkeyup="convertToXML();"/>
          </td>
        </tr>
      </table>
      </div>
      <div>
		  
	  <table>
        <tr>
          <td colspan="5" style="border-bottom:solid black 1px;">
            Key Pressed:
            <input type="text" readonly="readonly" id="keypressed"/>
          </td>
        </tr>
        <tr>
          <td>Decimal</td>
          <td> Hexadecimal </td>
          <td> Octal </td>
          <td> Binary </td>
          <td> Html </td>
        </tr>
        <tr>
          <td> <input type="text" readonly="readonly" id="decimal" /> </td>
          <td> <input type="text" readonly="readonly" id="hexadecimal" /> </td>
          <td> <input type="text" readonly="readonly" id="octal" /> </td>
          <td> <input type="text" readonly="readonly" id="binary" /> </td>
          <td> <input type="text" readonly="readonly" id="hyper" /> </td>
        </tr>
      </table>
      </div>

  </body>
</html>
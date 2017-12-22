var req; 
var SEARCHTYPE;

function convertToXML(){ 
	var key = document.getElementById("key"); 
	var keypressed = document.getElementById("keypressed"); 
	
	// callBack에서 
	SEARCHTYPE = document.getElementById("SEARCHTYPE").value;
	  
    keypressed.value = key.value; 
    var url = "/study/Chapter4?key="+escape(key.value)+"&type="+escape(SEARCHTYPE); 
    
	  if (window.XMLHttpRequest){ 
      req = new XMLHttpRequest(); 
    } 
    else if (window.ActiveXObject){ 
      req = new ActiveXObject("Microsoft.XMLHTTP"); 
    } 
    
	req.open("Get",url,true); 
    req.onreadystatechange = callback; 
	req.send(null);
} 

function nonMSPopulate(){
    var resp = req.responseText;
    var parser = new DOMParser();
    var dom = parser.parseFromString(resp,"text/xml");
                     
    decVal = dom.getElementsByTagName("decimal");
    var decimal = document.getElementById('decimal');
    decimal.value=decVal[0].childNodes[0].nodeValue;
   
    hexVal = dom.getElementsByTagName("hexadecimal");
    var hexadecimal = document.getElementById('hexadecimal');    
    hexadecimal.value=hexVal[0].childNodes[0].nodeValue;
     
    octVal = dom.getElementsByTagName("octal");
    var octal = document.getElementById('octal');    
    octal.value=octVal[0].childNodes[0].nodeValue;
           
    hyperVal = dom.getElementsByTagName("hyper");
    var hyper = document.getElementById('hyper');    
    hyper.value=hyperVal[0].childNodes[0].nodeValue;
        
    binaryVal = dom.getElementsByTagName("binary");
    var bin = document.getElementById('bin');    
    bin.value=binaryVal[0].childNodes[0].nodeValue;
}

function msPopulate(){
    var resp = req.responseText;
                
    var xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async="false";
    xmlDoc.loadXML(resp);
                  
    dec = xmlDoc.getElementsByTagName('decimal');
    var decimal = document.getElementById('decimal');
    decimal.value = dec[0].firstChild.data;
    
    hexi = xmlDoc.getElementsByTagName('hexadecimal');
    var hexadecimal = document.getElementById('hexadecimal');
    hexadecimal.value=hexi[0].firstChild.data;
                  
    oct = xmlDoc.getElementsByTagName('octal');
    var octal = document.getElementById('octal');
    octal.value=oct[0].firstChild.data;
                  
    bin = xmlDoc.getElementsByTagName('binary');
    var binary = document.getElementById('bin');
    binary.value=bin[0].firstChild.data;    
        
    hypertextml = xmlDoc.getElementsByTagName('hyper');
    var hyper = document.getElementById('hyper');
    hyper.value=hypertextml[0].firstChild.data;     
}

function populateJSON(){
    
	var jsonData = req.responseText;

	alert(req.responseText);
	
    var myJSONObject = JSON.parse(jsonData);  //eval('(' + jsonData + ')');

	console.log("myJSONObject : " + myJSONObject);
	
    var decimal = document.getElementById('decimal');

    decimal.value= myJSONObject.decimal;
    
    var hexadecimal = document.getElementById('hexadecimal');
    hexadecimal.value=myJSONObject.hexadecimal;
                  
    var octal = document.getElementById('octal');
    octal.value=myJSONObject.octal;
                  
    var binary = document.getElementById('binary');
    binary.value=myJSONObject.binary;
        
    var hyper = document.getElementById('hyper');
    hyper.value=myJSONObject.hyper;
}



  function nonMSPopulateJDOM(){
    var resp = req.responseText;
    var parser = new DOMParser();
    var dom = parser.parseFromString(resp,"text/xml");
                     
    decVal = dom.getElementsByTagName("decimal");
    var decimal = document.getElementById('decimal');
    decimal.value=decVal[0].childNodes[0].nodeValue;
   
    hexVal = dom.getElementsByTagName("hexadecimal");
    var hexadecimal = document.getElementById('hexadecimal');    
    hexadecimal.value=hexVal[0].childNodes[0].nodeValue;
     
    octVal = dom.getElementsByTagName("octal");
    var octal = document.getElementById('octal');    
    octal.value=octVal[0].childNodes[0].nodeValue;
           
    hyperVal = dom.getElementsByTagName("hyper");
    var hyper = document.getElementById('hyper');    
    hyper.value=hyperVal[0].childNodes[0].nodeValue;
        
    binaryVal = dom.getElementsByTagName("binary");
    var bin = document.getElementById('binary');    
    bin.value=binaryVal[0].childNodes[0].nodeValue;
  }

  function msPopulateJDOM(){
    var resp = req.responseText;
 
    var xmlDoc=new ActiveXObject("Msxml2.DOMDocument");
    xmlDoc.async="false";
    xmlDoc.loadXML(resp);
                  
    dec = xmlDoc.getElementsByTagName('decimal');
    var decimal = document.getElementById('decimal');
    decimal.value = dec[0].firstChild.data;
    
    hexi = xmlDoc.getElementsByTagName('hexadecimal');
    var hexadecimal = document.getElementById('hexadecimal');
    hexadecimal.value=hexi[0].firstChild.data;
                  
    oct = xmlDoc.getElementsByTagName('octal');
    var octal = document.getElementById('octal');
    octal.value=oct[0].firstChild.data;
        
    hypertextml = xmlDoc.getElementsByTagName('hyper');
    var hyper = document.getElementById('hyper');
    hyper.value=hypertextml[0].firstChild.data;     
    
    bin = xmlDoc.getElementsByTagName('binary');
    var binary = document.getElementById('binary');
    binary.value=bin[0].firstChild.data;    
    
  }

function callback(){ 
    if (req.readyState==4){ 
      if (req.status == 200){ 
		  
		switch( SEARCHTYPE ){
		
			case "bufferRead" :
				if (window.XMLHttpRequest){
					 nonMSPopulate(); 
				} else if (window.ActiveXObject){ 
					msPopulate();
				}
			break;	
			case "json" :
				populateJSON();
			break;
			case "etc" :
				if (window.XMLHttpRequest){
					 nonMSPopulateJDOM(); 
				} else if (window.ActiveXObject){ 
					msPopulateJDOM();
				}
			break;
		}  
		 
      } 
    } 
    clear(); 
} 



function clear(){ 
    var key = document.getElementById("key"); 
    key.value=""; 
}

function focusIn(){ 
    document.getElementById("key").focus();
}
<script type="text/javascript">


var xmlHttp  
var xmlHttp 
function f1()
{
	if (typeof XMLHttpRequest != "undefined"){
        xmlHttp= new XMLHttpRequest();
    }
    else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp==null){
        alert("Browser does not support XMLHTTP Request")
        return;
    } 
    var url="tabservlet";
   // url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("tab").innerHTML=xmlHttp.responseText   
    }   
}
</script>
<form>
<input type="button" class="form-control" value="click" onclick="f1()">
<table class="table" border="2">
<div id='tab'>

</div>
<tr>
<td>sejal</td>
<td>navin</td>
</tr>

<tr>
<td>sejal</td>
<td>navin</td>
</tr>

</table>




</form>
<!--<Developed and experimented by -----SlayerOffice------- >-->
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>ustom alert demonstration</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style type="text/css">
 
#modalContainer {
background-color:transparent;
position:absolute;
width:100%;
height:100%;
top:0px;
left:0px;
z-index:10000;
background-image:url(tp.png); /* required by MSIE to prevent actions on lower z-index elements */
}
 
#alertBox {
position:relative;
width:300px;
min-height:100px;
margin-top:50px;
border:2px solid #000;
background-color:#F2F5F6;
background-image:url(alert.png);
background-repeat:no-repeat;
background-position:20px 30px;
}
 
#modalContainer > #alertBox {
position:fixed;
}
 
#alertBox h1 {
margin:0;
font:bold 0.9em verdana,arial;
background-color:#78919B;
color:#FFF;
border-bottom:1px solid #000;
padding:2px 0 2px 5px;
}
 
#alertBox p {
font:0.7em verdana,arial;
height:50px;
padding-left:5px;
margin-left:55px;
}
 
#alertBox #closeBtn {
display:block;
position:relative;
margin:5px auto;
padding:3px;
border:2px solid #000;
width:70px;
font:0.7em verdana,arial;
text-transform:uppercase;
text-align:center;
color:#FFF;
background-color:#78919B;
text-decoration:none;
}
 
/* unrelated styles */
 
#mContainer {
position:relative;
width:600px;
margin:auto;
padding:5px;
border-top:2px solid #000;
border-bottom:2px solid #000;
font:0.7em verdana,arial;
}
 
h1,h2 {
margin:0;
padding:4px;
font:bold 1.5em verdana;
border-bottom:1px solid #000;
}
 
code {
font-size:1.2em;
color:#069;
}
 
#credits {
position:relative;
margin:25px auto 0px auto;
width:350px;
font:0.7em verdana;
border-top:1px solid #000;
border-bottom:1px solid #000;
height:90px;
padding-top:4px;
}
 
#credits img {
float:left;
margin:5px 10px 5px 0px;
border:1px solid #000000;
width:80px;
height:79px;
}
 
.important {
background-color:#F5FCC8;
padding:2px;
}
 
code span {
color:green;
}
</style>
<script type="text/javascript">
 
var ALERT_TITLE = "Oops!";
var ALERT_BUTTON_TEXT = "Ok";
 
if(document.getElementById) {
window.alert = function(txt) {
createCustomAlert(txt);
}
}
 
function createCustomAlert(txt) {
d = document;
 
if(d.getElementById("modalContainer")) return;
 
mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
mObj.id = "modalContainer";
mObj.style.height = d.documentElement.scrollHeight + "px";
 
alertObj = mObj.appendChild(d.createElement("div"));
alertObj.id = "alertBox";
if(d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth)/2 + "px";
alertObj.style.visiblity="visible";
 
h1 = alertObj.appendChild(d.createElement("h1"));
h1.appendChild(d.createTextNode(ALERT_TITLE));
 
msg = alertObj.appendChild(d.createElement("p"));
//msg.appendChild(d.createTextNode(txt));
msg.innerHTML = txt;
 
btn = alertObj.appendChild(d.createElement("a"));
btn.id = "closeBtn";
btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
btn.href = "#";
btn.focus();
btn.onclick = function() { removeCustomAlert();return false; }
 
alertObj.style.display = "block";
 
}
 
function removeCustomAlert() {
document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
}
</script>
 
<body>
 
<input type="button" value = "Test the alert" onclick="alert('This is a custom alert dialog that was created by over-riding the window.alert method.');" />
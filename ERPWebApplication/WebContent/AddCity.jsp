
<html>


<head>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<!--// Javascript //-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.accordion.js"></script>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>
<script type="text/javascript" src="assets/js/icheck.min.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<script type="text/javascript" src="assets/js/functions.js"></script>
<style type="text/css">
body{
	overflow: hidden;
}
</style>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>

 <script type="text/javascript">
    
   
    	
    function validation(){
    	var c_index=document.f1.countryid.selectedIndex;
    	if(c_index==0){
    		alert("Select the Country.");
    		document.f1.countryid.focus();
    		return false;
    	}
    	
    	var s_index=document.f1.state.selectedIndex;
    	if(s_index==0){
    		alert("Select the State.");
    		document.f1.state.focus();
    		return false;
    	}
    	
    	var c_name=document.f1.cityname;
    	if(c_name.value==""){
    		alert("Enter the name of city");
    		c_name.focus();
    		return false;
    	}
    	
    	return true;
    }
    
    function FBClose(){
		var flg=validation();
		if(flg){
			parent.$.fancybox.close();
			return true;
		}
		else 
			return false;
	}
    </script>
   
</head>



<%@page import="java.util.List"%>
 <%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
 

<script type="text/javascript">


var xmlHttp  
var xmlHttp 
function showState(str)
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
    var url="stateservlet";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("state").innerHTML=xmlHttp.responseText   
    }   
}
	
</script>
<body>
<form name="f1"  method="post" action="UserActionController" onsubmit="return validation()" autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">Add City</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table table-condensed">
                                            <thead>
                                                <tr>
                                                    <th ></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
												  <tr>
                                                    <td >Country</td>
                                                    <td >
                                               
												  <select class="form-control" name="countryid" onchange="showState(this.value)" >
                                                           
                                                            <option value="-1">--Select Country--</option>
							
                                    <%

										countrybean b=new countrybean();
										Generics<countrybean> g=new GenericsDaoImp<countrybean>();
										List<countrybean> list2=g.viewData(b);
									for(countrybean u:list2)
									{
										%>
											System.out.println("cid========"+<%=u.getCid() %>
									<option value="<%=u.getCid()%>"><%=u.getCname()%></option>
									<%} %>
                                                        </select></td> </tr>
                                                         <tr> <td class="col-md-4">State </td>
                                                         <td><div id='state'>
                                            
                                                   </div> </td>
                                                    
                                                 
                                                    
                                                </tr>
                                            
                                                        <tr>
                                                    <td class="col-md-4">City</td>
                                                    <td class="col-md-8"><input type="text" placeholder="City" class="form-control" name="cityname"></td>
                                                </tr>                                         	
												
                                                         <tr>
                                                 <td><input type="submit"  value="Add" class="btn btn-default style3" onclick="return FBClose()"  ><input type="button" value="discard" class="btn btn-default style3" onclick="parent.$.fancybox.close();"/>
                                              </td>
                                              <input type="hidden" name="btnclick" value="city">
                                              </tr>
     
											</tbody>
								</table>
								</div>
								</div>
								</div>
								</div>
								</div>			
								</div>
								</div>
								</form>
								</body>
								</html>
								
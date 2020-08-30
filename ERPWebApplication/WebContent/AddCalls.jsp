
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.company_model"%>

<%@page import="Dao.Salesmanagement.GenericsDaoImp"%>
<html>


<head>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="assets/js/jquery.js"></script>
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
	
	
	var company_name=document.f1.company.selectedIndex;
	if(company_name==0){
		alert("Select the Company");
		document.f1.company.focus();
		return false;
	}
	var cust_name=document.f1.customer.selectedIndex;
	if(cust_name==0){
		alert("Select the Customer");
		document.f1.customer.focus();
		return false;
	}
	
	var c_name=document.f1.description;
	if(c_name.value==""){
		alert("Enter Description");
		c_name.focus();
		return false;
	}
	
	
	
	var scheduledt=document.f1.scheduledate;
	if(scheduledt.value==""){
		alert("Enter ScheduleDate");
		scheduledt.focus();
		return false;
	}
	var resp=document.f1.responsible.selectedIndex;
	if(resp==0){
		alert("Select the Responsible");
		document.f1.responsible.focus();
		return false;
	}
	
	

	var priority=document.f1.priority.selectedIndex;
	if(priority==0){
		alert("Select the Priority");
		document.f1.priority.focus();
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
 <script type="text/javascript">


var xmlHttp  
var xmlHttp 
function showCustomer(str)
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
    var url="customerservlet";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("customer").innerHTML=xmlHttp.responseText   
    }   
}
 </script>
 </head>   
    <body>
<form name="f1"  method="post" action="CustomerActionController"  autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">Logged/Schedule Calls</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table" >
                                            <thead>
                                                <tr>
                                                    <th class="col-md-4"></th>
                                                    <th class="col-md-8"></th>
                                                </tr>
                                                <input type="hidden" name="hid" value="call">
                                            </thead>
                                            <tbody>
                                                 <tr>
                                                    <td class="col-md-4">Company</td>
                                                    <td class="col-md-8">
                                                        <select class="form-control" name="company" onchange="showCustomer(this.value)">
                                                           <option>--Select Company--</option>
									<%
		
				company_model b1=new company_model();
				GenericsDao<company_model> g1=new GenericsDaoImp<company_model>();
				List<company_model> list=g1.viewData(b1);
		
	
								
for(company_model u:list)
{
%>
<option value="<%=u.getCompanyid()%>"><%=u.getCompanyname()%></option>
<%} %>

									
</select>
                                                        
                                                    </td>
                                                        <tr> <td class="col-md-4">Customer</td><td><div id='customer'>
                                            
                                                   </div> </td>
                                          
                                                </tr>
                                               <tr>
                                                    <td class="col-md-4">Description</td>
                                                    <td class="col-md-8"><textarea rows="3" class="form-control" name="description"></textarea></td>
                                                     <td class="col-md-4">Next Description</td>
                                                    <td class="col-md-8"><textarea rows="3" class="form-control" name="nextdescription"></textarea></td>
                                                    
                                                </tr>
                                                 <tr>
                                                   </tr>
                                                 <tr>
                                                    <td class="col-md-4">Schedule Date</td>
                                                    <td class="col-md-8"><input type="text" placeholder="ScheduleDate..." class="form-control" name="scheduledate"></td>
                                                   <td class="col-md-4">Responsible</td>
                                                    <td class="col-md-8">
                                                        <select class="form-control" name="responsible" >
                                                           <option>--Select Responsible--</option>
                                                           <option>Xyz</option>
															</select></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">Priority</td>
                                                    <td class="col-md-8">
                                                        <select class="form-control" name="priority">
                                                           <option>--Select Priority--</option>
                                                           <option>Higher</option>
                                                           <option>Normal</option>
                                                           <option>Lower</option>
                                                           
							`							</select>
                                                        
                                                    </td>
                                                     <td class="col-md-4">Next Schedule Date</td>
                                                    <td class="col-md-8"><input type="text" placeholder="NextScheduleDate" class="form-control" name="nextscheduledate"></td>
                                                
                                                   
                                                </tr>
                                                <tr>
                                                 <td colspan="2"><input type="submit"  value="Add" class="btn btn-default style3"  name="btnclick" onClick="return FBClose()"></td>
                                                 
                                                 
                                                </tr>
                                             </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Content Section End -->
</form>
<script>
		jQuery(document).ready(function() {		
			App.setPage("AddUser");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	</body>
	</html>
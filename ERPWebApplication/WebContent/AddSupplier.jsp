<%@page import="Model.PurchaseManagement.SuppTitle_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Model.PurchaseManagement.SuppCompany_model"%>	
<%@page import="InterFace.SalesManagement.GenericsDao"%>
	 <script>
$(document).ready(function(){
    $('#iscompany').change(function(){
        if(this.checked)
        	{
        	$('#company').show();
        	
        	 $('#job_ps').show();
             $('#title').show();
           
           
            	}
        else{
            
            $('#company').hide();
         	 $('#job_ps').hide();
             $('#title').show();
           
          
    	
        }

    });
});
</script>
<script type="text/javascript">
function validation(){
	 var c_name=document.customer_form.supplier;
	 if(c_name.value==""){
		 alert("Please Enter the Name");
		 c_name.focus();
		 return false;
	 }
		
	
   	
   	var add_ress=document.customer_form.address;
   	if(add_ress.value=="")
   		{
   			alert("Please Enter Address.");
   			document.customer_form.address.focus();
   			return false;
   		}
		
	var desc=document.customer_form.description;
   	if(desc.value=="")
   		{
   			alert("Please Enter Address.");
   			document.customer_form.description.focus();
   			return false;
   		}
   	var ctry=document.customer_form.country.selectedIndex;
   	if(ctry==0)
   		{
   			alert("Please Select Country.");
   			document.customer_form.country.focus();
   			return false;
   		}
   	
   	var sta=document.customer_form.state.selectedIndex;
   	if(sta==0)
   		{
   			alert("Please Select State.");
   			document.customer_form.state.focus();
   			return false;
   		}
   	
   	var cty=document.customer_form.city.selectedIndex;
   	if(cty==0)
   		{
   			alert("Please Select City.");
   			document.customer_form.city.focus();
   			return false;
   		}
   	
   	var em=document.customer_form.email;
	if(em.value=="")
		{
			alert("Please Enter Email-ID.");
			document.customer_form.email.focus();
			return false;
		}
	
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	if (!filter.test(em.value)) 
		{
			alert('Please provide a valid email address');
			document.customer_form.email.focus();
		 	return false;
		}
	var p=document.customer_form.phn.value;
		var m1=document.customer_form.mobile1.value;
		var m2=document.customer_form.mobile2.value;
		if(m1=="" && m2=="" && p==""){
			alert("Please provide phone no or one Mobile no");
			document.customer_form.mobile1.focus();
			return false;
		}
   	var phoneno = /^\d{10}$/;  
   	if(m1 != "")
   	{
   	if(!phoneno.test(m1))
   	{
   		alert("You have entered an invalid phone number");
   		document.customer_form.mobile1.focus();
   		return false;
   	}
   	}
   	
   	if(m2 !=""){
   	if(!phoneno.test(m2))
   	{
   		alert("You have entered an invalid phone number");
   		document.customer_form.mobile2.focus();
   		return false;
   	}
   	}
 	if(p !=""){
 	   	if(!phoneno.test(p))
 	   	{
 	   		alert("You have entered an invalid phone number");
 	   		document.customer_form.phn.focus();
 	   		return false;
 	   	}
 	   	}
	var ttl=document.customer_form.ti.selectedIndex;

	if(ttl==0){
		alert("Please Select the Title.")
		document.customer_form.ti.focus();
		return false;
	}
	
   	
		return (true);
 }
 
</script>   
<script type="text/javascript">

function addcompany()
{
	var a2=document.customer_form;
	a2.action="NewHome.jsp?p=AddSuppCompany";
	a2.submit();

}
function exit()
{
	var a2=document.customer_form;
	a2.action="NewHome.jsp?p=Customers";
	a2.submit();
}


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

function showCity(str){
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
    var url="cityservlet";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange1;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
  
}
function stateChange1(){   
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("city").innerHTML=xmlHttp.responseText   
    }   
}
</script>
<script type="text/javascript">

function addCall()
{
	
	var a2=document.customer_form;
	a2.action="NewHome.jsp?p=ScheduleCalls";
	a2.submit();
}


</script>
<script type="text/javascript">
    function showDescription(){
	  var xmlhttp;
	  if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  xmlhttp.onreadystatechange=function()
	    {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	      {
	      document.getElementById("description").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","Ajaxservlet?value=description",true);
	  xmlhttp.send();
  }
  </script>

  
<form name="customer_form" method="post" action="PurchaseController"
	 autocomplete='off' onsubmit="return validation()"  >
	<div class="content-section" Style="width:900px;">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2 class="heading">
								Customers /New</br></br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save" />
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
								
							</h2>
						</header>
						<div class="contents">
							<a class="togglethis"></a>
							<div class="table-box">

								<table class="table table-condensed" >
									
									<tr>
									<td colspan="5" class="col-md-4"><label>Name</label>(<input
											type="checkbox" id="iscompany" name="check">Is a Company?)
										</td>
											
										<td>
									
										
										</td>
										<td></td>
									</tr>
									<table class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 20px 20px;" cellpadding="5" cellspacing="5">
											
											 <tr>
									
                            					<td>Name</td>
                            					<td><input type="text" class="form-control" name="supplier" /></td><td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Email</td>
                            					<td><input type="text" class="form-control" name="email" /></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text" class="form-control" name="website"/></td><td></td>
                           						 </tr>
                             					 
                            				
                           					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" class="form-control" name="faxno" /></td>
                           		 </tr>
                           		  <tr>
                            					<td>Phone No</td>
                            					<td><input type="text" class="form-control" name="phn"/></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" class="form-control" name="mobile1"/></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" class="form-control" name="mobile2"/></td><td></td>
                           					 </tr>
                           					 	 	
				 						
                           	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8"  class="table table-condensed" cellspacing="8">
									<tr id="company" style="display:none;">
                            					<td>Company</td>
                            					<td><select name="company" id="s2_1" class="form-control" style="width: 100%;">
                            							
                            							<option>--Select Company--</option>
												<%
												SuppCompany_model cc=new SuppCompany_model();
												GenericsDao<SuppCompany_model> gg=new GenericsImp<SuppCompany_model>();
												
												List<SuppCompany_model> ll=gg.viewData(cc);
												
												
												%>
												<%	for(SuppCompany_model u:ll)
{
%>
<option value="<%=u.getSuppcompanyid()%>"><%=u.getCompanyname()%></option>
<%} %>
                            							
                            						</select>
                            					</td>
                            					<td>
<input type="button" class="form-control text-center"
											 style="width: 33px; height: 34px"
											value="+" onClick="addcompany()" > </td>
								
                            				</tr>
								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" class="form-control" cols="20" name="address"></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td><div>
									<select name="country"  class="form-control" onchange="showState(this.value)">
										<option value="-1">---Select Country---</option>
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
									</select></div>
								</td>
						 		<td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddCountry.jsp" value="+" data-fancybox-type="iframe"/></td>
								</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" class="form-control">
						
							
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddState.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" class="form-control">
							
							
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddCity.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
									<tr id="job_ps" style="display:none;">
                           		 	<td>Job Position</td>
                           		 	<td><input type="text" class="form-control" name="jobposition" /></td><td></td>
                           		 </tr>
                           			<tr>
                           		 	<td>Zip</td>
                           		 	<td><input type="text" class="form-control" name="zip" /></td><td></td>
                           		 </tr>
                           					 
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" class="table table-condensed" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;">
										
								<tr>
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="ti" class="form-control" style="margin-left: 40px;">
                          					
                          					
												<option value="0">--Select Title--</option>
											 <%
												

										SuppTitle_model t=new SuppTitle_model();
										Generics<SuppTitle_model> genn=new GenericsDaoImp<SuppTitle_model>();
										List<SuppTitle_model> lll=genn.viewData(t);
									for(SuppTitle_model u:lll)
									{
										%>
											
									<option value="<%=u.getSupptitleid()%>"><%=u.getTitle()%></option>
									<%} %>
	
                          				</select>
                          			</td>
						 		<td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddSuppTitle.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                          		
                          			
                              <tr>
                            	<td><input type="hidden" name="hid" value="AddSupplier"></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									</td><td></td><td></td>
								</tr>
								
								<tr>
                           
                           	<td colspan="3"><textarea rows="4" class="form-control" cols="20" name="description" style="width:100%;" placeholder="Internal Note"></textarea></td>
                           	</tr>
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       

																
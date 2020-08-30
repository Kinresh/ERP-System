
	<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.company_model"%>

<%@page import="Dao.Salesmanagement.GenericsDaoImp"%>
	 <script>
$(document).ready(function(){
    $('#iscompany').change(function(){
        if(this.checked)
        	{
        	$('#company').hide();gg
        	 $('#job').hide();
             $('#title').hide();
           
           
            	}
        else{
            
            $('#company').show();
    		 $('#job').show();
             $('#title').show();
           
           
    	
        }

    });
});
</script>
<script>
function validation(){
	 var c_name=document.customer_form.customer;
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
  	var zip_value=document.customer_form.zip;
  	if(zip_value.value=="")
  		{
  			alert("Please Enter Zip Code.");
  			document.customer_form.zip.focus();
  			return false;
  		}
		
  	var fax_value=document.customer_form.faxno;
  	if(fax_value.value=="")
  		{
  			alert("Please Enter Fax Code.");
  			document.customer_form.faxno.focus();
  			return false;
  		}
	
  	
  	var phn=document.customer_form.phone.value;
		var m1=document.customer_form.mobile1.value;
		var m2=document.customer_form.mobile2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.customer_form.mobile1.focus();
			return false;
		}
  	var phoneno = /^\d{10}$/;  
  	if(m1 != ""){
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
  	
	var email=document.customer_form.email;
	if(email.value=="")
		{
			alert("Please Enter Email-ID.");
			document.customer_form.email.focus();
			return false;
		}
	
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	if (!filter.test(email.value)) 
		{
			alert('Please provide a valid email address');
		 		document.customer_form.email.focus();
		 	return false;
		}

	var ctry=document.customer_form.ti.selectedIndex;
  	if(ctry==0)
  		{
  			alert("Please Select title.");
  			document.customer_form.ti.focus();
  			return false;
  		}
  	
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
 
<form name="customer_form" method="post" action="UserActionController"
	onsubmit="return validation()" autocomplete='off'>
	<div class="content-section">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2 class="heading">
								<h2 class="heading">Add Call</h2>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save" />
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Cancel" />
								
							</h2>
						</header>
						<div class="contents">
							<a class="togglethis"></a>
							<div class="table-box">

								<table class="table" >
									
									<tr>

										<td class="col-md-4">
</td>											
										<input type="button"
											class="form-control btn btn-warning text-center various fsv-update"
										 style="width: 55px; height: 30px"
											value="Cancelled" data-fancybox-type="iframe">
											 <input
											type="button"
											class="form-control btn btn-success text-center various fsv-update"
											value= "Pending" style="width: 65px; height: 30px"
											value="Meetings" data-fancybox-type="iframe"> 
											<input type="button"
											class="form-control btn btn-danger text-center " value="Held"
											style="width: 65px; height: 30px" value="Quatations&Sale"> 
											<input type="button"
											class="form-control btn btn-danger text-center " value="Confirm"
											style="width: 65px; height: 30px" value="Quatations&Sale"> 
											
											<input type="button" class="form-control btn btn-success text-center  various fsv-update" style="width: 110px; height: 30px"  href="ScheduleOtherCall.jsp" value="ScheduleOtherCall" data-fancybox-type="iframe"/> 
										

										<td></td></td>
									</tr>
									<tr></tr>
									<tr>


									
										<td><textarea rows="3" class="form-control" placeholder="Description..." name="address"></textarea></td>
											<td class="col-md-4" ></td>


									</tr>
									<tr></tr>
									<tr>
									<tr id="company">
										<td class="col-md-4">
											<select class="form-control"name="company"
												style="width: 327px;" onchange="showCustomer(this.value)">
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
											<option value="0">No Company</option>
											</select>
												<td></td>
											
											</tr>
											<tr>
										<td class="col-md-4"><div id='customer'>
                                            	<select class="form-control" name="customer"
												style="width: 327px;" ><option>--Select Company--</option>
											</select>
										
                                                   </div></td>
											<td></td>
										
									</tr>
									
									<tr></tr>
									<tr></tr>
									<tr>

										<td class="col-md-8 col-md-4"><input
											type="text" placeholder="Phone" class="form-control"
											name="phone" style="width: 327px;">

										<td class="col-md-8 col-md-4" ><input
											type="text" placeholder="Mobile" class="form-control"
											name="mobile" style="width: 327px;"></td></td>

									</tr>
									<tr></tr>
									<td  class="col-md-8"><input type="text"
										class="form-control" placeholder="ScheduleDate" name="scheduledate" style="width: 327px;"></td>
									<td class="col-md-8 col-md-4"><select class="form-control" name="responsible"
												style="width: 327px;">
													<option>--Select Responsible--</option>
											</select></td>
											
									<tr>
										<td >  <select class="form-control" name="category" style="width: 327px;">
                                                           
                                                            <option value="-1">--Select Category--</option>
                                                            <option value="Inbound">Inbound</option>
                                                            <option value="Outbound">Outbound</option>
						
                                                                                </select>
											
										<td><select class="form-control" name="category" style="width: 327px;"  >
                                                           
                                                            <option value="-1">--Select Priority--</option>
						
                                                                                </select>
						 </td>
                                    </td>	
									</tr>

								


								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

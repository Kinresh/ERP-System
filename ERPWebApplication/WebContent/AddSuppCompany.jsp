  
  <%@page import="Model.SalesManagement.Title_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Model.SalesManagement.company_model"%>	
<%@page import="InterFace.SalesManagement.GenericsDao"%>
   <head>
   <script>
$(document).ready(function(){
    $('#iscompany').change(function(){
        if(this.checked)
        	{
            	$('#company').hide();
        		$('#job_ps').hide();
        		$('#title').hide();
        	}
        else{
            $('#company').show();
            $('#job_ps').show();
            $('#title').show();
        }

    });
});
</script>
   
  <script>
 
  function addcompany()
  {
  	var a2=document.supplier_form;
  	a2.action="NewHome.jsp?p=AddSuppCompany";
  	a2.submit();

  } 
  function GotoCalls(){
	  window.location.assign("home.jsp?p=ScheduledCalls");
  }
  function validation(){
	 var c_name=document.supplier_form.cust_name;
	 if(c_name.value==""){
		 alert("Please Enter the Name");
		 c_name.focus();
		 return false;
	 }
		
		var ch=document.supplier_form.iscompany.checked;
    	
    	
    	var add_ress=document.supplier_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			document.supplier_form.address.focus();
    			return false;
    		}
		
    	var ctry=document.supplier_form.country.selectedIndex;
    	if(ctry==0)
    		{
    			alert("Please Select Country.");
    			document.supplier_form.country.focus();
    			return false;
    		}
    	
    	var sta=document.supplier_form.state.selectedIndex;
    	if(sta==0)
    		{
    			alert("Please Select State.");
    			document.supplier_form.state.focus();
    			return false;
    		}
    	
    	var cty=document.supplier_form.city.selectedIndex;
    	if(cty==0)
    		{
    			alert("Please Select City.");
    			document.supplier_form.city.focus();
    			return false;
    		}
    	
    	var phn=document.supplier_form.phn_no.value;
		var m1=document.supplier_form.m_no1.value;
		var m2=document.supplier_form.m_no2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.supplier_form.m_no1.focus();
			return false;
		}
    	var phoneno = /^\d{10}$/;  
    	if(m1 != ""){
    	if(!phoneno.test(m1))
    	{
    		alert("You have entered an invalid phone number");
    		document.supplier_form.m_no1.focus();
    		return false;
    	}
    	}
    	
    	if(m2 !=""){
    	if(!phoneno.test(m2))
    	{
    		alert("You have entered an invalid phone number");
    		document.supplier_form.m_no2.focus();
    		return false;
    	}
    	}
    	
    	var ttl=document.supplier_form.title_field.selectedIndex;
    	if(!ch){
    	if(ttl==0){
    		alert("Please Select the Title.")
    		document.supplier_form.title_field.focus();
    		return false;
    	}
    	}
    	
    	
    	var email=document.supplier_form.e_name;
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(email.value != ""){
    	if (!filter.test(email.value)) 
			{
    			alert('Please provide a valid email address');
   		 		document.supplier_form.e_name.focus();
    		 	return false;
			}
		}

		return (true);
  }
  </script>
  <script type="text/javascript">
  var xmlHttp;
  function showState(id){
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
      var url="stateservlet?count="+id;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }

  function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("state").innerHTML=xmlHttp.responseText;   
      }   
  }
  function showCity(s_id){
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
      url +="?count=" +s_id;
      xmlHttp.onreadystatechange = cityChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }
  function cityChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("city").innerHTML=xmlHttp.responseText;   
      }   
  }
  
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
	  xmlhttp.open("post","Ajax_Serv?value=description",true);
	  xmlhttp.send();
  }
  </script>
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>
                  <div class="block">                  
<form name="supplier_form" method="post" action="PurchaseController"
	 autocomplete='off' >
	<div class="content-section">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							Company.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save"  onclick="return validation()"  />
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
									
								</h2>
							
						</header>
						
							<table  id="tbl1" class="table table-condensed" cellpadding="10" cellspacing="10" align="center">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" class="table table-condensed" cellpadding="5" cellspacing="5">
											
											
                            				<tr>
                            					<td>Comapany</td>
                            					<td><input type="text" class="form-control" name="company"/></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text" class="form-control" name="website"/></td><td></td>
                           						 </tr>
                             					 
                            				
                           					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text"  class="form-control" name="faxno" /></td>
                           		 </tr>
                           		  <tr>
                            					<td>Phone No</td>
                            					<td><input type="text"  class="form-control" name="phn"/></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No[1]</td>
                            					<td><input type="text" class="form-control" name="mobile1"/></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No[2]</td>
                            					<td><input type="text" class="form-control" name="mobile2"/></td><td></td>
                            					
                           					 </tr>
                           					 	
                           	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" class="table table-condensed" cellpadding="8" cellspacing="8">
									
									
									
									
									
									
									
									
									
									
									
								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" class="form-control" name="address"></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td>
									<select name="country" class="form-control" onchange="showState(this.value)">
										<option value="-1">---Select Country---</option>
										<%
											countrybean cnt=new countrybean();
											GenericsDao<countrybean> gm=new GenericsImp<countrybean>();
											List<countrybean> lst=new ArrayList<countrybean>();
											lst=gm.viewData(cnt);
											for(int i=0;i<lst.size();i++){
										%>
											<option value=<%=lst.get(i).getCid() %>><%=lst.get(i).getCname()%></option>
										<%
											}
										%>
									</select>
								</td>
						 		<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="AddCountry.jsp" value="+" data-fancybox-type="iframe"/></td>
								</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" class="form-control">
						<option>---Select State---</option>
							
						</select></div></td>
						 <td><input type="button" class="form-control  various fsv-update" href="AddState.jsp" value="+"  style="width:34px;height:32px;" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" class="form-control">
							<option>---Select City---</option>
							
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" href="AddCity.jsp" value="+" style="width:34px;height:32px;" data-fancybox-type="iframe"/></td>
				</tr>
									<tr id="job_ps">
                           		 	<td>Email</td>
                           		 	<td><input type="text" name="email" class="form-control" /></td><td></td>
                           		 </tr>
                           			 <tr>
                            					<td>Zip</td>
                            					<td><input type="text" class="form-control" name="zip"/></td><td></td>
                            					
                           					 </tr>
                           					 	 	 	
				 						
                           					 
										</table>
									</td>
								</tr>
								<tr>
									<td>
										
										<table id="tbl4" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;" class="table">
										
							
                          		
                          			
                             
										</table>
									</td><td></td><td></td>
								</tr>
								
								<tr>
                           
                           	<td colspan="3"><textarea rows="7"  class="form-control" cols="20" name="description" style="width:95%;" placeholder="Internal Note"></textarea><td><input type="hidden" value="AddSuppCompany" name="hid" /></td></td>
                           	</tr>
							</table>
		     	</div>
		     	</div>
		     	</div>
		     	</div>
		     	</div>
		     	
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       


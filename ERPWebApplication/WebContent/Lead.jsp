 
  
<%@page import="Model.SalesManagement.Categories_model"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.List"%>

<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.Title_model"%>
<head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
 function addcust()
 {
	 var a=document.lead_form;
	 a.action="NewHome.jsp?p=Customer";
	 a.submit();
	 
 }
 
  
  function validation(){
	  var sub=document.lead_form.subject;
	  if(sub.value==""){
		  alert("Describe the lead");
		  sub.focus();
		  return false;
	  }
	  
	  var dt=document.lead_form.lead_date;
	  if(dt.value==""){
		  alert("Please select the lead date");
		  dt.focus();
		  return false;
	  }
	  var cus=document.lead_form.customer.selectedIndex;
		if(cus==0)
		{
			alert("Please select the customer");
			document.lead_form.customer.focus();
			return false;
		}
		 var cus=document.lead_form.title_field.selectedIndex;
			if(cus==0)
			{
				alert("Please select the Title");
				document.lead_form.title_field.focus();
				return false;
			}
		
		 var cat=document.lead_form.category.selectedIndex;
		if(cat==0)
		{
			alert("Please select lead category");
			document.lead_form.category.focus();
			return false;
		}
		
		
		 var pri=document.lead_form.priority.selectedIndex;
		if(pri==0)
		{
			alert("Please select lead category");
			document.lead_form.priority.focus();
			return false;
		}
		
		var add_ress=document.lead_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			add_ress.focus();
    			return false;
    		}
    
    	var email=document.lead_form.e_name;
		if(email.value=="")
			{
				alert("Please Enter Email-ID.");
				document.lead_form.e_name.focus();
				return false;
			}
		
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

  	if (!filter.test(email.value)) 
			{
  			alert('Please provide a valid email address');
 		 		document.lead_form.e_name.focus();
  		 	return false;
			}
    	
    
		
    	var phn=document.lead_form.phn_no.value;
		var m1=document.lead_form.m_no1.value;
		var m2=document.lead_form.m_no2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.lead_form.m_no1.focus();
			return false;
		}
    	var phoneno = /^\d{10}$/;  
    	if(m1 != ""){
    	if(!phoneno.test(m1))
    	{
    		alert("You have entered an invalid phone number");
    		document.lead_form.m_no1.focus();
    		return false;
    	}
    	}
    	
    	if(m2 !=""){
    	if(!phoneno.test(m2))
    	{
    		alert("You have entered an invalid phone number");
    		document.lead_form.m_no2.focus();
    		return false;
    	}
    	}
		
		
		
    	
		return true;
  }
  </script>
  <script type="text/javascript">
  
  
  function exit()
  {
  	var a2=document.lead_form;
  	a2.action="NewHome.jsp?p=Leads";
  	a2.submit();
  }
  
  function fillInfo(cu_id){
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
	      document.getElementById("cu_info").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("post","Ajaxservlet?value="+cu_id,true);
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
              
						  <form action="CustomerController" method="post" name="lead_form" onsubmit="return validation();">
              
               
                      
                        <h1>&nbsp;&nbsp;&nbsp;Create Lead</h1>
                        
                        	&nbsp;&nbsp;&nbsp;					 
							<input type="submit" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
							<div style="margin-left: 88%;"><input type="radio" name="stage" value="New" checked="checked" />New &nbsp;
							<input type="radio" name="stage" value="Dead" />Dead</div>
							<hr />             
							        
							  <div class="content-section" Style="width:900px;">
		
		

						
							<table style="margin-left: 25px;" id="tbl1" cellpadding="8"  class="table table-condensed" cellspacing="8" >
							 <tr>
                            					
                            					<td colspan="3">Subject<br /><input type="text" name="subject" style="width:310px;height: 30px;" class="form-control" placeholder="Describe the lead...."/>
                            				</tr>
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="8" cellspacing="8">
											
											<tr>
                            						<td>Lead Date</td>
               										<td><input type="date"  class="form-control" name="lead_date" id="bdate_id" /></td><td></td>
                            						</tr>
										<tr>
                            				<tr>
                            					<td>Company Name</td>
                            					<td>
	                         						<input type="text"  class="form-control" name="company"/>
                            					</td>
                            					<td></td>
                            					
                            					
                            				</tr>
                           					<tr>
                            					<td>Customer</td>
                            					<td>
	                            					<select onchange="fillInfo(this.value);" class="form-control" name="customer">
	                            						<option disabled selected>--Select Customer--</option>
	                            						<%
	                            						GenericsDao gg=new GenericsImp();
	                            						customer_model cc=new customer_model();
	                            						List<customer_model> ll=gg.viewData(cc);
	                            					
	                            					for(customer_model cc1:ll)	
	                            					{
	                            						%>
	                            						<option value=<%=cc1.getCustomerid() %>><%=cc1.getCustomername() %></option>
	                            						<%} %>
	                            					</select>
	                            					<td><input type="button" class="form-control text-center"
											 style="width: 32px; height: 34px"
											value="+" onClick="addcust()" > </td>
								
                            					</td>
                            					
                            					<td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Contact Name</td>
                            					<td>
	                         						<input type="text"  class="form-control" name="con_name"/>
                            					</td>
                            					<td></td>
                            					
                            					
                            				</tr>
                            				<tr id="title">
                            				
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="title_field" class="form-control">
                          					<option selected value="0">--Select Title--</option>
                          				
                          					 <%
												

										Title_model t=new Title_model();
										GenericsDao<Title_model> genn=new GenericsImp<Title_model>();
										List<Title_model> lll=genn.viewData(t);
									for(Title_model u:lll)
									{
										%>
											
									<option value="<%=u.getTitleid()%>"><%=u.getTitle()%></option>
									<%} %>
	
                          				
                          				</select>
                          			</td>
						 		<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                            				
                          						
                           						 <tr>
                            					<td>Categories</td>
                            					<td>
	                            					<select name="category" class="form-control">
	                            						<option disabled selected>--Select Category--</option>
	                            						 <%
												

										Categories_model cc2=new Categories_model();
										GenericsDao<Categories_model> gen2=new GenericsImp<Categories_model>();
										List<Categories_model> ll2=gen2.viewData(cc2);
									for(Categories_model u:ll2)
									{
										%>
											
									<option value="<%=u.getCategoryid()%>"><%=u.getCategory()%></option>
									<%} %>
	
                          				
	                            						
	                            					</select>
                            					</td>
                            					<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="AddCategories.jsp" value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            				<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority" class="form-control">
	                            						<option disabled selected>--Select priority--</option>
	                            					
	                            							<option value="Highest">Highest</option>
	                            							<option value="Lowest">Lowest</option>
	                            						
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>
                            				
                           		  <tr>
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="cu_info" cellpadding="5"  class="table table-condensed" cellspacing="5" border="0" style="border-spacing: 100px 100px;">
										
									<tr>	
                            		<td>Address</td>
                            		<td><textarea rows="3" class="form-control" cols="20" name="address"></textarea></td><td></td>
                            	</tr>
								<tr>
                            					<td>Email</td>
                            					<td><input type="text"  class="form-control" name="e_name"/></td><td></td>
                           						 </tr>
				
				
                            					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" class="form-control" name="fax" /></td>
                           		 </tr>				
								<tr>
								<tr>
                            					<td>Phone No</td>
                            					<td><input type="text" class="form-control" name="phn_no"/></td><td></td>
                           					</tr>
                              <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" class="form-control" name="m_no1"/></td><td></td>
                           					 </tr>
                           					  <tr>
                           					 
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" class="form-control" name="m_no2"/></td><td></td>
                           					 </tr>
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea style="width: 96% !important;" class="form-control" rows="5" onclick="this.select();" placeholder="Description" name="description"></textarea></td>
									
								</tr>
								<tr><td><input type="hidden" name="hid" value="createlead"> </td></tr>
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       


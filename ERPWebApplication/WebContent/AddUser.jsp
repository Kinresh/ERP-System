  <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
  
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
 
  /*<a href="update_new_item.jsp" class="various fsv-update"  data-fancybox-type="iframe" />*/
  function validation(){
	  var dep=document.m_form.role.selectedIndex;
		if(dep==0)
		{
			alert("Please select the Role.");
			document.m_form.role.focus();
			return false;
		}
		
		var u_name=document.m_form.username;
		if(u_name.value=="")
			{
				alert("Please Enter the User Name.");
				document.m_form.username.focus();
				return false;
			}
		
		var f_name=document.m_form.firstname;
		if(f_name.value=="")
			{
				alert("Please Enter the First Name.");
				document.m_form.firstname.focus();
				return false;
			}
		var f_name=document.m_form.lastname;
		if(f_name.value=="")
			{
				alert("Please Enter the Last Name.");
				document.m_form.lastname.focus();
				return false;
			}
		var gender=document.m_form.gen;
		if(gender.value=="")
			{
				alert("Please Select the Gender.");
				document.m_form.gen.focus();
				return false;
			}
		
		var b_date=document.m_form.birth_date;
		if(b_date.value=="")
			{
				alert("Please Enter birth date.");
				document.m_form.birth_date.focus();
				return false;
			}
		
		var email=document.m_form.email;
		if(email.value=="")
			{
				alert("Please Enter Email-ID.");
				document.m_form.email.focus();
				return false;
			}
		
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    	if (!filter.test(email.value)) 
			{
    			alert('Please provide a valid email address');
   		 		document.m_form.email.focus();
    		 	return false;
			}
    	
    	var add_ress=document.m_form.address;
    	if(add_ress.value=="")
    		{
    			alert("Please Enter Address.");
    			document.m_form.address.focus();
    			return false;
    		}
		
    	var ctry=document.m_form.country.selectedIndex;
    	if(ctry==0)
    		{
    			alert("Please Select Country.");
    			document.m_form.country.focus();
    			return false;
    		}
    	
    	var sta=document.m_form.state.selectedIndex;
    	if(sta==0)
    		{
    			alert("Please Select State.");
    			document.m_form.state.focus();
    			return false;
    		}
    	
    	var cty=document.m_form.city.selectedIndex;
    	if(cty==0)
    		{
    			alert("Please Select City.");
    			document.m_form.city.focus();
    			return false;
    		}
    	
    	var contact=document.m_form.contact;
    	if(contact.value=="")
    		{
    			alert("please Enter Contact No.");
    			document.m_form.contact.focus();
    			return false;
    		}
    	
    	var phoneno = /^\d{10}$/;  
    	if(!phoneno.test(contact.value))
    	{
    		alert("You have entered an invalid phone number");
    		document.m_form.contact.focus();
    		return false;
    	}
    	
		return (true);
  }
  </script>
  <script type="text/javascript">
  
  function showState(id){
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
	      document.getElementById("state").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","stateservlet?count="+id,true);
	  xmlhttp.send();
  }
  
  function showCity(s_id){
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
	      document.getElementById("city").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("GET","cityservlet?count="+s_id,true);
	  xmlhttp.send();
  }
  
  var xmlHttp;
  
  function showNote(){
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
	      document.getElementById("internal_note").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","SettingServ?value=inote",true);
	  xmlhttp.send();
  }
  
  function exit()
  {
  	var a2=document.m_form;
  	a2.action="NewHome.jsp?p=ViewUser";
  	a2.submit();
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
  <form action="UserActionController" method="post" name="m_form" onsubmit="return validation();">
             <div class="content-section" Style="width:1000px;">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2 class="heading">
								Users /New</br></br>
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
						  
							<br />
							<table  id="tbl1" class="table table-condensed" cellpadding="10" cellspacing="10" align="center" >
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            					<td>UserName</td>
                            					<td><input type="text" class="form-control" id="user_id" name="username" /></td><td></td>
                            				</tr>
                            				<tr>
                            					<td>First Name</td>
                            					<td><input type="text" class="form-control" id="full_id" name="firstname" /></td><td></td>
                            				</tr>
                            				<tr>
                            					<td>Last Name</td>
                            					<td><input type="text" class="form-control" id="full_id" name="lastname" /></td><td></td>
                            				</tr>
                           					
                           					 <tr>
                            					<td>Gender</td>
                            					<td colspan="2"><input type="radio"  name="gen" value="male" checked="checked" />Male
                            						<input type="radio"  name="gen" value="female" />Female
                            					</td>
                            					</tr>
                            					<tr>
                            						<td>Birth Date</td>
               										<td><input type="date" class="form-control" name="birth_date" id="bdate_id" /></td><td></td>
                            						</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td><input type="text" id="email_id" class="form-control" name="email"/></td><td></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td><input type="text" id="contact_id" class="form-control" name="contact"/></td><td></td>
                            </tr>
                              <tr>
                            	<td>Fax No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td><input type="text" class="form-control"  name="faxno"/></td><td></td>
                            </tr>
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" class="table table-condensed" cellpadding="12" cellspacing="12" style="border-spacing: 100px 100px;">
										<tr>
												 <td>Role</td>
                            						<td>
                            						<select name="role" class="form-control" class="s_select">
                            							<option disabled selected>---Select Role---</option>
                            							<%
                            							Role r=new Role();
                        								List<Role> list=new ArrayList<Role>();
                        								Generics<Role> gvd=new GenericsDaoImp<Role>();
                        								list= gvd.viewData(r);
								for(int i=0;i<list.size();i++)
								{
								%>
             					<option value=<%=list.get(i).getRoleid() %>><%=list.get(i).getRoleType()%></option>
             					<%} %>
                            							<!--  <option onClick="fancyboxMe('addRole.jsp')"> Create and Edit</option>-->
                            						</select>
                            						<!-- <input type="button" style="margin-left: 10px;"  href="department.jsp" class="various fsv-update"  data-fancybox-type="iframe"/> -->
                            						
                           							 </td>
                           							 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;"  href="AddRole.jsp" value="+" data-fancybox-type="iframe"/></td>
											</tr>
											<tr>
                            	<td>Address</td>
                            	<td><textarea rows="3" cols="20"  class="form-control" name="address"></textarea></td><td></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td>
						<select name="country" class="form-control" onchange="showState(this.value)">
							<option disabled selected>---Select Country---</option>
							<%
								countrybean cnt=new countrybean();
								Generics<countrybean> gm=new GenericsDaoImp<countrybean>();
								List<countrybean> lst=new ArrayList<countrybean>();
								lst=gm.viewData(cnt);
								for(int i=0;i<lst.size();i++){
							%>
								<option value=<%=lst.get(i).getCid() %>><%=lst.get(i).getCname() %></option>
							<%
								}
							%>
						</select></td>
						 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddCountry.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" class="form-control">
						<option>---Select State---</option>
							
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddState.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" class="form-control">
							<option>---Select City---</option>
							
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" href="AddCity.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				
                              			
                            	 <tr>
                            	<td>Upload Image</td>
                            	<td><input type="file" class="form-control" id="img_id" name="img_name" value="choose file"/></td>
                            	<td></td>
                            	
                            </tr>
                           
                           
										</table>
									</td>
								</tr>
								
								
                           
                              <tr>
                            	<td><input type="hidden" value="AddUser" name="btnclick" /></td>
                            	<td>
                            	</td><td></td>
                            </tr>
									
								</tr>
								 <tr><td colspan="3"><textarea rows="3" class="form-control" style="width: 100%;" placeholder="Internal Note" name="description"></textarea></td></tr>
							</table>
		     
		     	
			 			</form>
			 				</div>
		     	</div>
		     	</div>
		     	</div>
		     	</div>
		     	</div>
		     	</div>
		     
			 			</div>
						                      
                        </div>

               </div>   
                       


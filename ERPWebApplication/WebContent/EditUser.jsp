  <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<%
	String edit_id=request.getParameter("id");
	AddInsertDao d_obj=new AddInsertDaoImp();
	List<UserModel> u_lst=d_obj.viewUser(Integer.parseInt(edit_id));
%>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
 
  /*<a href="update_new_item.jsp" class="various fsv-update"  data-fancybox-type="iframe" />*/
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
  
 
  </script>
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>
                <div class="row-fluid" style="margin-left: 46px;margin-top: 20px;">

               
                        <div class="span11">   
                        <div class="head clearfix">
                        <h1>Edit User</h1>
                        </div>
                        <div class="block">                  
						  <form action="UserActionController" method="post" name="m_form" onsubmit="return validation()">
							<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px"  value="Save" />&nbsp;&nbsp;or<a href="UserController?action=ViewUserDetails&id=<%=edit_id %>" style="margin-left:10px;" >Discard</a><hr />             
						  
							<br />
							 <div class="table-box" style="width:1000px">
							<table class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center" >
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            					<td>User ID</td>
                            					<td><input type="text"  class="form-control" id="user_id" name="user_name" value="<%=u_lst.get(0).getUsername()%>" onclick="this.select();" /></td><td></td>
                            				</tr>
                            				<tr>
                            					<td>First Name</td>
                            					<td><input type="text" id="full_id" class="form-control" name="firstname" value="<%=u_lst.get(0).getFirstname()%>" onclick="this.select();" /></td><td></td>
                            				</tr>
                            				<tr>
                            					<td>Last Name</td>
                            					<td><input type="text"  class="form-control" name="lastname" value="<%=u_lst.get(0).getLastname()%>" onclick="this.select();" /></td><td></td>
                            				</tr>
                           					 <tr>
                            					<td>Gender</td>
                            					<td><input type="radio"  name="gen_name" value="male" <%if(u_lst.get(0).getGender().equalsIgnoreCase("male")){ %> checked="checked"<%} %> />Male
                            						<input type="radio"  name="gen_name" value="female" <%if(u_lst.get(0).getGender().equalsIgnoreCase("female")){ %> checked="checked"<%} %> />Female
                            					</td>
                            					</tr>
                            					<tr>
                            						<td>Birth Date</td>
               										<td><input type="text" class="form-control" name="bdate_name" id="bdate_id" value="<%=u_lst.get(0).getBirthdate()%>" /></td><td></td>
                            						</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td><input type="text" id="email_id"  class="form-control" name="email_name" value="<%=u_lst.get(0).getEmailaddress()%>" onclick="this.select();" /></td><td></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td><input type="text" id="contact_id" name="contact_name"  class="form-control" value="<%=u_lst.get(0).getContactno()%>" onclick="this.select();" /></td><td></td>
                            </tr>
                             
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" class="table table-condensed" cellpadding="12" cellspacing="12" style="border-spacing: 100px 100px;">
										<tr>
												 <td>Role</td>
                            						<td>
                            						<select name="s_dep"  class="form-control">
                            						<option disabled></option>
                            							<%
                            							Role r=new Role();
                        								List<Role> list=new ArrayList<Role>();
                        								Generics<Role> gvd=new GenericsDaoImp<Role>();
                        								list= gvd.viewData(r);
								for(int i=0;i<list.size();i++)
								{
								%>
             					<option value=<%=list.get(i).getRoleid() %> <%if(Integer.toString(list.get(i).getRoleid()).equals(Integer.toString(u_lst.get(0).getRoleid()))){ %> selected<%} %>><%=list.get(i).getRoleType() %></option>
             					<%} %>
                            						</select>                            						
                           							 </td>
                           							 <td><input type="button" class="form-control various fsv-update"    href="AddRole.jsp" value="+" data-fancybox-type="iframe"/></td>
											</tr>
											<tr>
                            	<td>Address</td>
                            	<td><textarea rows="3" cols="20" class="form-control" name="address" onclick="this.select();"><%=u_lst.get(0).getAddress() %></textarea></td><td></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td>
						<select name="country" onchange="showState(this.value)" class="form-control">
							<option disabled></option>
							<%
								countrybean cnt=new countrybean();
								Generics<countrybean> gm=new GenericsDaoImp<countrybean>();
								List<countrybean> lst=new ArrayList<countrybean>();
								lst=gm.viewData(cnt);
								for(int i=0;i<lst.size();i++){
							%>
								<option value=<%=lst.get(i).getCid() %><%if(Integer.toString(lst.get(i).getCid()).equals(Integer.toString(u_lst.get(0).getCid()))){ %> selected<%} %>><%=lst.get(i).getCname() %></option>
							<%
								}
							%>
						</select></td>
						 <td><input type="button" class="form-control various fsv-update" href="AddCountry.jsp"   value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" class="form-control">
						<option disabled></option>
							<%
								statebean st=new statebean();
								List<statebean> s_lst=d_obj.viewstate(u_lst.get(0).getCid());
								for(int i=0;i<s_lst.size();i++){
							%>
							<option value=<%=s_lst.get(i).getSid() %><%if(Integer.toString(s_lst.get(i).getSid()).equals(Integer.toString(u_lst.get(0).getSid()))){ %> selected<%} %>><%=s_lst.get(i).getStatename() %></option>
							<%} %>
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" href="AddState.jsp"  value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" class="form-control">
							<option disabled></option>
							<%
								citybean ct=new citybean();
								List<citybean> c_lst=d_obj.viewcity(u_lst.get(0).getSid());
								for(int i=0;i<c_lst.size();i++){
							%>
								<option value=<%=c_lst.get(i).getCityid() %><%if(Integer.toString(c_lst.get(i).getCityid()).equals(Integer.toString(u_lst.get(0).getCityid()))){ %> selected<% }%>><%=c_lst.get(i).getCityname() %></option>
							<% }%>
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" href="AddCity.jsp"   value="+" data-fancybox-type="iframe"/></td>
				</tr>
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" class="table table-condensed" cellspacing="10" cellpadding="10" border="0" style="border-spacing: 100px 100px;">
											
                            	 <tr>
                            	<td>Upload Image</td>
                            	<td><input type="file" id="img_id" class="form-control" name="img_name" value="choose file"/></td><td></td>
                            </tr>
                           
                           
                              <tr>
                            	<td><input type="hidden" value="EditUser" name="btnclick" /><input type="hidden" name="edit_id" value="<%=u_lst.get(0).getUserid()%>"/></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									</td>
								</tr>
								 <tr><td colspan="3"><textarea rows="4" style="width: 100%;" placeholder="Internal Note" name="description" onclick="this.select();"><%=u_lst.get(0).getDescription() %></textarea></td></tr>
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       


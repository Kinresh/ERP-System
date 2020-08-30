  <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<%
	String info_id=request.getParameter("id");
System.out.print("-----------"+info_id);
	AddInsertDao d_obj=new AddInsertDaoImp();
	List<UserModel> detail=d_obj.viewUser(Integer.parseInt(info_id));
	String status=detail.get(0).getActive_flag();
	String sname;
	if(status.equals("1"))
		sname="  Block  ";
	else
		sname="Unblock";
%>
   <head>
   
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });
  
  function CreateUser() {
	  window.location.assign("NewHome.jsp?p=AddUser");
	
}
  
  function BlockUnblock(b_id) {
		window.location.assign("BlockUnblock?hid="+b_id);
	}
  
  function editUser(id){
	  window.location.assign("NewHome.jsp?p=EditUser&id="+id);
  }
  
  function deletedata(id)
  {
  	var f=document.f1;
  	f.cid.value=id;
  	if(confirm("are you sure want to delete record?"))
  		{
               f.action="UserActionController";
           
  				
  		}

  	
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
<form name="f1" method="post">
                <div class="row-fluid" style="margin-left: 46px;margin-top: 20px;">

               
                        <div class="span11">   
                        <div class="head clearfix">
                        <h1>View UserDetails</h1>
                        </div>
                        <div class="block" style="font-size: 16px;">                  
							<input type="button" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px"  value="Edit" onclick="editUser(<%=detail.get(0).getUserid()%>)"/><input type="button" class="btn btn-primary"  value="Create" style="margin-left: 15px;" onclick="CreateUser();"/>
							<input type="button" class="btn btn-danger"  value="<%=sname %>" onClick="BlockUnblock(<%=detail.get(0).getUserid()%>);" style="margin-left: 70%;" />&nbsp;&nbsp;
                             <input type="submit" class="btn btn-inverse" value="Delete" onClick="deletedata(<%=detail.get(0).getUserid()%>);" />                                    									
							<hr />             
						  
							<br />
							 <div class="table-box" style="width:1000px">
							<table class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								<tr>
									<td>
									<input type="hidden" name="cid"><input type="hidden" name="btnclick" value="D">
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            					<td>User ID</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getUsername() %></td>
                            				</tr>
                            				<tr>
                            					<td>First Name</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getFirstname() %></td>
                            				</tr>
                            				<tr>
                            					<td>Last Name</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getLastname() %></td>
                            				</tr>
                           					 <tr>
                            					<td>Gender</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getGender() %>
                            					</td>
                            					</tr>
                            					<tr>
                            						<td>Birth Date</td>
               										<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getBirthdate() %></td>
                            						</tr>
                            							<tr>
                            	<td>Email</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getEmailaddress() %></td>
                            </tr>
                              <tr>
                            	<td>Contact No&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getContactno() %></td>
                            </tr>
                             
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="12" class="table table-condensed" cellspacing="12" style="border-spacing: 100px 100px;">
										<tr>
												 <td>Role</td>
                            						<td style="border-left: 1px solid #cdcdcd;">
                            						<%
                            							int r_id=detail.get(0).getRoleid();
                            							String role=d_obj.getRole(r_id);
                            						%><%=role %>                            						
                           							 </td>
                           							
											</tr>
											<tr>
                            	<td>Address</td>
                            	<td style="border-left: 1px solid #cdcdcd;"><%=detail.get(0).getAddress() %></td>
                            </tr>
				<tr>
					<td>Country</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int c_id=detail.get(0).getCid();
						String country=d_obj.getCountry(c_id);
					%><%=country %>
						</td>
						 <td></td>
				</tr>
				<tr>
					<td>State</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int s_id=detail.get(0).getSid();
					List<statebean> s=d_obj.viewstate(s_id);
					%><%=s.get(0).getStatename() %>
					</td>
						
				</tr>
				<tr>
					<td>City</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int city_id=detail.get(0).getCityid();
					List<citybean> city=d_obj.viewcity(city_id);
					%><%=city.get(0).getCityname() %>
					</td>
						
				</tr>
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
							<span style="margin-left: 30px;">Internal Note: <%=detail.get(0).getDescription() %></span><br /><br /><br /><br />
		     				<br /><br /><br /><br />
			 			</div>
						                      
                        </div>

               </div>   
   </form>                    


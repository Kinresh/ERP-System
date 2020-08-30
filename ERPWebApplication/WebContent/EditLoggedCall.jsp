 <%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.logged_call_model"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%
	String sc_id=request.getParameter("id");
	ScheduleCallDao sc= new ScheduleCallDaoImp();
	AddInsertDao aa=new AddInsertDaoImp();

	ArrayList<logged_call_model> scall_list=sc.viewloggedInfo(Integer.parseInt(sc_id));
%>
 
 <script type="text/javascript">
  function ScheduledCall(){
	  window.location.assign("NewHome.jsp?p=AddScheduleCall");
  }
  
  function EditLoggedCall(edit_id) {
	window.location.assign("NewHome.jsp?p=EditLoggedCall&id="+edit_id+"");
}
 
  </script>
 <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
           <form action="CustomerCallController" method="post" name="cust_update_form" >
                                    <div class="table-box" style="width:1000px">
                        <div class="block">   
                        <%
														int cust_id1=scall_list.get(0).getContact();
			                                    		List<customer_model> cu_lst1=aa.viewCustomerBycustid(cust_id1);
														%>                   
                        		<h1>Logged... /<%=cu_lst1.get(0).getCustomername()%> </h1>
                        		<div class="block">                       
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or<a href="" style="margin-left:10px;" >Cancel</a><hr />
                       		 </div>
                       
							<hr />             
						 <br />
					<input type="text" class="form-control" name="summary" value='<%=scall_list.get(0).getSummary() %>'></br><br />
								<table style="margin-left: 25px;" class="table" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td style="border-left: 1px solid #cdcdcd;"><input type="date" name="loggeddate" class="form-control" value='<%=scall_list.get(0).getDate() %>'></td><td></td>
                            						</tr>
                            				
                            					
                            							
														<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td><select onchange="ViewScheduleCalls(this.value);"  class="form-control" name="contact">
																<option disabled selected></option>
																<%
																	customer_model cus= new customer_model();
																	GenericsDao<customer_model> g_cust = new GenericsImp<customer_model>();
																	List<customer_model> cust_list=g_cust.viewData(cus);
																	for(int i=0;i<cust_list.size();i++){
																%>
																	<option value=<%=cust_list.get(i).getCustomerid()%><%if(Integer.toString(cust_list.get(i).getCustomerid()).equals(Integer.toString(scall_list.get(0).getContact()))){ %> selected<%} %>><%=cust_list.get(i).getCustomername() %></option>
																<%} %>
															</select>
														</td>
														</tr>
													
														  
                         
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" class="table table-condensed" cellspacing="10" style="border-spacing: 100px 100px;">
												<tr>
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible" class="form-control" >
                            		<option disabled selected></option>
                            		<%
                            		Integer id11 = (Integer) session.getAttribute("id1");
                            			AddInsertDao ua= new AddInsertDaoImp();
                            			List<UserModel> list=ua.viewUserData(id11, 0);
                            		for(int j=0;j<list.size();j++){
																%>
																	<option value=<%=list.get(j).getUserid() %> <%if(Integer.toString(list.get(j).getUserid()).equals(Integer.toString(scall_list.get(0).getResponsible()))){ %> selected<%} %>><%=list.get(j).getUsername()%></option>
																<%} %>
                            	</select>
                            	</td><td></td>
                            </tr>
											
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><input type="text"  class="form-control"  name="mobile" value='<%=scall_list.get(0).getMobile() %>'><input type="hidden" name="hid" value="editloggedcall"><input type="hidden" value="<%=sc_id %>" name="loggedid"/></td>
									
                            				</tr>
											
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     						
								
		            </div>
					</div>
					</form>
               </div>   
               </div>
               </div>
               </div>
               </div>
               </div>
               

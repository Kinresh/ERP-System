 <%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.ScheduleCall_model"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>

<%
	String sc_id=request.getParameter("id");
	ScheduleCallDao sc= new ScheduleCallDaoImp();
	AddInsertDao aa=new AddInsertDaoImp();

	ArrayList<ScheduleCall_model> scall_list=sc.viewScheduleInfo(Integer.parseInt(sc_id));
%>
 <script type="text/javascript">
  function ScheduledCall(){
	  window.location.assign("NewHome.jsp?p=AddScheduleCall");
  }
  
  function EditScheduleCall(edit_id) {
	window.location.assign("NewHome.jsp?p=EditScheduleCall&id="+edit_id+"");
}
 
  </script>
 <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box" style="width:1000px">
                        <div class="block">   
                        <%
														int cust_id1=scall_list.get(0).getCustomerid();
			                                    		List<customer_model> cu_lst1=aa.viewCustomerBycustid(cust_id1);
														%>                   
                        		<h1>Scheduled... /<%=cu_lst1.get(0).getCustomername()%> </h1>
                       		 </div>
                        <div class="block">                       
							<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px"  value="Edit" onclick="EditScheduleCall(<%=sc_id %>);" />&nbsp;<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Create" style="margin-left:15px;" onclick="ScheduledCall();" />
							<div style="margin-left: 60%;">
								<input type="radio" value="Confirmed" class="btn" name="status" <%if(scall_list.get(0).getStatus().equalsIgnoreCase("Confirmed")){ %> checked="checked"<%} %> />Confirmed
								<input type="radio" value="Cancelled" class="btn" name="status" <%if(scall_list.get(0).getStatus().equalsIgnoreCase("Cancelled")){ %> checked="checked"<%} %>/>Cancelled
								<input type="radio" value="Pending" class="btn" name="status" <%if(scall_list.get(0).getStatus().equalsIgnoreCase("Pending")){ %> checked="checked"<%} %>/>Pending
								<input type="radio" value="Held" class="btn" name="status" <%if(scall_list.get(0).getStatus().equalsIgnoreCase("Held")){ %> checked="checked"<%} %>/>Held
								</div>
							<hr />             
						 <br />
				<Span style="font-size: 25px;"><%=scall_list.get(0).getSummary() %></Span><br /><br />
								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td style="border-left: 1px solid #cdcdcd;"><%=scall_list.get(0).getScheduledt() %></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int cust_id=scall_list.get(0).getCustomerid();
			                                    		List<customer_model> cu_lst=aa.viewCustomerBycustid(cust_id);
														%><%=cu_lst.get(0).getCustomername()%>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						String category=scall_list.get(0).getCategory();
						
					%><%=category %>
					</td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td style="border-left: 1px solid #cdcdcd;">
                            					<%
                            						
                            						String priority=scall_list.get(0).getPriority();
                            					%><%=priority %>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" class="table table-condensed" cellspacing="10" style="border-spacing: 100px 100px;">
												 <tr>
                            	<td>Responsible</td>
                            	<td style="border-left: 1px solid #cdcdcd;">
                            	
                            		<%
                            			int resid=scall_list.get(0).getResponsible();
                            		ScheduleCallDao ss=new ScheduleCallDaoImp();
                            		List<UserModel> ll=ss.viewUserbyRespid(resid);
                            		%><%=ll.get(0).getUsername() %>
                            		
                            	</td><td></td>
                            </tr>
											
												<tr>
                            					<td>Phone No</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=scall_list.get(0).getPhone() %></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=scall_list.get(0).getMobile1() %></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=scall_list.get(0).getMobile2() %></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     						Description
									<%=scall_list.get(0).getDescription() %><br /><br ><br /><br />
								
								
		            </div>
					</div>
               </div>   
               </div>
               </div>
               </div>
               </div>
               </div>
               

  <%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="InterFace.SalesManagement.GenericsDao"%>
 <%@page import="Model.SalesManagement.Meeting_model"%>
 <%@page import="Model.SalesManagement.customer_model"%>
 <%@page import="Model.UserManagement.UserModel"%>
 <%@page import="java.util.List"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<%

String i_id=request.getParameter("id");
AddInsertDao sd_obj=new AddInsertDaoImp();
ArrayList<Meeting_model> m_list=sd_obj.MeetingInfo(Integer.parseInt(i_id));
%>
   <head>  
   
 
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });  
 </script>
 
 
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>
               <div class="content-section" style="width:1100px;">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;Edit Meeting</h1>
                        </div>
                        <div class="block">     
                                    
<form name="meeting_form" action="CustomerUpdateController" method="post" >
&nbsp;&nbsp;&nbsp;<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or<a href="NewHome.jsp?p=Meetings" style="margin-left:10px;" >Discard</a><hr />             

								<table  id="tbl1" class="table table-condensed" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					Meeting Subject<br />
                            					<input type="text" class="form-control" name="subject" style="width:290px; height: 30px;" value="<%=m_list.get(0).getSubject() %>" /></td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date<br /><input type="date"  class="form-control" name="date_name" id="bdate_id" style="width: 288px; height: 30px;" value="<%=m_list.get(0).getDate() %>" /></td>
                            						</tr>
                            				
                            				
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" class="table table-condensed" class="form-control" cellpadding="8" cellspacing="8">
						
					
											 			
                            					<tr>
											 				<td>Duration</td>
											 				<td><input type="text" style="width:80px;" class="form-control" value="24:00" name="duration" value="<%=m_list.get(0).getDuration()%>"></td>
											 			</tr>
											 			<tr>
											 				<td>Attendees</td>
											 				<td>
											 					<select  id="s2_2" style="width: 220px;;" class="form-control" multiple="multiple" name="attendies">
                                        <option value="0"  disabled></option>
                                       <%
																	customer_model cus= new customer_model();
																	GenericsDao<customer_model> g_obj = new GenericsImp<customer_model>();
																	List<customer_model> cus_list=g_obj.viewData(cus);
																	String a_id=m_list.get(0).getAttendies();
																	String[] a_ids=a_id.split(",");
																	for(int i=0;i<cus_list.size();i++){
												
																		
																%>
																	<option value=<%=cus_list.get(i).getCustomerid() %><%for(int j=0;j<a_ids.length;j++){if(Integer.toString(cus_list.get(i).getCustomerid()).equals(a_ids[j])){ %> selected<%}} %>><%=cus_list.get(i).getCustomername()%></option>
																<%
																		}%>                   
                                    </select>
											 				</td>
											 			</tr>
                            					
														
                                        						
                                                 
                                  
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="14" class="table table-condensed" cellspacing="14" style="border-spacing: 100px 100px;">
								<tr>		
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible" class="form-control">
                            		<option disabled selected></option>
                            		<%
                            		Integer id11 = (Integer) session.getAttribute("id1");
                            			AddInsertDao ua= new AddInsertDaoImp();
                            			List<UserModel> list=ua.viewUserData(id11, 0);
                            		for(int j=0;j<list.size();j++){
																%>
																	<option value=<%=list.get(j).getUserid() %> <%if(Integer.toString(list.get(j).getUserid()).equals(Integer.toString(m_list.get(0).getResponsible()))){ %> selected<%} %>><%=list.get(j).getUsername()%></option>
																<%} %>
                            		
                            	</select>
                            	</td><td><input type="hidden" name="hid" value="EditMeeting"/><input type="hidden" name="edit_id" value="<%=m_list.get(0).getMeeting_id()%>"/></td>
                            </tr>
											<tr>
												<td>Location</td>
												<td><input type="text" name="location"  class="form-control" value="<%=m_list.get(0).getLocation()%>"/></td>
											</tr>
											
				
										</table>
									</td>
								</tr>
								<tr><td colspan="3">
										<textarea rows="5" style="width:93%;" placeholder="Description"  class="form-control" name="description"><%=m_list.get(0).getDescription() %></textarea>
                            			</td>
                            				</tr>
								
							</table>
							                          
	</form>
	
	
	                             
                                    
                               
			 			</div>
						                      
                        </div>

               </div>   
                       


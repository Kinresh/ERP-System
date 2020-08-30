 <%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="Model.SalesManagement.Meeting_model"%>
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
   <script type="text/javascript">
   function createMeeting(){
	   window.location.assign("NewHome.jsp?p=AddMeeting");
   }
   
   function editMeeting(edit_id) {
		window.location.assign("NewHome.jsp?p=EditMeeting&id="+edit_id+"");
	}
   
   function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=meeting&?dv_d=5&id="+id+"");
		}
			
	}
   </script>
</head>
                <div class="row-fluid">

               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;View Meeting </h1>
                        </div>
                        <div class="block" style="font-size: 16px;">                  
				&nbsp;&nbsp;&nbsp;<input type="button" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Edit" onclick="editMeeting(<%=i_id %>);"/>&nbsp;&nbsp;<input type="button" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Create" onclick="createMeeting();"/>
				
<hr />             

								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					<span style="font-size: 25px;"><%=m_list.get(0).getSubject() %></span>
                            					</td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date: <%=m_list.get(0).getDate() %></td>
                            						</tr>
                            				
                            				
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
						
					
											 			
                            					<tr>
											 				<td>Duration</td>
											 				<td style="border-left: 1px solid #cdcdcd;"><%=m_list.get(0).getDuration() %> hrs</td>
											 			</tr>
											 			<tr>
											 				<td>Attendees</td>
											 				<td style="border-left: 1px solid #cdcdcd;">
											 					<%=m_list.get(0).getAttendees_names() %>
											 				</td>
											 			</tr>
                            					
														
                                        						
                                                 
                                  
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" class="table table-condensed" cellpadding="14" cellspacing="14" style="border-spacing: 100px 100px;">
								<tr>		
                            	<td>Responsible</td>
                            	<td style="border-left: 1px solid #cdcdcd;">
                            	
                            		<%
                            			int resid=m_list.get(0).getResponsible();
                            		ScheduleCallDao ss=new ScheduleCallDaoImp();
                            		List<UserModel> ll=ss.viewUserbyRespid(resid);
                            		%><%=ll.get(0).getUsername() %>
                            		
                            	</td><td><input type="hidden" name="hid_val" value="create meeting"/></td>
                            </tr>
											<tr>
												<td>Location</td>
												<td style="border-left: 1px solid #cdcdcd;"><%=m_list.get(0).getLocation() %></td>
											</tr>
											
				
										</table>
									</td>
								</tr>
								<tr><td colspan="3">Description:
										<%=m_list.get(0).getDescription() %>
										<br /><br /><br />
                            			</td>
                            				</tr>
								
							</table>
				       
			 			</div>
						                      
                        </div>

               </div>   
                       


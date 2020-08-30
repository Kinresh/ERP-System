 <%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="java.util.List"%>
   <head>  
 
  <script>
  $(function() {
    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
  });  
 </script>
 <script type="text/javascript">
  function validation(){
		
	  var sub=document.meeting_form.subject;
    	if(sub.value=="")
    		{
    			sub.focus();
    			return false;
    		}
    	
    	  var date=document.meeting_form.date_name;
      	if(date.value=="")
      		{
      			date.focus();
      			return false;
      		}
      	
      	var cont=document.meeting_form.attendies.selectedIndex;
   	 if(cont==0){
   		 alert("Select the attendees");
   		 document.meeting_form.attendies.focus();
   		 return false;
   	 }
    	
      	var res=document.meeting_form.responsible.selectedIndex;
   	 if(res==0){
   		 alert("Select the Responsible Person");
   		 document.meeting_form.responsible.focus();
   		 return false;
   	 }
   	 
   	 var loc=document.meeting_form.location;
   	 if(loc==""){
   		 loc.focus();
   		 return false;
   	 }
    
		return true;
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
<%
Integer userid= (Integer) session.getAttribute("id1");
System.out.print("***************"+userid);
%>
                <div class="row-fluid">

               
                        <div class="span9">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Meeting</h1>
                        </div>
                        <div class="block">                  
<form name="meeting_form" action="CustomerController" method="post" onsubmit="return validation();">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px"  value="Save" onclick="return validation();" />&nbsp;&nbsp;or<a href="UserController?action=Meetings" style="margin-left:10px;" >Discard</a><hr />
 <div class="table-box" style="width:800px">             

								<table style="margin-left: 25px;"  id="tbl1" cellpadding="10" class="table" cellspacing="10">
								<tr><td colspan="3">
                            					Meeting Subject<br />
                            					<input type="text" class="form-control" name="subject" style="width:290px; height: 30px;" /></td>
                            				</tr>
                            				<tr>
                            						
               										<td colspan="3">Date<br /><input type="date"  class="table" name="date_name" id="bdate_id" style="width: 288px; height: 30px;" /></td>
                            						</tr>
                            				
                            				
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" class="table" cellpadding="8" cellspacing="8">
						
					
											 			
                            					<tr>
											 				<td>Duration</td>
											 				<td><input type="text" class="form-control" style="width:80px;" value="24:00" name="duration"></td>
											 			</tr>
											 			<tr>
											 				<td>Attendees</td>
											 				<td>
											 					<select  id="s2_2" class="form-control" style="width: 220px;;" multiple="multiple" name="attendies">
                                      <option value="0" selected >select attendees</option>
                                       <%
																	customer_model cus= new customer_model();
																	GenericsDao<customer_model> g_obj = new GenericsImp<customer_model>();
																	List<customer_model> cus_list=g_obj.viewData(cus);
																	for(int i=0;i<cus_list.size();i++){
																%>
																	<option value=<%=cus_list.get(i).getCustomerid() %>><%=cus_list.get(i).getCustomername() %></option>
																<%} %>                   
                                    </select>
											 				</td>
											 			</tr>
                            					
														
                                        						
                                                 
                                  
                            					
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="14" class="table" cellspacing="14" style="border-spacing: 100px 100px;">
								<tr>		
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible" class="form-control">
                            		<option disabled selected></option>
                            			<%
                            		
                            			AddInsertDao ua= new AddInsertDaoImp();
                            			List<UserModel> list=ua.viewUserData(userid, 0);
                            		for(int j=0;j<list.size();j++){
																%>
																	<option value=<%=list.get(j).getUserid() %>><%=list.get(j).getUsername() %></option>
																<%} %>
                            		
                            	</select>
                            	</td><td><input type="hidden" name="hid" value="AddMeeting"/></td>
                            </tr>
											<tr>
												<td>Location</td>
												<td><input type="text" name="location" class="form-control"/></td>
											</tr>
											
				
										</table>
									</td>
								</tr>
								<tr><td colspan="3">
										<textarea rows="4" style="width:93%;" placeholder="Description" class="form-control" name="description"></textarea>
                            			</td>
                            				</tr>
								
							</table>
							                          
	</form>
	
	
	                             
                                    
                               
			 			</div>
						                      
                        </div>

               </div>   
                       


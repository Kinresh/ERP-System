<%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.ScheduleCall_model"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="java.util.List"%>


 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  function createCustomer(){
	  window.location.assign("home.jsp?p=Add Customer");
  }
  
  function editCustomer(edit_id) {
	window.location.assign("home.jsp?p=Edit Customer&id="+edit_id+"");
	
	
}
 
  </script>
  <script type="text/javascript">


var xmlHttp  
var xmlHttp 
function ViewScheduleCalls(str)
{
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
    var url="ViewScheduleCall";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("view").innerHTML=xmlHttp.responseText   
    }   
}
</script>
  
 <%
String edit_schedule_id=request.getParameter("id");
ScheduleCallDao sd_obj= new ScheduleCallDaoImp();
List<ScheduleCall_model> sch_list=sd_obj.viewScheduleInfo(Integer.parseInt(edit_schedule_id));
%>
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
                        		<h1>Customers /<%=sch_list.get(0).getSummary() %><%System.out.print("sumary-----------"+sch_list.get(0).getSummary()); %></h1>
                       		 </div>
						   <div class="block">
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or<a href="UserController?action=ScheduleCalls" style="margin-left:10px;" >Cancel</a><hr />   
							
<div style="margin-left: 66%;">
<input type="radio" value="Confirmed" class="btn" name="status" checked="checked" />Confirmed
<input type="radio" value="Cancelled" class="btn" name="status" />Cancelled
<input type="radio" value="Pending" class="btn" name="status" />Pending
<input type="radio" value="Held" class="btn" name="status" />Held
</div>
<hr />             

								<table style="margin-left: 25px;" id="tbl1" class="table table-condensed" cellpadding="10" cellspacing="10">
								<tr><td colspan="3">
                            					
                            					
                            				<input type="text" name="summary" class="form-control"  value="<%=sch_list.get(0).getSummary()%>" onclick="this.select();" /></td>	
                            					
                            				</td>
                            				</tr>
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td>
               										<td>
<input type="date" name="scheduledate" class="form-control"  value="<%=sch_list.get(0).getScheduledt()%>" onclick="this.select();" /></td>
						<td>
						</td>
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
																	<option value=<%=cust_list.get(i).getCustomerid()%><%if(Integer.toString(cust_list.get(i).getCustomerid()).equals(Integer.toString(sch_list.get(0).getCustomerid()))){ %> selected<%} %>><%=cust_list.get(i).getCustomername() %></option>
																<%} %>
															</select>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td>
						<select name="category" class="form-control" >
						<option disabled selected></option>
						
							
							<option value="inbound" selected>Inbound</option>
							<option value="outbound">Outbound</option>
						
						</select></td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority" class="form-control" >
	                            						<option disabled selected></option>
	                            						
	                            							<option value="Highest" selected>Highest</option>
	                            							<option value="Middle" >Middle</option>
	                            							<option value="Lowest" >Lowest</option>
	                            							
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="view"  cellpadding="10" class="table table-condensed" cellspacing="10" style="border-spacing: 100px 100px;">
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
																	<option value=<%=list.get(j).getUserid() %> <%if(Integer.toString(list.get(j).getUserid()).equals(Integer.toString(sch_list.get(0).getResponsible()))){ %> selected<%} %>><%=list.get(j).getUsername()%></option>
																<%} %>
                            	</select>
                            	</td><td></td>
                            </tr>
											
												<tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phone" class="form-control"  value="<%=sch_list.get(0).getPhone() %>" onclick="this.select();" /></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="mobile1" class="form-control"  value="<%=sch_list.get(0).getMobile1()%>" onclick="this.select();" /></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" class="form-control"  name="mobile2" value="<%=sch_list.get(0).getMobile2()%>" onclick="this.select();" /></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea class="form-control" style="width: 95% !important;" rows="5" onclick="this.select();" name="description" placeholder="Description"><%=sch_list.get(0).getDescription() %></textarea><input type="hidden" name="hid" value="editschedulecall"/><input type="hidden" value="<%=edit_schedule_id %>" name="scheduleid"/></td>
									
								</tr>
								
							</table>
	</form>
			 			</div>
						                      
                        </div>

               </div>   
                       
</div>
</div>
</div>
</div>


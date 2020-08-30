
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.Lead_model"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  
  function CreateLead(){
	  window.location.assign("NewHome.jsp?p=Lead");
  }
  
  function editLead(edit_id) {
	window.location.assign("NewHome.jsp?p=EditLead&id="+edit_id+"");
}
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		var redirectUrl="DeleteServ?d_id="+id;
		if(conf){
			window.location.assign("SaleDeleteServ?action=lead&?dv_d=5&id="+id+"");
		}
			
	}
 
  </script>
</head>
<%
	String info_id=request.getParameter("id");
	AddInsertDao sd_obj= new AddInsertDaoImp();
	ArrayList<Lead_model> l_list=sd_obj.LeadInfo(Integer.parseInt(info_id));
%>
  <div class="row-fluid">

                        <div class="span8">
                         <div class="head clearfix">
                        		<h1>&nbsp;&nbsp;&nbsp;Lead Information</h1>
                       		 </div>
                        <div class="block">                       
							&nbsp;&nbsp;&nbsp;<input type="submit" class="form-control btn btn-primary text-center"  value="Edit" style="width: 56px; height: 30px" onclick="editLead(<%=info_id %>);" /><input type="submit" class="form-control btn btn-primary text-center"  value="create" style="margin-left:15px;width:56px;height:30px;" onclick="CreateLead();" />
							
							<hr />    
                                           
                         
						 <span style="font-size: 16px;margin-left: 90%;"><%=l_list.get(0).getStage() %></span><br />
				&nbsp;&nbsp;&nbsp;<Span style="font-size: 25px;"><%=l_list.get(0).getSubject() %></Span><br /><br />
								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Date</td><td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getLeaddt() %></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Customer</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int cust_id=l_list.get(0).getCustomerid();
			                                    		List<customer_model> cu_lst=sd_obj.viewCustomerBycustid(cust_id);
														%><%=cu_lst.get(0).getCustomername() %>
														</td>
														</tr>
														 <tr>
                            						
               										<td>Contact Name</td><td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getContactname()%></td><td></td>
                            						</tr>
                            						<tr>
														<td>Title</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%
														int ttl=l_list.get(0).getTitleid();
			                                    		String title=sd_obj.getTitle(ttl);
														%><%=title %>
														</td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td style="border-left: 1px solid #cdcdcd;">
					<%
						int cat_id=l_list.get(0).getCategoryid();
						String category=sd_obj.getCategory(cat_id);
					%><%=category %>
					</td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td style="border-left: 1px solid #cdcdcd;">
                            					<%=l_list.get(0).getPriority() %>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="phn" cellpadding="10" class="table table-condensed" cellspacing="10" style="border-spacing: 100px 100px;">
											
											<tr>
                            					<td>Address</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getAddress() %></td>
                            				</tr>
                            				<tr>
                            					<td>Email</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getEmail() %></td>
                            				</tr>
                            				<tr>
                            					<td>Fax</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getFax_no()%></td>
                            				</tr>
												<tr>
                            					<td>Phone No</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getPhone() %></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile No(1)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getMobile1() %></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile No(2)</td>
                            					<td style="border-left: 1px solid #cdcdcd;"><%=l_list.get(0).getMobile2() %></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								
							</table>
		     			&nbsp;&nbsp;&nbsp;	Description
									<%=l_list.get(0).getDescription() %><br /><br ><br /><br />
								
								
		            </div>
					</div>
               </div>   

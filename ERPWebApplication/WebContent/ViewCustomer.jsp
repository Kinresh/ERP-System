
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.company_model"%>
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
  function createCustomer(){
	  window.location.assign("NewHome.jsp?p=Customer");
  }
  
  function editCustomer(e_id) {
		window.location.assign("NewHome.jsp?p=EditCustomer&id="+e_id+"");
	}
	 
 
  </script>
</head>

<%
	String cust_id=request.getParameter("id");
	System.out.print("------id--------"+cust_id);
	AddInsertDao aa= new AddInsertDaoImp();
	List<customer_model> cust_list=aa.viewCustomerDetail(cust_id);
	String iscompany=cust_list.get(0).getIs_company();
	%>
  
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box" style="width:1000px">
                                      <div class="block">                       
                        		<h1>Customers /<%=cust_list.get(0).getCustomername() %></h1>
                       		 </div>
                        <div class="block">                       
						<input type="submit" class="form-control btn btn-primary text-center"  value="Edit" style="width: 56px; height: 30px" onclick="editCustomer(<%=cust_id%>);"  />&nbsp&nbsp<input type="submit" class="form-control btn btn-primary text-center"  value="Create"  style="width: 56px; height: 30px" style="margin-left:15px;" onclick="createCustomer();" /><hr />             
						 <br />
							<table  id="tbl1" class="table table-condensed">
								<tr>
									<td>
										<table id="tbl2"  cellpadding="8" cellspacing="8" class="table table-condensed">
										<tr>
                            		<td>Name</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%=cust_list.get(0).getCustomername() %>				
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Email</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            		<%=cust_list.get(0).getEmailid() %>						
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Website</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%=cust_list.get(0).getWebsite() %>					
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Fax</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%=cust_list.get(0).getFaxno() %>					
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td></td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            								
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile(1)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%=cust_list.get(0).getMobile1() %>					
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile(2)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%=cust_list.get(0).getMobile2()%>					
                            		</td>
                           		 </tr>	
											 
                            	
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
									
										<table id="tbl3" cellpadding="8" cellspacing="8"  class="table table-condensed">
																				<%
                           		 	if(iscompany.equals("Y")){
                           		 %>	
										<tr>
                            		<td>Company</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
												List<company_model> comp_list=aa.viewcompanydetail(cust_list.get(0).getCompanyid());
												
			                   					String company=comp_list.get(0).getCompanyname();
			                   				%>		
			                   				<%=company %>
                            				</td>
                           		 </tr>	
                            <%} %>
                              <tr>
                            		<td>Address</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            		<%=cust_list.get(0).getAddress() %>		
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>City</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%
                            				int c=cust_list.get(0).getCityid(); 
                               				String City=aa.getCity(c);
                            				%><%=City %>				
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>State</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%
                            				int st=cust_list.get(0).getSid();
                            				String State=aa.getState(st);
                            				%><%=State %>				
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>Country</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%
                            					int cnt=cust_list.get(0).getCid();
                            					System.out.print("countryid----------------"+cnt);
                            					String Country=aa.getCountry(cnt);
                            					System.out.print("country----------------"+Country);
                            				%><%=Country %>			
                            		</td>
                           		 </tr>	
                           		   <%
                           		 	if(iscompany.equals("Y")){
                           		 %>	
                           		 <tr>
                            		<td>Job Position</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=cust_list.get(0).getJobposition() %>	
                            		</td>
                           		 </tr>
                           		 <%
                           		 }
                           		 	else{%>
                           		 	<tr style="display:none;"><td></td><td><br></td></tr>
                           		 	
                           		 	
                           		 	<% 
                           		 	}
                           		  %>
                           		 <tr>
                            		<td>Title</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            			<%
                            					int tit=cust_list.get(0).getTitleid(); 
                            					String title=aa.getTitle(tit);
                            				%><%=title %>
                            		</td>
                           		 </tr>	
                           		
                           		 	
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="8">
										<table id="tbl4" cellspacing="8" cellpadding="8" class="table table-condensed" >
										<tr>
                            		<td>Description</td>
                            		<td><%=cust_list.get(0).getDescription() %></td>	
                            	
                           		 </tr>		
                            	
                           
                             
										</table>
									
							</table>
		     	
		            </div>
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					
               </div>   

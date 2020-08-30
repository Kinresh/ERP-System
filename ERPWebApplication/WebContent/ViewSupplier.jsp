
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>

<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.SuppCompany_model"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>

<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  
  function deleteConform(id){
		var conf=confirm("Are you sure want to remove Record?");
		/* if(conf){
			window.location.assign("SaleDeleteServ?action=customer&?dv_d=5&id="+id+"");
		} */
  }
  function createSupplier(){
	  window.location.assign("NewHome.jsp?p=AddSupplier");
  }
  
  function editSupplier(edit_id) {
	window.location.assign("NewHome.jsp?p=EditSupplier&id="+edit_id+"");
}
 
  
  </script>
</head>
<%
	String info_id=request.getParameter("id");
    PurchaseDao ps=new PurchaseDaoImp();
	ArrayList<Supplier_model> s_lst=ps.viewSupplierInfo(Integer.parseInt(info_id));
	String iscompany=s_lst.get(0).getIs_company();
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
                        		<h1>Suppliers /<%=s_lst.get(0).getSuppliername() %></h1>
                       		 </div>
                        <div class="block">                       
							<input type="submit" class="form-control btn btn-primary text-center"  value="Edit" style="width: 56px; height: 30px" onclick="editSupplier(<%=info_id%>);"  />&nbsp&nbsp<input type="submit" class="form-control btn btn-primary text-center"  value="Create"  style="width: 56px; height: 30px" style="margin-left:15px;" onclick="createSupplier();" /><hr />             
						 
						 <br />
							<table style="margin-left: 50px;" class="table table-condensed" id="tbl1" cellpadding="8" cellspacing="8" align="center">
								<tr>
									<td>
										<table id="tbl2"  class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
										<tr>
                            		<td>Name</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getSuppliername() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Email</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getEmailid() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Website</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getWebsite() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Fax</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getFaxno()%>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Phone-No</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getPhone() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile NO(1)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getMobile1() %>		
                            		</td>
                           		 </tr>
                           		 <tr>
                            		<td>Mobile No(2)</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getMobile2()%>		
                            		</td>
                           		 </tr>	
											 
                            	
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8" class="table table-condensed" cellspacing="8" style="border-spacing: 100px 100px;">
										<%
                           		 	if(iscompany.equals("Y")){
                           		 %>	
										<tr>
                            		<td>Company</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					String company;
                            					String co_id=Integer.toString(s_lst.get(0).getSuppcompanyid());
                            					if(co_id.equals("0")){
                            						company="No Company";
                            					}
                            					else{
                            					List<SuppCompany_model> comp_list=ps.viewcompanybysuppcompid(s_lst.get(0).getSuppcompanyid());
                            					company=comp_list.get(0).getCompanyname();
                            					}
                            				%>		
                            				<%=company %>
                            		</td>
                           		 </tr>	
                              <%} %>
                              <tr>
                            		<td>Address</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getAddress() %>	
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>City</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            				int c=s_lst.get(0).getCityid(); 
                            				AddInsertDao d_obj= new AddInsertDaoImp();
                            				String City=d_obj.getCity(c);
                            				%><%=City %>		
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>State</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            				int st=s_lst.get(0).getSid();
                            				String State=d_obj.getState(st);
                            				%><%=State %>		
                            		</td>
                           		 </tr>	
                           		 <tr>
                            		<td>Country</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					int cnt=s_lst.get(0).getCid();
                            					String Country=d_obj.getCountry(cnt);
                            				%><%=Country %>		
                            		</td>
                           		 </tr>	
                           		  <%
                           		 	if(iscompany.equals("Y")){
                           		 %>	
                           		 <tr>
                            		<td>Job Position</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%=s_lst.get(0).getJobposition() %>	
                            		</td>
                           		 </tr>
                           		
                           		 <tr>
                           		 	 <%
                           		 }
                           		 	else{%>
                           		 	<tr><td></td><td><br></td></tr>
                           		 <% 
                           		 	}
                           		  %>
                           		 
                            		<td>Title</td>
                            		<td style="border-left: 1px solid #cdcdcd;">
                            				<%
                            					int ttl=s_lst.get(0).getSupptitleid(); 
                            					PurchaseDao sd_obj=new PurchaseDaoImp();
                            					String title=sd_obj.getTitle((ttl));
                            				%><%=title %>
                            		</td>
                           		 </tr>	
                           	                           		
                           
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" class="table table-condensed" cellspacing="8" cellpadding="8" style="border-spacing: 100px 100px;">
										<tr>
                            		<td>Internal Note</td>
                            		<td>
                            				<%=s_lst.get(0).getDescription() %>	
                            		</td>
                           		 </tr>		
                            	
                           
                             
										</table>
									
							</table>
		     	
		            </div>
					</div>
               </div>   

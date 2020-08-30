<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Model.PurchaseManagement.Product_model"%>

<%
	String p_id=request.getParameter("id");
	PurchaseDao prod= new PurchaseDaoImp();
	ArrayList<Product_model> p_list=prod.viewProductInfo(Integer.parseInt(p_id));
%>
 <script type="text/javascript">
  function addprod(){
	  window.location.assign("NewHome.jsp?p=AddProducts");
  }
  
  function EditProduct(edit_id) {
	window.location.assign("NewHome.jsp?p=EditProduct&id="+edit_id+"");
}
 
  </script>
 <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box" style="width:700px">
                        <div class="block">   
                       
                        		<h1>Products/<%=p_list.get(0).getProduct() %></h1>
                       		 </div>
                                          
							<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px"  value="Edit" onclick="EditProduct(<%=p_id%>);" />&nbsp;
							<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Add" style="margin-left:15px;" onclick="addprod();" />
							
							
							<hr />             
						 <br />
						
				<Span style="font-size: 25px;"><%=p_list.get(0).getProductType()%></Span><br /><br />
								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="10" cellspacing="10">
						
											 <tr>
                            						
               										<td>Product Category</td><td style="border-left: 1px solid #cdcdcd;"><%=p_list.get(0).getProductCategory()%></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Product&nbsp;&nbsp;&nbsp;</td>
														<td style="border-left: 1px solid #cdcdcd;">
														<%=p_list.get(0).getProduct() %>
														</td>
														</tr>
														  
                            
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										
									</td>
								</tr>
									
							<tr>
									<td colspan="4">
										<table id="tbl4" cellspacing="8" cellpadding="8" class="table table-condensed" >
										<tr>
                            		<td>Description</td>
                            		<td><%=p_list.get(0).getDescription() %></td>	
                            	
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
               

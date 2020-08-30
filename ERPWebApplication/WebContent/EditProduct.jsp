<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Model.PurchaseManagement.ProductCategory_model"%>
 <%@page import="Model.PurchaseManagement.Product_model"%>

<%
	String p_id=request.getParameter("id");
	PurchaseDao prod= new PurchaseDaoImp();
	ArrayList<Product_model> p_list=prod.viewProductInfo(Integer.parseInt(p_id));
	String url="UserController?action=ViewProduct&id="+p_id;
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
                                 <form action="PurchaseUpdateController" method="post" name="prod_update_form" >
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box" style="width:600px">
                        <div class="block">   
                       
                        		<h1>Edit Products/<%=p_list.get(0).getProduct() %></h1>
                        			                       
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or
						    <a href='<%= url%>'style="margin-left:10px;" >Cancel</a><hr />
                       		
							
							<hr />             
						 <br />
						
						 <%
						String ptype=prod.getProductType(p_list.get(0).getProd_categoryid());
						 
						 
						 %>
				
								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
								<%
								
							
								String ty2=p_list.get(0).getProductType();
								
								%>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="10" cellspacing="10">
											<tr><td>Product Type</td><td><select  class="form-control" name="prodtype" ><option value="Stockable"<% if(ty2.equalsIgnoreCase("Stockable")) {%>selected <%}%>>Stockable</option><option value="Service" <% if(ty2.equalsIgnoreCase("Service")) {%>selected <%}%>>Service</option></select></td></tr>
											 <tr>
                            					<td>Product Category</td>
                            					<td><select  class="form-control" name="prodcategory">
                            							<option disabled selected>--select category--</option>
                            							<%
                            								ProductCategory_model co= new ProductCategory_model();
                            								GenericsDao<ProductCategory_model> gc= new GenericsImp<ProductCategory_model>();
                            								List<ProductCategory_model> comp_list=gc.viewData(co);
            			                   						
                            								for(int i=0;i<comp_list.size();i++)
                            								{
                            							%>
                            								<option value='<%=comp_list.get(i).getProduct_category()%>' <%if(Integer.toString(comp_list.get(i).getProd_categoryid()).equalsIgnoreCase(Integer.toString(p_list.get(0).getProd_categoryid()))){ %> selected<%} %>><%=comp_list.get(i).getProduct_category()%></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					 <td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;"  href="AddCategory.jsp" value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            							<tr>
														<td>Product&nbsp;&nbsp;&nbsp;</td>
														<td style="border-left: 1px solid #cdcdcd;">
														
														<input type="text" name="product" class="form-control" value='<%=p_list.get(0).getProduct() %>'>
														</td>
														</tr>
														  
                            
                          
                            	<table id="tbl4" cellspacing="5" cellpadding="5" border="0"  class="table table-condensed" style="border-spacing: 100px 100px;">	
								<tr>
                          			

                          		</tr>
                          	
                          		
									
                          			<tr>
                           	<td colspan="4">Internal Note
                           <textarea rows="3" cols="20" class="form-control" name="description" onfocus="this.select();"><%=p_list.get(0).getDescription() %></textarea></td>
                           	</tr>
                              <tr>
                            	<td><input type="hidden" value="EditProduct" name="hid" /><input type="hidden" value='<%=p_id %>' name="prodid"/></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									
							</table>
							</td>
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
               
               </div>
               

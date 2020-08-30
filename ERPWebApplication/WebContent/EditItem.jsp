<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Model.PurchaseManagement.ProductCategory_model"%>
 <%@page import="Model.PurchaseManagement.Product_model"%>
  <%@page import="Model.PurchaseManagement.Item_model"%>
  <%@page import="Model.PurchaseManagement.Item_Size_model"%>

<%
	String i_id=request.getParameter("id");
	PurchaseDao prod= new PurchaseDaoImp();
	ArrayList<Item_model> i_list=prod.viewItemInfo(Integer.parseInt(i_id));
	String url="UserController?action=ViewItem&id="+i_id;
%>
 <script type="text/javascript">
  function addprod(){
	  window.location.assign("NewHome.jsp?p=AddProducts");
  }
  
  function EditProduct(edit_id) {
	window.location.assign("NewHome.jsp?p=EditProduct&id="+edit_id+"");
}
 
  </script>
  <script type="text/javascript">


  var xmlHttp  
  var xmlHttp 
  function f1(str)
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
      var url="AddSize";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      go();
     
      
  }

  function stateChange(){
  	
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("size").innerHTML=xmlHttp.responseText   
      }   
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
                                    <div class="table-box" style="width:800px">
                        <div class="block">   
                       
                        		<h1>Edit Items/<%=i_list.get(0).getItem() %></h1>
                        			                       
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or
						    <a href='<%= url%>'style="margin-left:10px;" >Cancel</a><hr />
                       		
							
							<hr />             
						 <br />
						
						 <%
						String ptype=prod.getProductType(i_list.get(0).getProd_categoryid());
						 
						 
						 %>
				
								<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10" align="center">
								
								<tr>
								<%
								
							
								String ty2=i_list.get(0).getProductType();
								
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
                            								<option value='<%=comp_list.get(i).getProduct_category()%>' <%if(Integer.toString(comp_list.get(i).getProd_categoryid()).equalsIgnoreCase(Integer.toString(i_list.get(0).getProd_categoryid()))){ %> selected<%} %>><%=comp_list.get(i).getProduct_category()%></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					<td><input type="button" class="form-control text-center"
											 style="width: 33px; height: 34px"
											value="+" onclick="addcompany()" > </td>
								
                            				</tr>
                            				 <tr>
                            					<td>Product</td>
                            					<td><select  class="form-control" name="product">
                            							<option disabled selected>--select product --</option>
                            							<%
                            							GenericsDao<Product_model> gc2= new GenericsImp<Product_model>();
                            								Product_model po= new Product_model();
                            								GenericsDao<Product_model> pc= new GenericsImp<Product_model>();
                            								List<Product_model> p_list=gc2.viewData(po);
            			                   						
                            								for(int i=0;i<p_list.size();i++)
                            								{
                            							%>
                            								<option value='<%=p_list.get(i).getProductid()%>' <%if(Integer.toString(p_list.get(i).getProductid()).equalsIgnoreCase(Integer.toString(i_list.get(0).getProductid()))){ %> selected<%} %>><%=p_list.get(i).getProduct()%></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					 <td><input type="button" class="form-control" style="width:34px;height:32px;"   value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            							<tr>
														<td>Item&nbsp;&nbsp;&nbsp;</td>
														<td style="border-left: 1px solid #cdcdcd;">
														
														<input type="text" name="item" class="form-control" value='<%=i_list.get(0).getItem() %>'>
														</td>
														</tr>
													<%
													if(i_list.get(0).getProductType().equalsIgnoreCase("Stockable"))
															{%>
															<tr><td><input type="button" class="form-control btn btn-primary text-center" style="width:45px;height:30px;" value="Size" onClick="f1(<%=i_list.get(0).getItemid()%>)"></td>
															</tr>
															<tr id='size'></tr>
														<%	}
													else if(i_list.get(0).getProductType().equalsIgnoreCase("Service")){
															
													%>
															
															<tr style="display:none;" ></tr>
															<tr style="display:none;" ></tr>
															<%} %>
															
																  
                            
                          
                            	<table id="tbl4" cellspacing="5" cellpadding="5" border="0"  class="table table-condensed" style="border-spacing: 100px 100px;">	
								<tr>
                          			

                          		</tr>
                          	
                          		
									
                          			<tr>
                           	<td colspan="4">Internal Note
                           <textarea rows="3" cols="20" class="form-control" name="description" onfocus="this.select();"><%=i_list.get(0).getDescription() %></textarea></td>
                           	</tr>
                              <tr>
                            	<td><input type="hidden" value="EditItem" name="hid" /><input type="hidden" value='<%=i_id %>' name="iid"/></td>
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
               

<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Model.PurchaseManagement.ProductCategory_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

  <script type="text/javascript">
  function validation()
  {
		var p_id=document.product_form.prodcategotyid.selectedIndex;
		if(p_id==0){
			alert("Select the Category");
			document.product_form.prodcategotyid.focus();
			return false;
		}
		
		var com_name=document.product_form.product;
		if(com_name.value=="")
			{
				alert("Please Enter the Product.");
				com_name.focus();
				return false;
			}
		
		var desc=document.product_form.description;
		if(desc.value=="")
			{
				alert("Please Enter Description.");
				desc.focus();
				return false;
			}
		return true;
	}
  function exit()
  {
  var a2=document.product_form;
	a2.action="NewHome.jsp?p=Products";
	a2.submit();
  }
  </script>
</head>
  <div class="block">                  
<form name="product_form" method="post" action="PurchaseController"
	 autocomplete='off' >
	 <div class="content-section" style="width: 700px;">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							Product.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save"  onclick="return validation()"  />
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Cancel"  onclick="exit()"  />
									
								</h2>
							
						</header>
						
							<table  class="table table-condensed">
								<tr>
                            		<td>Product Category</td>
                            		<td>
                            						<select name="prodcategotyid" class="form-control">
                            							<option>---Select Category---</option>
                            							<%
                            							ProductCategory_model pc=new ProductCategory_model();
                            							GenericsDao gg=new GenericsImp();
                            							List<ProductCategory_model> ll=gg.viewData(pc);
                            							for(ProductCategory_model pcat:ll)
                            							{
                       									%>
                       									<option value=<%=pcat.getProd_categoryid()%>><%=pcat.getProduct_category() %></option>
                       									<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;"  href="AddCategory.jsp" value="+" data-fancybox-type="iframe"/></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Product</td>
                            <td>
                            	<input type="text" name="product" class="form-control" >
                            </td><td></td>
                            </tr>
                            <tr>
                            <td colspan="3"><textarea rows="5" name="description"  placeholder="Description" style="width: 100%;"></textarea> </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid" value="Addproduct" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   

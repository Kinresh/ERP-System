
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.PurchaseManagement.Product_model"%>


<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
 
  <script type="text/javascript">
  function f1()
  {
  	var a2=document.item_form;
  	a2.action="NewHome.jsp?p=AddSize";
  	a2.submit();
  }
  function validation()
  {
		var p_id=document.item_form.productid.selectedIndex;
		if(p_id==0){
			alert("Select the Product");
			document.item_form.productid.focus();
			return false;
		}
		
		var com_name=document.item_form.item;
		if(com_name.value=="")
			{
				alert("Please Enter the Item.");
				com_name.focus();
				return false;
			}
		
		var desc=document.item_form.description;
		if(desc.value=="")
			{
				alert("Please Enter Description.");
				desc.focus();
				return false;
			}
		return true;
	}
  function addprod(){
	  window.location.assign("NewHome.jsp?p=AddProducts");
  }
  </script>
</head>
  <div class="block">                  
<form name="item_form" method="post" action="PurchaseController"
	 autocomplete='off' >
	 <div class="content-section" style="
    width: 1000px; ">
		<div class="container-liquid" style="align:center;">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							Product Item.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save" onClick="return validation()"   />
								<input type="button" value="Cancel" style="width: 60px; height: 30px" class="form-control btn btn-primary text-center"/>
								</h2>
							
						</header>               
						  <form action="PurchaseController" method="post" name="item_form">
						 	             
						  
							<br />
							<table  cellpadding="5" class="table table-condensed" cellspacing="5">
								<tr>
                            		<td>Product</td>
                            		<td>
                            						<select name="productid" class="form-control" >
                            							<option selected disabled>---Select Product---</option>
                            							<%
                            							Product_model p=new Product_model();
                            							GenericsDao<Product_model> gg=new GenericsImp<Product_model>();
                            							List<Product_model> lp=gg.viewData(p);
                            							for(Product_model pp:lp)
                            							{
                            							%>
                            							<option value=<%=pp.getProductid() %>><%=pp.getProduct() %></option>
                            							<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="form-control text-center" style="width: 34px; height: 32px" value="+" style="margin-left:15px;" onclick="addprod();" /></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Item</td>
                            <td>
                            	<input type="text" class="form-control" name="item" />
                            </td><td>  <input type="button" class="form-control btn btn-primary text-center"  style="width: 45px; height: 30px" value="Size" onClick="f1()"/></td>
                            <td></td>
                            <td></td>
                            </tr>
                          
                            
                            <tr>
                            <td colspan="3"><textarea  class="form-control" rows="5" placeholder="Description" style="width: 96%;" name="description"></textarea> </td>
                            <td></td>
                             <td></td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid" value="AddItem" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   

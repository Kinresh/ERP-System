 

<%@page import="Model.UserManagement.UserModel"%>

<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Dao.Salesmanagement.SalesDaoImp"%>
<%@page import="InterFace.SalesManagement.SalesDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.PurchaseManagement.Item_model"%>
<%@page import="Model.PurchaseManagement.Item_Size_model"%>
  <%@page import="Model.PurchaseManagement.Product_model"%>
   <%@page import="Model.SalesManagement.QuatationSale_model"%>
     <%@page import="Model.SalesManagement.QuatationSaleDetail_model"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.List"%>
<head>
   <style type="text/css">
  	.i_put{width: 100px;}
   </style>
   	<script type="text/javascript">
   			<!--
   			var count = 1;
   			var nRows = 2;
   			
   			function addRow() {
   				
 				var tBody = document.getElementById('theBody');
 				var newRow = document.createElement('tr');
 				var col1 = document.createElement('td');
 				
 				var col2 = document.createElement('td');
 				
 				var col3 = document.createElement('td');
 				var col4 = document.createElement('td');
 				var col5 = document.createElement('td');
 				var col6 = document.createElement('td');
 				var col7 = document.createElement('td');
 				var col8 = document.createElement('td');
 				var col9 = document.createElement('td');
 				
 				
 				var rA = document.createElement('a');
 				rA.style.color="#335A85";
 				var select = document.createElement('select');
 				select.name="product[]";
 				select.style.width="130px";
 				
 				<%
 				Product_model pr1=new Product_model();
				GenericsDao<Product_model> gp1_obj=new GenericsImp<Product_model>();
				List<Product_model> p1_list=gp1_obj.viewData(pr1);
 				for(int i=0;i<p1_list.size();i++){
 				%>
 				var option = document.createElement("option");
 				option.text = "<%=p1_list.get(i).getProduct()%>";
 				option.value = "<%=p1_list.get(i).getProductid()%>";
 				select.appendChild(option);
 				<%}%>
 				   
 				newRow.setAttribute('id', 'n' + count);
 				var img = document.createElement("IMG");
 				img.setAttribute("src", "img/delete.png");
 				img.style.paddingBottom="10px";
 				img.style.paddingLeft="5px";

   		    	   rA.setAttribute('href', 'javascript:removeRow(\'n' + count + '\');');
 				rA.appendChild(img);
 				var select2 = document.createElement('select');
 				select2.name="item[]";
 				select2.style.width="130px";
 				<%
 				Item_model i1=new Item_model();
				GenericsDao<Item_model> obj=new GenericsImp<Item_model>();
				List<Item_model> i_list=obj.viewData(i1);
 				for(int i=0;i<i_list.size();i++){
 				%>
 				var option = document.createElement("option");
 				option.text = "<%=i_list.get(i).getItem()%>";
 				option.value = "<%=i_list.get(i).getItemid()%>";
 				select2.appendChild(option);
 				<%}%>
 				
   				var element1=document.createElement('input');
   				
   				element1.type="text";
   				element1.name="description[]";
   				element1.style.width="130px";
   				var element2=document.createElement('input');
   				element2.type="text";
   				element2.name="s_date[]";
   				element2.style.width="129px";
   				var element3=document.createElement('input');
   				element3.type="text";
   				element3.name="qnty[]";
   				element3.style.width="129px";
   				element3.value="1.0";
   				var element4=document.createElement('input');
   				element4.type="text";
   				element4.name="u_price[]";
   				element4.style.width="129px";
   				element4.value="0.0"
   				var element5=document.createElement('input');
   				element5.type="text";
   				element5.name="tax[]";
   				element5.style.width="129px";
   			
   				var element6=document.createElement('input');
   				element6.type="text";
   				element6.name="subtotal[]";
   				element6.style.width="129px";
 		 	
   				col1.appendChild(select);
 		 	   	col2.appendChild(select2);
 			  	col3.appendChild(element1);
 			 	col4.appendChild(element2);
 				col5.appendChild(element3);
 				col6.appendChild(element4);
 				col7.appendChild(element5);
 				col8.appendChild(element6);
   				col9.appendChild(rA);
   
   				newRow.appendChild(col1);
   				newRow.appendChild(col2);
   				newRow.appendChild(col3);
   				newRow.appendChild(col4);
   				newRow.appendChild(col5);
   				newRow.appendChild(col6);
   				newRow.appendChild(col7);
   				newRow.appendChild(col8);
   				newRow.appendChild(col9);
   				
   				tBody.appendChild(newRow);
   
   				count++;
   				nRows++;
   	
   			}
   
   			function removeRow(rowId) {
 				var tBody = document.getElementById('theBody');
   				
 				tBody.removeChild(document.getElementById(rowId));
   				nRows--;
   			}
   			-->
   		</script>
   
  <script type="text/javascript">

$(document).ready(function(){
	  $(".eee").focus(function(){
	    $(this).css("border-top","1px solid #DDD");
	  });
	  $(".eee").blur(function(){
	    $(this).css("border-top","none");
	  });
	});

function EditQ(edit_id) {
	window.location.assign("NewHome.jsp?p=EditSaleQuatation&id="+edit_id+"");
}
function getItem(id){
	  var xmlhttp;
	  if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  xmlhttp.onreadystatechange=function()
	    {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	      {
	      document.getElementById("itm").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","PurchaseAjax?value="+id,true);
	  xmlhttp.send();
}

function exit()
{
var a2=document.company_form;
	a2.action="NewHome.jsp?p=SaleQuatations";
	a2.submit();
}

    
 </script>
</head>
             
             	<% 
						//	HttpSession ses=request.getSession();
							//int qqid=(Integer) ses.getAttribute("qid");
							String id=request.getParameter("id");
							int qqid=Integer.parseInt(id);
							System.out.print("iddddddddd="+qqid);
							SalesDao pp=new SalesDaoImp();
							PurchaseDao pu=new PurchaseDaoImp();
							AddInsertDao aa=new AddInsertDaoImp();
							List<QuatationSale_model> quatation=pp.viewSalesQuatationInfo(qqid);
							List<QuatationSaleDetail_model> quatationdetail=pp.viewQuatationSaleDetailInfo(qqid);
							System.out.println("Stauts============"+qqid);
						//	System.out.println("Stauts============"+quatationdetail.get(0).getQuantity());
							
							%>   
                <div class="row-fluid">

           
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;Quotations/<%=quatation.get(0).getPrefix() %><%=qqid %></h1>
                        </div>
                        <div class="block">                  
<header>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px"  value="Edit" onclick="EditQ(<%=qqid%>);" />&nbsp;
	<input type="button" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
	    <form name="company_form" action="EditSaleQuatation" method="post" >
	
</div>




	<hr />

						 	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% if(quatation.get(0).getStatus().equalsIgnoreCase("Cancelled"))
{%>
	
	<input type="submit" class="btn btn-inverse text-center" value="Set to Draft" style="margin-left: 7px;"  name="btnClick">
	
<% }
else if(quatation.get(0).getStatus().equalsIgnoreCase("Draft PO"))
{
	%>

 <input type="submit" class="btn btn-danger" value="Send by Email"  name="btnClick" >
  <input type="button" class="btn btn-danger" value="Print" style="margin-left: 7px;"  name="btnClick" >
 <input type="submit" class="btn btn-inverse text-center" value="Confirm Order" name="btnClick" style="margin-left: 7px;">
 <input type="button" class="btn btn-inverse text-center" value="Cancel" style="margin-left: 7px;"  name="btnClick">
 <% }  
else if(quatation.get(0).getStatus().equalsIgnoreCase("RFQ Sent"))
{
 %>
  <input type="submit" class="btn btn-inverse text-center" value="Send by Email"  name="btnClick" >
  <input type="button" class="btn btn-inverse text-center" value="Print" style="margin-left: 7px;"  name="btnClick" >
 <input type="submit" class="btn btn-danger" value="Confirm Order" name="btnClick" style="margin-left: 7px;">
 <input type="submit" class="btn btn-inverse text-center" value="Cancel" style="margin-left: 7px;"  name="btnClick">
 <% }
%>
 
<div style="margin-left: 65%;">
		<input type="radio" name="status" value="Draft PO" <%if(quatation.get(0).getStatus().equalsIgnoreCase("Draft PO")){ %> checked="checked" <%}else{ %> disabled="disabled" <%} %> />Draft PO
		<input type="radio" name="status" value="RFQ Sent" <%if(quatation.get(0).getStatus().equalsIgnoreCase("RFQ Sent")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />RFQ Sent
		<input type="radio" name="status" value="Sale Order"  <%if(quatation.get(0).getStatus().equalsIgnoreCase("Sale Order")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Sale Order
	
		<input type="radio" name="status" value="Done"  <%if(quatation.get(0).getStatus().equalsIgnoreCase("Done")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Done
		<input type="radio" name="status" value="Cancelled"  <%if(quatation.get(0).getStatus().equalsIgnoreCase("Cancelled")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Cancelled
		
	</div>	











				 	
						 	</hr>



						 	<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">
						 	</br>
						 	<span style="font-size: 20px;"><b>&nbsp;&nbsp;&nbsp;Request for Quotation/<%=quatation.get(0).getPrefix() %><%=qqid %></b></span>
						 	</br></br>
							<table style="margin-left: 25px;"  id="tbl1" cellpadding="10" cellspacing="10">
							
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
										<input type="hidden" value=<%=quatation.get(0).getQuotationsale_id()%> name="qid">
									<tr>
									<td>
										Customer
									</td>
									<td>
										<%
										int sid=quatation.get(0).getCustomer();
										List<customer_model> ls=aa.viewCustomerBycustid(sid);
										%>
										<%=ls.get(0).getCustomername() %>
									</td>
									<td></td>
										<td>Order Date</td>
												<td><%=quatation.get(0).getOrder_dt() %></td>
									
								</tr>
									
                               		
                               		 	
								<tr>
									<td>Customer Reference</td>
									<td><%=quatation.get(0).getCustomer_ref() %></td>
										<td></td>
								<td></td>
									
								</tr>
	
                           		
                           					 
                            				
										</table>
									</td>
									 
									<td>
									
									</td>
								</tr>
													
							</table>
							
		
                      <div class="contents boxpadding">
                                <ul class="nav nav-pills" id="myTab">
                                    <li class="active"><a href="#home" data-toggle="tab">Products</a></li>
                                    <li><a href="#profile" data-toggle="tab">Other Information</a></li>
                                   
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">
                         
                          
                               <table id="theBody" border="4" class="table table-condensed">
                               		<tr style="background-color: #DDD;" >
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Size</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Description</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Schedule Date</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Unit price</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Taxes</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Subtotal</th>
                               			
                               			
                               		</tr>
                               	<%	for(QuatationSaleDetail_model qd:quatationdetail)
                               	{ %>
                              <tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<% int pid=qd.getProduct();
                               				List<Product_model> lp=pu.viewProductInfo(pid);
                               				%>
                               				<%=lp.get(0).getProduct()%>
                               			</td>
                               			<td>
                               				<% int iid=qd.getItem();
                               				List<Item_model> ip=pu.viewItemInfo(pid);
                               				%>
                               				<%=ip.get(0).getItem()%>
                               			</td>
                               			<td>
                               				<% int ssid=qd.getItemsizeid();
                               				System.out.println("----------Sizeid--------"+ssid);
                               				if(ssid!=0)
                               				{
                               					List<Item_Size_model> sl=pu.viewItemSizeBySizeid(ssid);
                               				
                               				%>
                               				<%=sl.get(0).getSize()%>
                               				<%} %>
                               			</td>
                               			<td><%=qd.getDescription() %></td>
                               			<td><%=qd.getSchedule_dt()%></td>
                               			<td><%=qd.getQuantity() %></td>
                               			<td><%=qd.getUnit_price() %></td>
                               			<td><%=qd.getTaxs()%></td>
                               			<td><%=qd.getSubtotal()%></td>
                               		</tr> 
                               		<%} %>
                               		</table>
                               		
                               		                               		
                               		                               			<table>
                               		
                               		                               		</table>
                               		                               		<br /><br /><br /><br />
                               	<div class="dr"><span></span></div>
                               	<div style="margin-left: 850px;font-size: 16px;">
                               	<table >
                               	<tr><td>Untaxted Amount</td><td>:</td><td align="right" style="padding-left: 50px;"><%=quatation.get(0).getUntaxted_amount() %></td></tr>
                               	<tr><td align="right">Taxes</td><td>:</td><td align="right"><%=quatation.get(0).getTaxes() %></td></tr>
                               	<tr><td colspan="3"><hr style="border:1px solid #335A85; "></td></tr>
                               	<tr><td align="right" style="font-size: 20px;"><b>Total</b></td><td>:</td><td align="right" style="font-size: 20px;"><b><%=quatation.get(0).getTotal() %></b></td></tr>
                               	</table>
                               	
                               	</div>
                               
                               
                            </div>                        

                              <div class="tab-pane" id="profile">
                                    
                                    		<table style="margin-left: 25px;" cellpadding="10" class="table table-condensed" cellspacing="10">
							
									<tr>
									<td>
										<table style="border-spacing: 100px 100px;" class="table table-condensed" cellpadding="10" cellspacing="10">
										
									<tr>
									<td>
										SalesPerson
									</td>
									<td style="border-left: 1px solid #cdcdcd;">
										<%
										
										List<UserModel> u_list=pp.viewUserDataByUserid(quatation.get(0).getResponsible());
										if(!u_list.isEmpty())
										{
										%><%=u_list.get(0).getUsername()%><%} %>
									</td>
									
								</tr>
								<tr>
									<td>Payment Term</td>
									<td style="border-left: 1px solid #cdcdcd;"><%=quatation.get(0).getPaymentterm() %></td>
								</tr>
	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table  cellpadding="15" cellspacing="15" class="table table-condensed" style="border-spacing: 100px 100px;">
											<tr>
												<td>Shipping Policy</td>
												<td style="border-left: 1px solid #cdcdcd;"><%=quatation.get(0).getShippingmethod() %>
												</td>
											</tr>
											<tr>
											<td>Create Invoice</td><td style="border-left: 1px solid #cdcdcd;">
												<%=quatation.get(0).getCreateinvoice()%>
											</td>
											</tr>
											
											
                           			
										</table>
                                    </div>

                           
                    </div>
			 			</div>
						                      
                        </div>

               </div>   
                       
</form>

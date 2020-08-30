 
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.Warehouse.delivaryproducts_model"%>
<%@page import="Model.Warehouse.delivaryorders_model"%>
<%@page import="Model.SalesManagement.QuatationSale_model"%>
<%@page import="Dao.Salesmanagement.SalesDaoImp"%>
<%@page import="InterFace.SalesManagement.SalesDao"%>
<%@page import="Model.PurchaseManagement.Quatation_model"%>
<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.Item_model"%>
<%@page import="Model.PurchaseManagement.Item_Size_model"%>

  <%@page import="Model.PurchaseManagement.Product_model"%>
   <%@page import="Model.PurchaseManagement.IncomingShippment_model"%>
     <%@page import="Model.PurchaseManagement.IncomingProduct_model"%>
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
function redirect(id)
{
	var f=document.company_form;
	
	f.action="NewHome.jsp?p=Receive&id="+id;
	f.submit();
	
}


    
 </script>
</head>
                <div class="row-fluid">

               <form name="company_form" action="SalesUpdateController" method="post" >
               <% 
               				String id=request.getParameter("saleid");
							int poid=Integer.parseInt(id);
							System.out.println("-----------------------------poid="+poid);
							SalesDao pp=new SalesDaoImp();
							List<QuatationSale_model> lq=pp.viewQuatationInfo(poid);
							List<delivaryorders_model> quatation=pp.viewDelivaryOrderInfo(poid);
							System.out.println("------------------------------delivarorderid"+quatation.get(0).getDelivaryorder_id());
							List<delivaryproducts_model> quatationdetail=pp.viewDelivaryProductInfo(quatation.get(0).getDelivaryorder_id());
							System.out.println("-------Status-----------"+quatation.get(0).getStatus());
							%>
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;Sales Or.../<%=lq.get(0).getPrefix()%><%=lq.get(0).getQuotationsale_id()%><%=quatation.get(0).getPrefix() %><%=quatation.get(0).getDelivaryorder_id()%></h1>
                        </div>
                        <div class="block">                  
<header>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Edit"/>&nbsp;<input type="button"
									class="form-control btn btn-primary text-center"
								style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
									
</div>

</br>
</br>
</br>


<% if(quatation.get(0).getStatus().equalsIgnoreCase("Waiting Availability"))
{ %>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
  
  <input type="submit" class="btn btn-danger text-center" style="width:125px;height:32px;" name="hid" value="Check Availability" /></td>
    <input type="button" class="btn btn-danger text-center various fsv-update" style="width:125px;height:32px;" href="Receive.jsp?id=<%=quatationdetail.get(0).getDelivaryorder_id()%>" value="Force Availability" data-fancybox-type="iframe"/></td>
<input type="submit" class="btn btn-inverse text-center"  style="width: 120px; height: 30px" value="Cancel Transfer"/>
 <%} else if(quatation.get(0).getStatus().equalsIgnoreCase("Ready to Receive")) {%>   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" class="btn btn-danger text-center various fsv-update" style="width:68px;height:32px;" href="SaleProduct.jsp?id=<%=quatationdetail.get(0).getDelivaryorder_id()%>" value="Deliver" data-fancybox-type="iframe"/></td>
       
        <input type="submit" class="btn btn-inverse text-center"  style="width: 120px; height: 30px" value="Cancel Transfer"/>
 
        <%} %>
   
    
        
  



<div style="margin-left: 65%;">
		<input type="radio" name="status" value="Draft PO" <%if(quatation.get(0).getStatus().equalsIgnoreCase("Draft")){ %> checked="checked" <%}else{ %> disabled="disabled" <%} %> />Draft
			<input type="radio" name="status" value="Waiting Availability"  <%if(quatation.get(0).getStatus().equalsIgnoreCase("Waiting Availability")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Waiting Availability
		<input type="radio" name="status" value="Ready to Receive" <%if(quatation.get(0).getStatus().equalsIgnoreCase("Ready to Receive")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Ready to Receive
	
		<input type="radio" name="status" value="Delivered"  <%if(quatation.get(0).getStatus().equalsIgnoreCase("Delivered")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Delivered
		
		
	</div>	














				 	
						 	<hr />   
						 	 	<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">
						 	</br>
						 	<span style="font-size: 20px;"><b>&nbsp;&nbsp;&nbsp;<%=quatation.get(0).getPrefix() %><%=quatation.get(0).getDelivaryorder_id()%></b></span>
						 	</br></br>
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10"  cellspacing="10">
							
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
										<input type="hidden" name="sid" value=<%=quatation.get(0).getDelivaryorder_id()%>>
										<input type="hidden" name="s_id" value=<%=quatation.get(0).getSalesorder_id()%>>
									<tr>
									<td>
											Customer
									</td>
									<td>
										<%
										int sid=quatation.get(0).getCusomer();
										List<customer_model> ls=pp.viewcustomerycid(sid);
										%>
										<%=ls.get(0).getCustomername() %>
									</td>
									
									
									
												</tr><tr><td></td><td></td><td></td><td></td>
												<td>Creation Date  </td>
												<td><%=quatation.get(0).getOrder_dt() %></td></tr>
												<tr><td></td><td></td><td></td><td></td><td>Scheduled Time </td>
												<td><%=quatationdetail.get(0).getSchedule_dt()%></td></tr>
												<tr><td></td><td></td><td></td><td></td>
												<td>Source Document </td>
												<td><%=lq.get(0).getPrefix()%><%=lq.get(0).getQuotationsale_id() %></td>
												</tr>
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
                                    <li><a href="#profile" data-toggle="tab">Additional Info</a></li>
                                   
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">
                         
                            <form action="PurchaseStuff" name="q_detail" method="post">
                               <table id="theBody" border="4" class="table table-condensed">
                               		<tr style="background-color: #DDD;" >
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Size</th>
                               			
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Status</th>
                               			
                               			
                               		</tr>
                               	<%	for(delivaryproducts_model qd:quatationdetail)
                               	{ %>
                              <tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<%
                               				PurchaseDao p1=new PurchaseDaoImp();
                               				int pid=qd.getProduct();
                               					List<Product_model> lp=p1.viewProductInfo(pid);
                               				%>
                               				<%=lp.get(0).getProduct()%>
                               			</td>
                               			<td>
                               				<% int iid=qd.getItem();
                               					List<Item_model> ip=p1.viewItemInfo(pid);
                               				%>
                               				<%=ip.get(0).getItem()%>
                               			</td>
                               					<td>
                               				<% int ssid=qd.getItemsizeid();
                               				System.out.println("----------Sizeid--------"+ssid);
                               				if(ssid!=0)
                               				{
                               					List<Item_Size_model> sl=p1.viewItemSizeBySizeid(ssid);
                               				
                               				%>
                               				<%=sl.get(0).getSize()%>
                               				<%} %>
                               			</td>
									
                               			<td><%=qd.getQuantity()%></td>
                               			<td><%=qd.getStatus() %></td>
                               			
                               		</tr> 
                               		<%} %>
                               		</table>
                               		
                               		                               		
                               		                               			<table>
                               		
                               		                               		</table>
                               		                               		<br /><br /><br /><br />
                               	<div class="dr"><span></span></div>
                               
                               
                               </form>
                            </div>                        

                              <div class="tab-pane" id="profile">
                                    
<table class="oe_form_group " border="0" cellpadding="0" cellspacing="0"><tbody><tr class="oe_form_group_row">
    

      <td style="width:43%"> Delivery Method
    </td><td colspan="1" class="oe_form_group_cell" width="99%"><span class="oe_form_field oe_form_field_selection oe_form_required">
  <%=quatation.get(0).getDeliverymethod() %>
</span></td></tr>
<tr></tr>
<tr></tr><tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell oe_form_group_cell_label" width="1%">
        Auto-Picking 
    </td><td colspan="1" class="oe_form_group_cell" width="99%"><span class="oe_form_field oe_form_field_selection">
   <input type="checkbox" disabled="disabled">
</span></td></tr>              
                               </table> 
                                    </div>

                           
                    </div>
			 			</div>
						                      
                        </div>

               </div>   
                       


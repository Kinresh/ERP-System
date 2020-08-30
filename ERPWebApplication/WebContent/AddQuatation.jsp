 
<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.Item_model"%>
  <%@page import="Model.PurchaseManagement.Product_model"%>
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
   			var col33;
   			function addRow() {
   				
 				var tBody = document.getElementById('theBody');
 				var newRow = document.createElement('tr');
 				var col1 = document.createElement('td');
 				
 				var col2 = document.createElement('td');
 				col2.id="itm"+count;
 				col33 = document.createElement('td');
 				col33.id="size"+count;
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
 				select.style.width="120px";
 				select.style.height="30px";
 				select.onchange=function getItem(){
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
					      document.getElementById(col2.id).innerHTML=xmlhttp.responseText;
					      }
					    };
					  xmlhttp.open("post","AjaxItem?action=getItem&value="+this.value,true);
					  xmlhttp.send();
				};
				var foption=document.createElement("option");
				foption.text="";
				foption.value="-1";
				select.appendChild(foption);
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
 				img.setAttribute("src", "image/delete.png");
 				img.style.paddingBottom="10px";
 				img.style.paddingLeft="5px";

   		    	   rA.setAttribute('href', 'javascript:removeRow(\'n' + count + '\');');
 				rA.appendChild(img);
 				
   				var element1=document.createElement('input');
   				
   				element1.type="text";
   				element1.name="description[]";
   				element1.style.width="120px";
   				element1.style.height="30px";
   				var element2=document.createElement('input');
   				element2.type="date";
   				element2.name="s_date[]";
   				element2.style.width="129px";
   				element2.style.height="30px";
   				var element3=document.createElement('input');
   				element3.type="text";
   				element3.name="qnty[]";
   				element3.style.width="129px";
   				element3.value="1.0";
   				element3.style.height="30px";
   				var element4=document.createElement('input');
   				element4.type="text";
   				element4.name="u_price[]";
   				element4.style.width="129px";
   				element4.value="0.0"
   				element4.style.height="30px";
   				var element5=document.createElement('input');
   				element5.type="text";
   				element5.name="tax[]";
   				element5.style.width="129px";
   				element5.style.height="30px";
   			
   				var element6=document.createElement('input');
   				element6.type="text";
   				element6.name="subtotal[]";
   				element6.style.width="129px";
   				element6.style.height="30px";
   				col1.appendChild(select);
 		 	   	
 			  	col3.appendChild(element1);
 			 	col4.appendChild(element2);
 				col5.appendChild(element3);
 				col6.appendChild(element4);
 				col7.appendChild(element5);
 				col8.appendChild(element6);
   				col9.appendChild(rA);
   
   				newRow.appendChild(col1);
   				newRow.appendChild(col2);
   				newRow.appendChild(col33);
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
   <script>
   
   function validation(){
		var s_name=document.Quatation_form.supplier.selectedIndex;
		if(s_name==0){
			alert("Select the supplier.");
			document.Quatation_form.supplier.focus();
			return false;
		}
		
	   		
		return true;
	}
   function  validateConfirmOrder()
   {
	   var f=validation();
	   if(f)
		   {
	   alert("You cannot confirm a purchase order without any purchase order line. ");
		   }
	   
	   
   }
 
   function exit()
   {
   var a2=document.Quatation_form;
 	a2.action="NewHome.jsp?p=Quatations";
 	a2.submit();
   }
   
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


function getSize(id){
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
			      document.getElementById(col33.id).innerHTML=xmlhttp.responseText;
			      }
			    };
			  xmlhttp.open("post","AjaxItem?action=getSize&value="+id,true);
			  xmlhttp.send();
		  
	  }

    
 </script>
</head>
                <div class="row-fluid">

               <form name="Quatation_form" action="PurchaseStuff" method="post"  >
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp; Quotations/New</h1>
                        </div>
                        <div class="block">                  
  <div class="block">                  
<header>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Save" name="btnClick" onClick="return validation()" />&nbsp;&nbsp;<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
</div>




	<hr />
	   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-inverse text-center"  style="width: 100px; height: 30px" name="btnClick" value="Send By Email"  onclick="return validation();"/>
    
        
        <input type="submit" class="btn btn-inverse text-center"  style="width: 56px; height: 30px" value="Print" name="btnClick" onclick="return validation();"/>
       
        
    <input type="button" class="btn btn-inverse text-center"  style="width: 110px; height: 30px" name="btnClick" value="Confirm Order" onclick="return validateConfirmOrder();"/>
        
   
    
        
      <input type="submit" class="btn btn-inverse text-center" name="btnClick"  style="width:64px; height: 30px"  value="Cancel" onclick="return validation();"/>



<div style="margin-left: 65%;">
		<input type="radio" name="status" value="Draft PO" checked="checked"/>Draft PO
		<input type="radio" name="status" value="RFQ Sent"/>RFQ Sent
		<input type="radio" name="status" value="Purchase Order"/>Purchase Order
		<input type="radio" name="status" value="Done"/>Done
		<input type="radio" name="status" value="Cancelled"/>Cancelled
	</div>		

</hr>



						 	<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">
						 	</br>
						 	<span style="font-size: 20px;"><b>&nbsp;&nbsp;&nbsp;Request for Quotation /</b></span>
						 	</br></br>
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
										<table id="tbl2" class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
										
									<tr>
									<td>
										Supplier
									</td>
									<td>
										<select id="s2_1" style="width: 100%" class="form-control" name="supplier">
											<option  value="0">--Select Supplier--</option>
											<%
											Supplier_model ss=new Supplier_model();
											GenericsDao<Supplier_model> sg=new GenericsImp<Supplier_model>();
											List<Supplier_model> ls=sg.viewData(ss);
											for(int i=0;i<ls.size();i++)
											{
											%>
			             					<option value=<%=ls.get(i).getSupplierid() %>><%=ls.get(i).getSuppliername()%></option>
			             					<%} %>
											
											
										
										</select>
									</td>
									<td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" onclick="window.location.assign('NewHome.jsp?p=AddSupplier');" value="+"/></td>
										<td>Order Date</td>
												<td><input type="date" id="bdate_id" name="odate" class="form-control" style="width:100%"/></td>
									
								</tr>
									
                               		
                               		 	
								<tr>
									<td>Supplier Reference</td>
									<td><input type="text" name="sref" class="form-control" /></td>
										<td></td>
									<td></td>
								
                               		<td><input type="hidden" name="hid_val" value="Create Quotation" /></td>
									
								</tr>
	
                           		
                           					 
                            				
										</table>
									</td>
									 
									<td>
									
									</td>
								</tr>
													
							</table>
						</div></div></div></div></div>	
		
                      <div class="contents boxpadding" >
                      
                                <ul class="nav nav-pills" id="myTab">
                                    <li class="active"><a href="#home" data-toggle="tab">Purchase Order</a></li>
                                    <li><a href="#profile" data-toggle="tab">Incoming Shipments &amp; Invoices</a></li>
                                   
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">
                         
                            <form action="PurchaseStuff" name="q_detail" method="post">
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
                               			<th></th>
                               			
                               		</tr>
                               		
                               		
                              <!-- 	<tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<select name="product" onchange="getItem(this.value);" class="form-control" style="width: 100%;margin-top: 5px;" id="pro">
                            							<option value="0">--Select Product--</option>
                            							
                            						</select>
                               			</td>
                               			<td>
                               				<select name="item" onchange="getItem(this.value);" class="form-control" style="width: 100%;margin-top: 5px;" id="pro">
                            							<option value="0">--Select Item--</option>
                            							
                            						</select>
                               			</td>
                               			<td><input type="text" style="width:90%; margin-top: 5px;" class="form-control" name="description[]" id="desc"/></td>
                               			<td><input type="text" id="sdate" style="width: 90%; margin-top: 5px;" class="form-control" name="s_date" /></td>
                               			<td><input type="text" style="width:90%; text-align: right;margin-top: 5px;" class="form-control" value="1.000" name="quantity" id="qty" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" class="form-control" value="0.00" name="u_price" id="u_pri" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" class="form-control" name="tax" value="0.00" id="tx"/></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" class="form-control" name="tax" value="0.00" id="tx"/></td><td></td>
                               		</tr> 
                               		</table>
                               		<table>
                               		<tr style=" height: 40px;">
                               			<td  width="130px" align="center"><a href="javascript:addRow()" style="color: #335A85;font-size: 14px;">Add an Item</a></td>
                               			<td><input type="hidden" name="hid_val" value="Quotation Detail" /></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr> -->	
                               		                               		</table>
                               		                               		
                               		                               			<table>
                               		<tr style=" height: 50px;">
                               			<td  width="130px" align="center"><a href="javascript:addRow()" style="color: #335A85;font-size: 14px;">Add an Item</a></td>
                               			<td><input type="hidden" name="hid_val" value="Quotation Detail" /></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>
                               		                               		</table>
                               		                               		<br /><br /><br /><br />
                               	<div class="dr"><span></span></div>
                               	<div style="margin-left: 850px;font-size: 16px;">
                               	<table>
                               	<tr><td>Untaxted Amount</td><td>:</td><td align="right" style="padding-left: 50px;">0.00</td></tr>
                               	<tr><td align="right">Taxes</td><td>:</td><td align="right">0.00</td></tr>
                               	<tr><td colspan="3"><hr style="border:1px solid #335A85; "></td></tr>
                               	<tr><td align="right" style="font-size: 20px;"><b>Total</b></td><td>:</td><td align="right" style="font-size: 20px;"><b>0.00</b></td></tr>
                               	</table>
                               	
                               	</div>
                               	<textarea rows="7" style="width: 700px;" placeholder="Terms and Conditions" name="t_c"></textarea>
                            
                            </div>                        

                              <div class="tab-pane" id="profile">
                                    
                                           <table class="table table-condensed">
                                         <tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell" width="50%"><table class="oe_form_group " border="0" cellpadding="0" cellspacing="0"><tbody><tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell oe_form_invisible oe_form_group_cell_label" width="1%">
        
 </tr><tr><td style="width:43%">
     Expected Date</td>
    <td>
        
        <input   type="date" name="edate" class="form-control" style="width:200px;">
       
    </td></tr><tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell oe_form_invisible oe_form_group_cell_label" width="1%">
       
    <td colspan="1" class="oe_form_group_cell oe_form_invisible" width="99%"><span class="oe_form_field oe_form_field_many2one oe_form_field_with_button oe_form_required oe_form_invisible">
        
        
         
          
        
    </span></td></tr><tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell oe_form_invisible oe_form_group_cell_label" width="1%">   
    <td colspan="1" class="oe_form_group_cell oe_form_invisible" width="99%"><span class="oe_form_field oe_form_field_boolean oe_form_invisible">
        
    <div class="boolean"></div></span></td></tr></tbody></table></td><td class="oe_form_group_cell oe_group_right" width="50%"><table class="oe_form_group " border="0" cellpadding="0" cellspacing="0"><tbody><tr class="oe_form_group_row">
    

      <td style="width:43%">  Invoicing Control
    </td><td colspan="1" class="oe_form_group_cell" width="99%"><span class="oe_form_field oe_form_field_selection oe_form_required">
    <select id="oe-field-input-86" class="form-control" style="width: 80%" name="invoice_method">
            
                <option value="false">
                    
                </option>
            
                <option value="based on purchase order lines">
                    Based on Purchase Order lines
                </option>
            
                <option value="based on draft invoice">
                    Based on generated draft invoice
                </option>
            
                <option value="based on incoming shipments">
                    Based on incoming shipments
                </option>
            
    </select>
</span></td></tr>
<tr></tr>
<tr></tr><tr class="oe_form_group_row"><td colspan="1" class="oe_form_group_cell oe_form_group_cell_label" width="1%">
        Payment Term
    </td><td colspan="1" class="oe_form_group_cell" width="99%"><span class="oe_form_field oe_form_field_selection">
   <select id="oe-field-input-86" class="form-control" style="width: 80%" name="payment_method">
            
                <option value="false">
                    
                </option>
            
                <option value=" 15 Days">
                    15 Days
                </option>
            
                <option value=" 30 Net Days">
                    30 Net Days
                </option>
            
                <option value="Immediate Payment">
                    Immediate Payment
                </option>
            
    </select>
</span></td></tr>              
                               </table> 
                                    </div>

                           
                    </div>
			 			</div>
						                      
                        </div>

               </div>   
                  </form>
                       


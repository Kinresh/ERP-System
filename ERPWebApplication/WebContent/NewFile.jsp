 

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
 				select.style.width="130px";
 			
 				
 				   
 				newRow.setAttribute('id', 'n' + count);
 				var img = document.createElement("IMG");
 				img.setAttribute("src", "img/delete.png");
 				img.style.paddingBottom="10px";
 				img.style.paddingLeft="5px";

   		    	   rA.setAttribute('href', 'javascript:removeRow(\'n' + count + '\');');
 				rA.appendChild(img);
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
   				var element4=document.createElement('input');
   				element4.type="text";
   				element4.name="u_price[]";
   				element4.style.width="129px";
   				var element5=document.createElement('input');
   				element5.type="text";
   				element5.name="tax[]";
   				element5.style.width="129px";
 		 	   	col1.appendChild(select);
 			  	col3.appendChild(element1);
 			 	col4.appendChild(element2);
 				col5.appendChild(element3);
 				col6.appendChild(element4);
 				col7.appendChild(element5);
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


    
 </script>
</head>
                <div class="row-fluid">

               <form name="company_form" action="PurchaseStuff" method="post" >
                        <div class="span12">   
                        <div class="head clearfix">
                        <h1><img src="img/list_icon/ic_user.png"/>&nbsp;&nbsp;&nbsp;Create Quotation</h1>
                        </div>
                        <div class="block">                  

	<input type="submit" class="btn btn-success"  value="Save"/>&nbsp;&nbsp;or<a href="#" onclick="window.history.back();" style="margin-left:10px;" >Discard</a>
	<div style="margin-left: 72%;">
		<input type="radio" name="status" value="Draft PO" checked="checked"/>Draft PO
		<input type="radio" name="status" value="RFQ Sent"/>RFQ Sent
		<input type="radio" name="status" value="Purchase Order"/>Purchase Order
		<input type="radio" name="status" value="Done"/>Done
	</div>					 	
						 	<hr />   
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10">
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
										
									<tr>
									<td>
										Supplier
									</td>
									<td>
										<select id="s2_1" style="width: 100%" name="supplier">
											<option selected>--Select Supplier--</option>
											
										</select>
									</td>
									<td><input type="button" class="btn button11" onclick="window.location.assign('home.jsp?p=Create Supplier');" value="+"/></td>
									
								</tr>
								<tr>
									<td>Supplier Reference</td>
									<td><input type="text" name="sref" /></td><td></td>
								</tr>
	
                           			
                           					 	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="10" cellspacing="10" style="border-spacing: 100px 100px;">
											<tr>
												<td>Order Date</td>
												<td><input type="text" id="bdate_id" name="odate" style="width:130px;"/></td>
											</tr>
											<tr>
                               		<td>Expected Date</td>
                               		<td><input type="text" id="edate" style="width:130px;" name="edate"/><input type="hidden" name="hid_val" value="Create Quotation" /></td>
                               	</tr>
											
                           			
										</table>
									</td>
								</tr>
													
							</table>
							
		
                        <div class="tabs" style="border-bottom: none;">

                            <ul style="background-color: transparent;">
                                <li ><a href="#tabs-1" class="eee">Purchase Order</a></li>
                                <li ><a href="#tabs-2" class="eee">Incoming Shipments &amp; Invoices</a></li>
                            </ul>                        

                            <div id="tabs-1">
                            <form action="PurchaseStuff" name="q_detail" method="post">
                               <table id="theBody">
                               		<tr style="background-color: #DDD;" >
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Description</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Schedule Date</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Unit price</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Taxes</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Subtotal</th>
                               			<th></th>
                               			
                               		</tr>
                               		
                               		
                              		<tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<select name="product" onchange="getItem(this.value);" style="width: 100%;margin-top: 5px;" id="pro">
                            							<option selected disabled></option>
                            							
                            						</select>
                               			</td>
                               			<td id="itm">
                  
                               			</td>
                               			<td><input type="text" style="width:90%; margin-top: 5px;" name="description[]" id="desc"/></td>
                               			<td><input type="text" id="sdate" style="width: 90%; margin-top: 5px;" name="s_date" /></td>
                               			<td><input type="text" style="width:90%; text-align: right;margin-top: 5px;" value="1.000" name="quantity" id="qty" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" value="0.00" name="u_price" id="u_pri" /></td>
                               			<td><input type="text" style="width:90%; text-align: right; margin-top: 5px;" name="tax" value="0.00" id="tx"/></td>
                               			<td></td><td></td>
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
                               	<textarea rows="7" style="width: 700px;" placeholder="Terms and Conditions"></textarea>
                               </form>
                            </div>                        

                            <div id="tabs-2">
                               <table style="margin-top: 40px;margin-left: 25px;">
                               	<tr>
                               		<td>Expected Date</td>
                               		<td><input type="text" id="edate" style="width:130px;margin-left: 5px;"/></td>
                               	</tr>
                               	<tr><td></td><td><br /><br /></td></tr>
                               </table>
                            </div>

                           
                    </div>
			 			</div>
						                      
                        </div>

               </div>   
                       


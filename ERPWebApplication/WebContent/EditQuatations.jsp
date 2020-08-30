<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.Item_model"%>
<%@page import="Model.PurchaseManagement.Item_Size_model"%>
  <%@page import="Model.PurchaseManagement.Product_model"%>
   <%@page import="Model.PurchaseManagement.Quatation_model"%>
     <%@page import="Model.PurchaseManagement.QuatationDetail_model"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

String e_id=request.getParameter("id");
PurchaseDao pd=new PurchaseDaoImp();
ArrayList<Quatation_model> q_list=pd.viewQuatationInfo(Integer.parseInt(e_id));
int k=1;
%>
   <head>
     
  <script type="text/javascript">
  $(document).on('focus',".sd", function(){
	    $(this).datepicker({dateFormat: 'yy-mm-dd'});
	});
 /*  function qqq(){
  $('.sclass').on('change', alert('dkljf'));
  } */
 
 function some(o){
	  var p=o.parentNode.parentNode;
      p.parentNode.removeChild(p);

	  
  }
 
	
	 function getSizeOld(id){
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
  			      document.getElementById(col3.id).innerHTML=xmlhttp.responseText;
  			      }
  			    };
  			  xmlhttp.open("post","PurchaseAjax?action=getSize&value="+id,true);
  			  xmlhttp.send();
  		  
  	  };
  
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




</script>
      <script type="text/javascript">
     
      $(function() {
    	    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
    	  });
      
   
      $(function() {
    	    $( "#edate" ).datepicker({dateFormat: 'yy-mm-dd'});
    	  });
      
    	function validation(){
    		var s_name=document.quotation_form.supplier.selectedIndex;
    		if(s_name==""){
    			alert("Select the supplier.");
    			document.quotation_form.supplier.focus();
    			return false;
    		}
    		
    		
    	
    		var od=document.quotation_form.odate;
    		if(od.value==""){
    			alert("Select the Order Date");
    			od.focus();
    			return false;
    		}
    		
    	   		
    		return true;
    	}
    	
    	 function exit()
    	   {
    	   var a2=document.quotation_form;
    	 	a2.action="NewHome.jsp?p=Quatations";
    	 	a2.submit();
    	   }
    	   
    
    </script> 
  
 
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>             
<form name="quotation_form" action="PurchaseUpdateController" method="post" onsubmit="return validation();">
	      <div class="span12">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;Quotations/<%=q_list.get(0).getPrefix() %><%=q_list.get(0).getQuotation_id() %></h1>
                        </div>
                        <div class="block">                  
<header>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Save"/>&nbsp;
	<input type="button" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
</div>




	<hr />
	
						 	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% if(q_list.get(0).getStatus().equalsIgnoreCase("Cancelled"))
{%>
	
	<input type="submit" class="btn btn-inverse text-center" value="Set to Draft" style="margin-left: 7px;"  name="btnClick">
	
<% }
else if(q_list.get(0).getStatus().equalsIgnoreCase("Draft PO"))
{
	%>

 <input type="submit" class="btn btn-danger" value="Send by Email"  name="btnclick" >
  <input type="button" class="btn btn-danger" value="Print" style="margin-left: 7px;"  name="btnclick" >
 <input type="submit" class="btn btn-inverse text-center" value="Confirm Order" name="btnClick" style="margin-left: 7px;">
 <input type="button" class="btn btn-inverse text-center" value="Cancel" style="margin-left: 7px;"  name="btnclick">
 <% }  
else if(q_list.get(0).getStatus().equalsIgnoreCase("RFQ Sent"))
{
 %>
  <input type="submit" class="btn btn-inverse text-center" value="Send by Email"  name="btnclick" >
  <input type="button" class="btn btn-inverse text-center" value="Print" style="margin-left: 7px;"  name="btnclick" >
 <input type="submit" class="btn btn-inverse text-center" value="Confirm Order" name="btnClick" style="margin-left: 7px;">
 <input type="button" class="btn btn-inverse text-center" value="Cancel" style="margin-left: 7px;"  name="btnclick">
 <% }
%>
 
<div style="margin-left: 65%;">
		<input type="radio" name="status" value="Draft PO" <%if(q_list.get(0).getStatus().equalsIgnoreCase("Draft PO")){ %> checked="checked" <%}else{ %> disabled="disabled" <%} %> />Draft PO
		<input type="radio" name="status" value="RFQ Sent" <%if(q_list.get(0).getStatus().equalsIgnoreCase("RFQ Sent")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />RFQ Sent
		<input type="radio" name="status" value="Purchase Order"  <%if(q_list.get(0).getStatus().equalsIgnoreCase("Purchase Order")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Purchase Order
		<input type="radio" name="status" value="Done"  <%if(q_list.get(0).getStatus().equalsIgnoreCase("Done")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Done
		<input type="radio" name="status" value="Cancelled"  <%if(q_list.get(0).getStatus().equalsIgnoreCase("Cancelled")){ %> checked="checked" <%}else{ %> disabled="disabled" <%}  %> />Cancelled
		
	</div>	


				 	
						 	<hr />   
						 	 	<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">
						 	</br>
						 	<span style="font-size: 20px;"><b>&nbsp;&nbsp;&nbsp;Request for Quotation/<%=q_list.get(0).getPrefix() %><%=e_id %></b></span>
						 	</br></br>
							<table style="margin-left: 25px;"  id="tbl1" cellpadding="10" cellspacing="10">
							
							<tr>
								<td></td>
							</tr>
									<tr>
									<td>
											<table id="tbl2" style="border-spacing: 100px 100px;"  class="table table-condensed" cellpadding="10" cellspacing="10" >
										
									<tr>
									<td>
										Supplier
									</td>
									<td>
										<select id="s2_1" style="width: 100%" name="supplier" class="form-control">
											<option selected>--Select Supplier--</option>
											<%
												Supplier_model ss= new Supplier_model();
												GenericsDao<Supplier_model> g_obj1=new GenericsImp<Supplier_model>();
											List<Supplier_model> s_list=g_obj1.viewData(ss);
												for(int i=0;i<s_list.size();i++){
											%>
											<option value=<%=s_list.get(i).getSupplierid() %><%if(Integer.toString(s_list.get(i).getSupplierid()).equals(Integer.toString(q_list.get(0).getSupplier()))){ %> selected<%} %>><%=s_list.get(i).getSuppliername() %></option>
											<% }%>
										</select>
									</td>
									<td><input type="button" class="form-control various fsv-update"  style="width:34px;height:32px;" onclick="window.location.assign('UserController?action=AddSupplier');" value="+"/></td>
									<td>Order Date</td>
												<td><input type="date" id="bdate_id" name="odate" class="form-control" style="width: 100%" value="<%=q_list.get(0).getOrder_dt()%>"/></td>
								</tr>
								<tr>
									<td>Supplier Reference</td>
									<td><input type="text" name="sref" class="form-control" value="<%=q_list.get(0).getSupplier_ref()%>"/></td><td></td>
									<td></td>
									<td></td>
								</tr>
	
                           			
                           					 	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="15" cellspacing="15" class="table table-condensed" style="border-spacing: 100px 100px;">
											
											<tr>
                               		<td></td>
                               		<td><input type="hidden" name="hid" value="Update Quotation" />
                               		<input type="hidden" name="rowC" id="ccRow" value="1"/><input type="hidden" name="e_id" value="<%=e_id%>"><br />
                               		</td>
                               	</tr>
											
                           			
										</table>
									</td>
								</tr>
													
							</table>
							
		<!-- </form> -->
                          <div class="contents boxpadding">
                                <ul class="nav nav-pills" id="myTab">
                                    <li class="active"><a href="#home" data-toggle="tab">Purchase Order</a></li>
                                    <li><a href="#profile" data-toggle="tab">Incoming Shipments &amp; Invoices</a></li>
                                   
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">
                         
                           
                               <table id="theBody" border="4" class="table table-condensed">
                               		<tr style="background-color: #DDD;" >
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="97px" style="border-right: 1px solid #ffffff;">Size</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Description</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Schedule Date</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Unit price</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Taxes</th>
                               			<th width="110px" style="border-right: 1px solid #ffffff;">Subtotal</th>
                               			<th></th>
                               			
                               		</tr>
                               		<%
                               			ArrayList<QuatationDetail_model> qd_list=pd.viewQuatationDetailInfo(q_list.get(0).getQuotation_id());
                               			for(int i=0;i<qd_list.size();i++){
                               				
                               		%>
                               		<tr>
                               			<td id="n<%=k%>">
                               				<select onchange="getItemOld(this.value,<%=k %>);" style="width: 130px;height:30px;" name="product">
                               					<%
                               						GenericsDao<Product_model> pr_gen=new GenericsImp<Product_model>();
                               						Product_model pr=new Product_model();
                               						List<Product_model> pr_list=pr_gen.viewData(pr);
                               						for(int j=0;j<pr_list.size();j++){
                               					%>
                               					<option value=<%=pr_list.get(j).getProductid() %><%if(Integer.toString(pr_list.get(j).getProductid()).equals(Integer.toString(qd_list.get(i).getProduct()))){ %> selected<%} %>><%=pr_list.get(j).getProduct() %></option>
                               					<%} %>
                               				</select> 
                               			</td>
                               			<td id="itm<%=k%>">
                               				<select style="width: 130px;height:30px;" name="item">
                               					<%
                               						ArrayList<Item_model> i_list=pd.getItem(qd_list.get(i).getProduct());
                               					%>
                               					<option value=<%=i_list.get(0).getItemid() %>><%=i_list.get(0).getItem() %></option>
                               				</select>
                               			</td>
                               			
                               			<td id="size<%=k%>">
                               				<select style="width: 130px;height:30px;" name="size">
                               					<%
                               						List<Item_Size_model> size_list=pd.viewItemSizeBySizeid(qd_list.get(i).getItemsizeid());
                               						if(!size_list.isEmpty()){
                               					%>
                               					<option value=<%=size_list.get(0).getItemsizeid() %>><%=size_list.get(0).getSize() %></option><%}else
                               						
                               						{%><option value="0"></option><%} %>
                               				</select>
                               			</td>
                               			
                               			<td><input type="text" value="<%=qd_list.get(i).getDescription()%>" style="width: 115px;height:30px;text-align: center;" name="description"></td>
                               			<td><input type="date" value="<%=qd_list.get(i).getSchedule_dt()%>" style="width: 115px;height:30px;text-align: center;" name="s_date"></td>
                               			<td><input type="text" value="<%=qd_list.get(i).getQuantity()%>" style="width: 115px;height:30px;text-align: right;" name="qnty"></td>
                               			<td><input type="text" value="<%=qd_list.get(i).getUnit_price()%>" style="width: 115px;height:30px;text-align: right;" name="u_price"></td>
                               			<td><input type="text" value="<%=qd_list.get(i).getTaxs()%>" style="width: 115px;height:30px;text-align: right;" name="tax"><input type="hidden" name="edit_id" value="<%=qd_list.get(i).getDetail_id() %>"></td>
                               			<td style="width: 115px;height:30px;" style="text-align: right;"><%=qd_list.get(i).getSubtotal() %></td>
                               			<td><a onclick="some(this);" style="cursor: pointer;"><img src="image/delete.png" /></a></td>
                               		</tr>
                               		<%k++;} %>
                  
                               		</table>
                               		<table>
                               		<tr style=" height: 40px;">
                               			<td  width="130px" align="center"><a href="javascript:addRow()" style="color: #335A85;font-size: 14px;" onclick="setRow();">Add an Item</a></td>
                               			<td></td>
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
                               	<textarea rows="7" style="width: 700px;" placeholder="Terms and Conditions" name="t_c"><%=q_list.get(0).getT_c() %></textarea>
                               
                            </div>                        

                                   <div class="tab-pane" id="profile">
                               <table style="margin-top: 40px;margin-left: 25px;">
                               	<tr>
                               		<td>Expected Date</td>
                               		<td><input type="text" id="edate" style="width:130px;margin-left: 5px;" name="edate" value="<%=q_list.get(0).getExpected_dt() %>" /></td>
                               	</tr>
                               	<tr><td></td><td><br /><br /><br /><br /><br /></td></tr>
                               </table>
                               	<script type="text/javascript">
   			<!--
   			
   			
   			var count = <%=k%>;
   			var nRows = <%=k%>;
   			var col3;
   			
   			function addRow() {
   				
 				var tBody = document.getElementById('theBody');
 				var newRow = document.createElement('tr');
 				var col1 = document.createElement('td');
 				
 				var col2 = document.createElement('td');
 				col2.id="itm"+count;
 				col3 = document.createElement('td');
 				col3.id="size"+count;
 				var col4 = document.createElement('td');
 				var col5 = document.createElement('td');
 				var col6 = document.createElement('td');
 				var col7 = document.createElement('td');
 				var col8 = document.createElement('td');
 				var col9 = document.createElement('td');
 				col9.style.size="100px";
 				var col10 = document.createElement('td'); 
 				
 				var rA = document.createElement('a');
 				rA.style.color="#335A85";
 				var sel = document.createElement('select');
 				sel.style.width="127px";
 				sel.style.height="30px";
 				
 				sel.name="product";
 				sel.className="sclass";
 				sel.onchange=function getItem(){
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
 					sel.appendChild(foption);
 				<%
 				Product_model pr1=new Product_model();
				GenericsDao<Product_model> gp1_obj=new GenericsImp<Product_model>();
				List<Product_model> p1_list=gp1_obj.viewData(pr1);
 				for(int i=0;i<p1_list.size();i++){
 				%>
 				var option = document.createElement("option");
 				option.text = "<%=p1_list.get(i).getProduct()%>";
 				option.value = <%=p1_list.get(i).getProductid()%>;
 				sel.appendChild(option);
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
   				element1.name="description";
   				element1.style.width="117px";
   				element1.style.height="30px";
   				var element2=document.createElement('input');
   				element2.type="date";
   				element2.name="s_date";
   				element2.style.width="117px";
   				element2.style.height="30px";
   				element2.className="sd";
   				var element3=document.createElement('input');
   				element3.type="text";
   				element3.name="qnty";
   				element3.value="0.00";
   				element3.style.textAlign="right";
   				element3.style.width="117px";
   				element3.style.height="30px";
   				var element4=document.createElement('input');
   				element4.type="text";
   				element4.name="u_price";
   				element4.style.width="117px";
   				element4.style.height="30px";
   				element4.value="0.00";
   				element4.style.textAlign="right";
   				var element5=document.createElement('input');
   				element5.type="text";
   				element5.name="tax";
   				element5.style.width="117px";
   				element5.style.height="30px";
   				element5.value="0.00";
   				element5.style.textAlign="right";
 		 	   	col1.appendChild(sel);
 			  	col4.appendChild(element1);
 			 	col5.appendChild(element2);
 				col6.appendChild(element3);
 				col7.appendChild(element4);
 				col8.appendChild(element5);
   				col10.appendChild(rA);
   
   				newRow.appendChild(col1);
   				newRow.appendChild(col2);
   				newRow.appendChild(col3);
   				newRow.appendChild(col4);
   				newRow.appendChild(col5);
   				newRow.appendChild(col6);
   				newRow.appendChild(col7);
   				newRow.appendChild(col8);
   				newRow.appendChild(col9);
   				newRow.appendChild(col10);
   				
   				tBody.appendChild(newRow);
   
   				++count;
   				++nRows;
   	
   			}
   
   			function removeRow(rowId) {
 				var tBody = document.getElementById('theBody');
   				
 				tBody.removeChild(document.getElementById(rowId));
   				nRows--;
   			}
   			
   			function setRow(){
   				var r=document.quotation_form.rowC;
   				r.value=nRows;
   				
   				
   			}
   			
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
   			      document.getElementById(col3.id).innerHTML=xmlhttp.responseText;
   			      }
   			    };
   			  xmlhttp.open("post","AjaxItem?action=getSize&value="+id,true);
   			  xmlhttp.send();
   		  
   	  };
   	  
   	 function getItemOld(id,k){
		  var xmlhttp;
		  var r_id="itm"+k;
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
		      document.getElementById(r_id).innerHTML=xmlhttp.responseText;
		      }
		    };
		  xmlhttp.open("post","AjaxItem?action=getItemOld&rowId="+k+"&value="+id,true);
		  xmlhttp.send();
	};
	
	function getSizeOld(id,k){
 		  var xmlhttp;
 		  var r_id="size"+k;
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
 			      document.getElementById(r_id).innerHTML=xmlhttp.responseText;
 			      }
 			    };
 			  xmlhttp.open("post","AjaxItem?action=getSize&value="+id,true);
 			  xmlhttp.send();
 		  
 	  };
   			//-->
   		</script>
                               
                            </div>

                           
                    </div>
                    </form>
			 			</div>
						                      
                        </div>

               </div>   
                       


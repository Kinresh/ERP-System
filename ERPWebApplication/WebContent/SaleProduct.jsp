<%@page import="Model.Warehouse.delivaryproducts_model"%>
<%@page import="InterFace.SalesManagement.SalesDao"%>
<%@page import="Dao.Salesmanagement.SalesDaoImp"%>
<html>


<head>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="assets/js/jquery.js"></script>
<!--// Javascript //-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.accordion.js"></script>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>
<script type="text/javascript" src="assets/js/icheck.min.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<script type="text/javascript" src="assets/js/functions.js"></script>

<style type="text/css">
body{
	overflow: hidden;
}
</style>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>

<%@page import="Model.PurchaseManagement.IncomingProduct_model"%>
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
PurchaseDao pp=new PurchaseDaoImp();
SalesDao pd=new SalesDaoImp();
List<delivaryproducts_model> q_list=pd.viewDelivaryProductInfo(Integer.parseInt(e_id));
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
  	function FBClose(){
		
			parent.$.fancybox.close();
			return true;
		
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




</script>
      <script type="text/javascript">
     
      $(function() {
    	    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
    	  });
      
   
      $(function() {
    	    $( "#edate" ).datepicker({dateFormat: 'yy-mm-dd'});
    	  });
      
    
    </script> 
  
 
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>             
			<div class="container-liquid" style="width:800px;">
			
			<form name="quotation_form" action="SalesUpdateController" method="post" >
	   			   <div class="span12">   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;Deliver Products </h1>
                        </div>
                      
									 
									<div class="row">
									<div class="col-xs-12">
									<div class="sec-box">
						 
								
									<table id="tbl3" cellpadding="15" cellspacing="15" class="table table-condensed" style="border-spacing: 100px 100px;">
											
									<tr>
                               		<td></td>
                               		<td>
                               		<input type="hidden" name="rowC" id="ccRow" value="1"/>
                               			<input type="hidden" name="sid"  value=<%=q_list.get(0).getDelivaryorder_id()%>>
                               				
                               		<input type="hidden" name="id" value="<%=e_id%>">
                               		<br />
                               		</td>
                               		</tr>
											
                           			
									</table>
									</td>
								</tr>
													
							</table>
		       <table id="theBody" border="4" class="table table-condensed">
                               		<tr style="background-color: #DDD;" >
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="127px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="97px" style="border-right: 1px solid #ffffff;">Size</th>
                              			<th width="127px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               		
                               			<th style="width: 13.222222328186035px;"></th>
                               			
                               		</tr>
                               		<%
                               			List<delivaryproducts_model> qd_list=pd.viewDelivaryProductInfo(q_list.get(0).getDelivaryorder_id());
                               			
                               			HttpSession ses=request.getSession();
                               			ses.setAttribute("qtylist", qd_list);
                               			for(int i=0;i<qd_list.size();i++){
                               				
                               		%>
                               		<tr>
                               			<td id="n<%=k%>">
                               				<select onchange="getItemOld(this.value,<%=k %>);" style="width: 127px;height:30px;" name="product">
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
                               				<select style="width: 127px;height:30px;" name="item">
                               					<%
                               						ArrayList<Item_model> i_list=pp.getItem(qd_list.get(i).getProduct());
                               					%>
                               					<option value=<%=i_list.get(0).getItemid() %>><%=i_list.get(0).getItem() %></option>
                               				</select>
                               			</td>
                               			
                               		<td id="size<%=k%>">
                               				<select style="width: 127px;height:30px;" name="size">
                               					<%
                               						List<Item_Size_model> size_list=pp.viewItemSizeBySizeid(qd_list.get(i).getItemsizeid());
                               						if(!size_list.isEmpty()){
                               					%>
                               					<option value=<%=size_list.get(0).getItemsizeid() %>><%=size_list.get(0).getSize() %></option><%}else
                               						
                               						{%><option value="0"></option><%} %>
                               				</select>
                               		</td>
                               			
                               			
                               			<td><input type="text" id="v" value="<%=qd_list.get(i).getQuantity()%>" style="width: 127px;height:30px;text-align: right;" name="qnty"></td>
                               			
                               			
                               			<td><a onclick="some(this);" style="cursor: pointer;"><img src="image/delete.png" /></a></td>
                               		</tr>
                               		<%k++;} %>
                  
                               		</table>
                               		<table>
                               		<tr style=" height: 40px;">
                               			<td  width="130px" align="center"><a href="javascript:addRow()" style="color: #335A85;font-size: 14px;" onclick="setRow();">Add an Item</a></td>
                               			<td></td>
                               			<td></td>
                               			
                               			
                               			
                               		</tr>
                               		<tr>
                               	<td> <input type="submit" class="btn btn-danger text-center"  style="width: 120px; height: 30px" value="Deliver" name="hid" onClick="return FBClose()"/></td>
       
        
        
   
                               		</tr>
                               		                               		</table>
                               		                               		
                               		                               		</div>
                               		                               		</div>
                               		                               		</div>
                         </form>
                               		                               		
                               		                               		
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
 				
 				var col6 = document.createElement('td');
 				
 				
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
   		   		var element3=document.createElement('input');
   				element3.type="text";
   				element3.name="qnty";
   				element3.value="0.00";
   				element3.style.textAlign="right";
   				element3.style.width="127px";
   				element3.style.height="30px";
   		 	   	col1.appendChild(sel);
 			  
 				col6.appendChild(element3);
 			
   				col10.appendChild(rA);
   
   				newRow.appendChild(col1);
   				newRow.appendChild(col2);
   				newRow.appendChild(col3);
   			
   				newRow.appendChild(col6);
   				
   				
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
               
			 			</div>
						                      
                        </div>

               </div>   
                       


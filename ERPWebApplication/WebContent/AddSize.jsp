<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Model.PurchaseManagement.Item_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="assets/css/home.css" type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<style type="text/css">
body{
	overflow: hidden;
}
</style>
<%@page import="java.util.ArrayList"%>

<head>
 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  <script type="text/javascript">
  function exit()
  {
  	var a2=document.item_form;
  	a2.action="NewHome.jsp?p=AddItem";
  	a2.submit();
  }
  function ff()
  {
  	var a2=document.item_form;
	a2.action="NewHome.jsp?p=AddItem";
  	a2.submit();
  }
  function validation()
  {
		var p_id=document.item_form.itemid.selectedIndex;
		if(p_id==0){
			alert("Select the Item");
			document.item_form.itemid.focus();
			return false;
		}
		
		var com_name=document.item_form.size;
		if(com_name.value=="")
			{
				alert("Please Enter the Size.");
				com_name.focus();
				return false;
			}
		
	
		return true;
	}


  </script>
</head>
  <div class="block">                  
<form name="item_form" method="post" action="PurchaseController"
	 autocomplete='off' >
	 <div class="content-section" style="
    width: 700px;
">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							ItemSize.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save"  onclick="return validation()"  />
							<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
									
									
								</h2>
							
						</header>
						
							<table  class="table table-condensed">
								<tr>
                            		<td>Item</td>
                            		<td>
                            						<select name="itemid" class="form-control">
                            							<option>---Select Item---</option>
                            							<%
                            							Item_model pc=new Item_model();
                            							GenericsDao gg=new GenericsImp();
                            							List<Item_model> ll=gg.viewData(pc);
                            							for(Item_model pcat:ll)
                            							{
                       									%>
                       									<option value=<%=pcat.getItemid()%>><%=pcat.getItem() %></option>
                       									<%} %>
                            						</select>
                            		</td>
                            		 <td><input type="button" class="form-control" style="width:34px;height:32px;" onClick="ff()" value="+" /></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Size</td>
                            <td>
                            	<input type="text" name="size" class="form-control" >
                            </td><td></td>
                            </tr>
                          
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid" value="Add" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   

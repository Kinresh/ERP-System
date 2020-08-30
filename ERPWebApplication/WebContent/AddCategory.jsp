<link rel="stylesheet" href="assets/css/home.css" type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<style type="text/css">
body{
	overflow: hidden;
}
</style>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>
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
  function validation(){
		var p_id=document.prodcategory_form.producttype.selectedIndex;
		if(p_id==0){
			alert("Select the Product Type");
			document.prodcategory_form.producttype.focus();
			return false;
		}
		
		var com_name=document.prodcategory_form.productcategory;
		if(com_name.value=="")
			{
				alert("Please Enter the Category.");
				com_name.focus();
				return false;
			}
		
		var desc=document.prodcategory_form.description;
		if(desc.value=="")
			{
				alert("Please Enter Description.");
				desc.focus();
				return false;
			}
		return true;
	}
  function FBClose(){
		var flg=validation();
		if(flg){
			parent.$.fancybox.close();
			return true;
		}
		else 
			return false;
	}
  </script>
</head>
  <div class="block">                  
<form name="prodcategory_form" method="post" action="PurchaseController"
	 autocomplete='off' >
	 <div class="content-section" style="
    width: 800px;
">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							Product Category.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save" onClick="return FBClose()" onclick="return validation()"  />
								<input type="button" value="discard" style="width: 56px; height: 30px" class="form-control btn btn-primary text-center" onclick="parent.$.fancybox.close();"/>
								</h2>
							
						</header>
						
							<table  class="table table-condensed">
								<tr>
                            		<td>Product Type</td>
                            		<td>
                            						<select name="producttype" class="form-control">
                            							<option>---Select Type---</option>
                            							<option value="Stockable">Stockable</option>
                            							<option value="Service">Service</option>
                            							
                            						</select>
                            		</td>
                            		 <td></td>
                           		 </tr>
                           		
                            <tr>
                            <td>Product Category</td>
                            <td>
                            	<input type="text" name="productcategory" class="form-control" >
                            </td><td></td>
                            </tr>
                            <tr>
                            <td colspan="3"><textarea rows="5"  name="description" placeholder="Description" style="width: 100%;"></textarea> </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input type="hidden" name="hid" value="Addcategory" /></td>
                            </tr>
							</table>
						</form>
						
		            </div>
					</div>
               </div>   
</html>

<html>


<head>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
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
<script type="text/javascript">
function validation(){
	
	var c_name=document.f1.countryname;
	if(c_name.value==""){
		alert("Enter the Country");
		c_name.focus();
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
<body>



<form name="f1"  method="post" action="UserActionController" onsubmit="return validation()" autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                
                                <header>
                                    <h2 class="heading">Add Country</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="col-md-4"></th>
                                                    <th class="col-md-8"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
												
												  <tr>
                                                    <td class="col-md-4">Country</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Country" class="form-control" name="countryname"></td>
                                                </tr>
                                            	 <tr>
                                                 <td><input type="submit"  value="Add" class="btn btn-default style3" onclick="return FBClose()" ><input type="button" value="discard" class="btn btn-default style3" onclick="parent.$.fancybox.close();"/>
                                              </td>
                                              <input type="hidden" name="btnclick" value="country">
                                              </tr>
											</tbody>
								</table>
								</div>
								</div>
								</div>
								</div>
								</div>			
								</div>
								</div>
								</form>
								</body>
								</html>
								
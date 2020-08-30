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
<script type="text/javascript">
function validation(){
	
	var c_name=document.f1.privilage;
	if(c_name.value==""){
		alert("Enter the Privilage");
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
<form name="f1"  method="post" action="UserPrivilageController"  autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                
                                <header>
                                    <h2 class="heading">Add Privilage</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table table-condensed">
                                           
                                            <tbody>
												
												  <tr>
                                                    <td class="col-md-4">Privilage</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Privilage" class="form-control" name="privilage"></td>
                                                </tr>
                                                                                  	
												 <tr>
                                                 <td colspan="2"><input type="submit"  value="Add Privilage" class="btn btn-default style3"  name="btnsubmit" onClick="return FBClose()">
                                                 	<input type="button" value="discard" class="btn btn-default style3" onclick="parent.$.fancybox.close();"/>
                                              </td>
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
		
								
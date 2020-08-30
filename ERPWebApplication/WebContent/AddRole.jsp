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
	
	var c_name=document.f1.role;
	if(c_name.value==""){
		alert("Enter the Role");
		c_name.focus();
		return false;
	}
		
	var c_name=document.f1.roledesc;
	if(c_name.value==""){
		alert("Enter the Description of Role");
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
<form name="f1"  method="post" action="UserActionController"  autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                
                                <header>
                                    <h2 class="heading">Add Role</h2>
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
                                                    <td class="col-md-4">Role</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Role" class="form-control" name="role"></td>
                                                </tr>
                                               <tr>
                                                    <td class="col-md-4">Description</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Description" class="form-control" name="roledesc"></td>
                                                </tr>                                         	
												 <tr>
                                                 <td><input type="submit"  value="Add" class="btn btn-default style3"  name="btnclick" onClick="return FBClose()">
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
		
								
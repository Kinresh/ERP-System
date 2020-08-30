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
	
	var t_name=document.title_form.title;
	if(t_name.value==""){
		alert("Enter the Title");
		t_name.focus();
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
<form name="title_form"  method="post" action="PurchaseController"  autocomplete='off'>
   <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                
                                <header>
                                    <h2 class="heading">Add Title</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table table-condensed">
                                        <input type="hidden" name="hid" value="title">
                                            <thead>
                                                <tr>
                                                    <th class="col-md-4"></th>
                                                    <th class="col-md-8"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
												
												  <tr>
                                                    <td class="col-md-4">Title</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Title" class="form-control" name="title"></td>
                                                </tr>
                                                                                  	
												 <tr>
                                                 <td><input type="submit"  value="Add" class="btn btn-default style3"  name="btnclick" onClick="return FBClose()">
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
		
								
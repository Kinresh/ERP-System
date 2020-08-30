
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
HttpSession ses=request.getSession(true);
String uname=(String)ses.getAttribute("username1");
if(uname == null)
{
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>

<!-- Mirrored from www.extracoding.com/demo/adminise/login1.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 24 Mar 2014 05:24:49 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Page</title>
<!--// Stylesheets //-->
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/icheck.min.js"></script>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<script type="text/javascript">
function validatecombo()
{
	var st =document.form1.roleid.selectedIndex;
	if(st == 0){
		alert("Select the Role.");
		document.form1.roleid.focus();
		return false;
	}
	return true;
 	
}


</script>
<script type='text/javascript'>

   function setCookie(cname,cvalue,exdays)
    {
    var d = new Date();
    d.setTime(d.getTime()+(exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname+"="+cvalue+"; "+expires;
    }

    function getCookie(cname)
    {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) 
      {
      var c = ca[i].trim();
      if (c.indexOf(name)===0) return c.substring(name.length,c.length);
      }
    return "";
    }

    function checkCookie()
    {
    var user=getCookie("user");

    if (user!=="")
      {
      document.getElementById("username").value = user;
      }
    else 
      {

        if (user!=="" && user!=null)
        {
        setCookie("user",user,30);
        }
      }
    }
    
    
    
     </script>

<body>
	<!-- Wrapper Start -->
	<div class="loginwrapper">
		<span class="circle"></span>
		<div class="loginone">
			<header>
				<a href="dashboard1.html"><img src="assets/images/logo.png"
					alt="" /></a>
				<p>Enter your credentials to login to your account</p>
			</header>
			<form action="UserController" method="post" name="form1" autocomplete='off'>
				<div class="username">

					<select class="form-control" style="width: 350px; height: 42px;"
						name="roleid">

						<option>---Select Role---</option>
						<%

Role b=new Role();
Generics<Role> g=new GenericsDaoImp<Role>();


List<Role> list=g.viewData(b);


for(Role u:list)
{
%>
						<option value="<%=u.getRoleid()%>"><%=u.getRoleType()%></option>
						<%} %>



					</select> </div>
				<br>
				<div class="username">
					<input type="text" name="username" id="username" class="form-control"
						placeholder="Enter your username" /> <i
						class="glyphicon glyphicon-user"></i>
				</div>
				<div class="password">
					<input type="password" class="form-control" name="pass"
						placeholder="Enter your password" /> <i
						class="glyphicon glyphicon-lock"></i>
				</div>
				<div class="custom-radio-checkbox">
					<input tabindex="1" onClick="checkCookie()" type="checkbox"
						class="bluecheckradios"> <label>Remember me</label>
				</div>
				<script>
				$(document).ready(function(){
				  $('.bluecheckradios').iCheck({
					checkboxClass: 'icheckbox_flat-blue',
					radioClass: 'iradio_flat-blue',
					increaseArea: '20%' // optional
				  });
				});  	
			</script>
				<input type="submit" class="btn btn-primary style2" value="Login"
					name="action" onClick="return validatecombo()" />
			</form>
			<footer>
				<a href="#" class="forgot pull-left">I forgot my password</a> <a
					href="#" class="register pull-right">Create account</a>
				<div class="clear"></div>
			</footer>
		</div>
	</div>
	<!-- Wrapper End -->

	<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42761673-1', 'extracoding.com');
  ga('send', 'pageview');

</script>

</body>

<!-- Mirrored from www.extracoding.com/demo/adminise/login1.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 24 Mar 2014 05:24:49 GMT -->
</html>
<%
}
else 
{
	response.sendRedirect("UserController?action=Customers");/*blank*/
}
%>
 <%@page import="InterFace.UserManagement.UserRightsDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
HttpSession ses=request.getSession();
String uname=(String)ses.getAttribute("username1");
if(uname != null)
{
%>

<%@page import="java.util.ArrayList"%>
<%@page import="Dao.UserManagement.UserRightsDaoImp"%>
<%@page import="InterFace.UserManagement.UserRightsDao"%>
<%@page import="net.sf.cglib.transform.impl.AddInitTransformer"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.UserManagement.assignPriByUser_model"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adminise - Cl
ean And Corporate Admin Panel Template</title>
<!--// Stylesheets //-->
<link rel="stylesheet" href="assets/css/home.css" type="text/css" />

<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--// Javascript //-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.accordion.js"></script>
<script type="text/javascript" src="assets/js/jquery.custom-scrollbar.min.js"></script>
<script type="text/javascript" src="assets/js/icheck.min.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<script type="text/javascript" src="assets/js/functions.js"></script>



<!-- fancy -->
<script type="text/javascript"
	src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>


<link rel="stylesheet"
	href="fancybox/source/jquery.fancybox.css?v=2.1.4" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="fancybox/source/jquery.fancybox.pack.js?v=2.1.4"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- fancy -->
<script>
	$(document).ready(function() {

		$('.various').fancybox({
			maxWidth : 900,
			maxHeight : 900,

			width : '90%',         
			height : '60%',
			autoSize : false,
			closeClick : false,
			openEffect : 'elastic',
			openSpeed : 500,

			closeEffect : 'elastic',
			closeSpeed : 500,

			fitToView : true,
			preload : true,
			afterClose : function (){
	               parent.location.reload(true);
	            }
		});

	});
</script>



<!-- fancy -->
<script type="text/javascript"
	src="fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>


<link rel="stylesheet"
	href="fancybox/source/jquery.fancybox.css?v=2.1.4" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="fancybox/source/jquery.fancybox.pack.js?v=2.1.4"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

<link rel="stylesheet"
	href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- fancy -->
<script type="text/javascript">
function closeME() {
	jQuery.fancybox.close();
}
</script>

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>

<body>
<!-- Wrapper Start -->
<div class="wrapper">
	<div class="structure-row">
        <!-- Sidebar Start -->
        <aside class="sidebar">
        	<div class="sidebar-in">
                <!-- Sidebar Header Start -->
                <header>
                    <!-- Logo Start -->
                    <div class="logo">
                        <a href="dashboard1.html"><img src="assets/images/logo.png" alt="Adminise" /></a>
                    </div>
                    <!-- Logo End -->
                    <!-- Toggle Button Start -->
                    <a href="#" class="togglemenu">&nbsp;</a>
                    <!-- Toggle Button End -->
                    <div class="clearfix"></div>
                </header>
                <!-- Sidebar Header End -->
                             <%
                Integer id11 = (Integer) session.getAttribute("id1");
				Integer user1 = (Integer) session.getAttribute("user");
				UserRightsDao aa = new UserRightsDaoImp();
				//UserMaster mst = new UserMaster();
				UserModel uu=new UserModel();

				if(id11!=null && user1==null)
				{
				%>
                
                
                
                    <ul class="navi-acc" id="nav2">
                     <%
					uu.setUserid(id11);
					ArrayList<assignPriByUser_model> p_list=aa.viewUserPrivilageByid(uu);
					String privilege_ids=p_list.get(0).getPri_id();
					System.out.print("------------------------"+privilege_ids);
					String[] pri_id_list=privilege_ids.split(",");
					String[] privilege_name=new String[]{};
					for(int i=0;i<pri_id_list.length;i++){
						//String pri_name=d_obj.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						String pri_name=aa.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						
				%>
						
			
				
            
                      		  <li>
                       			 <a href="#dashboard" class="dashboard"><%=pri_name %></a>
                       			 
                       			     <%
                    String co_name=aa.getComponent(Integer.parseInt(pri_id_list[i]));
					String co_names[]=co_name.split(",");%>
				      				  <ul style="display: block;">
				      		<%		for(int j=0;j<co_names.length;j++)
									{
										
									
				                    %>
				                
				                       			 
				                       			 
				                
                          		 			 <li><a href="UserController?action=<%=co_names[j]%>"><%=co_names[j]%></a></li>
                           	<%} %>
                       				 </ul>
                       				  
                  			  </li>
                           <%} %>
                  </ul>
                  <%}else if(id11!=null && user1!=null)
                	  {%>
                	  
                	  
                	  	<%	if(id11!=null && user1==null)
                	  		{ %>
                	  		
                	  		   <ul class="navi-acc" id="nav2">
                     <%
					uu.setUserid(id11);
					ArrayList<assignPriByUser_model> p_list=aa.viewUserPrivilageByid(uu);
					String privilege_ids=p_list.get(0).getPri_id();
					System.out.print("------------------------"+privilege_ids);
					String[] pri_id_list=privilege_ids.split(",");
					String[] privilege_name=new String[]{};
					for(int i=0;i<pri_id_list.length;i++){
						//String pri_name=d_obj.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						String pri_name=aa.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						
				%>
						
			
				
            
                      		  <li>
                       			 <a href="#dashboard" class="dashboard"><%=pri_name %></a>
                       			 
                       			     <%
                    String co_name=aa.getComponent(Integer.parseInt(pri_id_list[i]));
					String co_names[]=co_name.split(",");%>
				      				  <ul style="display: block;">
				      		<%		for(int j=0;j<co_names.length;j++)
									{
										
									
				                    %>
				                
				                       			 
				                       			 
				                
                          		 			 <li><a href="UserController?action=<%=co_names[j]%>"><%=co_names[j]%></a></li>
                           	<%} %>
                       				 </ul>
                       				  
                  			  </li>
                           <%} %>
                  </ul>
            
                	  		
                	  	<%}
                	  		else if(id11!=null && user1!=null)
                	  		{ %>
                	  		
                	  			  <ul class="navi-acc">
                            <li><a href="dashboard1.html" class="layout">Login User Module</a></li>
                            
                        </ul>
                   
                	  			   <ul class="navi-acc" id="nav2">
                     <%
					uu.setUserid(id11);
					ArrayList<assignPriByUser_model> p_list=aa.viewUserPrivilageByid(uu);
					String privilege_ids=p_list.get(0).getPri_id();
					System.out.print("------------------------"+privilege_ids);
					String[] pri_id_list=privilege_ids.split(",");
					String[] privilege_name=new String[]{};
					for(int i=0;i<pri_id_list.length;i++){
						//String pri_name=d_obj.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						String pri_name=aa.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						
				%>
						
			
				
            
                      		  <li>
                       			 <a href="#dashboard" class="dashboard"><%=pri_name %></a>
                       			 
                       			     <%
                    String co_name=aa.getComponent(Integer.parseInt(pri_id_list[i]));
					String co_names[]=co_name.split(",");%>
				      				  <ul style="display: block;">
				      		<%		for(int j=0;j<co_names.length;j++)
									{
										
									
				                    %>
				                
				                       			 
				                       			 
				                
                          		 			 <li><a href="UserController?action=<%=co_names[j]%>"><%=co_names[j]%></a></li>
                           	<%} %>
                       				 </ul>
                       				  
                  			  </li>
                           <%} %>
                  </ul>
                    <ul class="navi-acc">
                            <li><a href="dashboard1.html" class="layout">More User Module</a></li>
                            
                        </ul>
                   
            		   <ul class="navi-acc" id="nav2">
                     <%
                     UserModel uuu=new UserModel();
					uuu.setUserid(user1);
					ArrayList<assignPriByUser_model> p_list1=aa.viewUserPrivilageByid(uuu);
					if(p_list1!=null)
					{
					String privilege_ids1=p_list1.get(0).getPri_id();
					System.out.print("-------------iii-----------"+privilege_ids1);
					String[] pri_id_list1=privilege_ids1.split(",");
					String[] privilege_name1=new String[]{};
					for(int i=0;i<pri_id_list1.length;i++){
						//String pri_name=d_obj.getPrivilegeName(Integer.parseInt(pri_id_list[i]));
						String pri_name1=aa.getPrivilegeName(Integer.parseInt(pri_id_list1[i]));
						
				%>
						
			
				
            
                      		  <li>
                       			 <a href="#dashboard" class="dashboard"><%=pri_name1 %></a>
                       			 
                       			     <%
                    String co_name=aa.getComponent(Integer.parseInt(pri_id_list1[i]));
					String co_names[]=co_name.split(",");%>
				      				  <ul style="display: block;">
				      		<%		for(int j=0;j<co_names.length;j++)
									{
										
									
				                  
				                
                               		if(co_names[j].equals("ViewUser"))
                               		{ 
                               		System.out.print("View------------------------------------------------------");
                               		%>
                               		 <li><a href="UserController?action=<%=co_names[j]%>"><%=co_names[j] %></a></li>
                               		<%
                               		}
                               		else
                               		{ 
                               			System.out.print("NotView-------------------------------------------------"); %>
                               		 <li><a href="UserController?action=<%=co_names[j]%>" style="display:none;"><%=co_names[j]%></a></li>
                               		<%}
       							
       					
       					%>
       			
                              
				                       			 
				                       			 
				                
                          		 			
                           			<%} %>
                       				 </ul>
                       				  
                  			  </li>
                           <%} %>
                  </ul>
            
                	  		
                	  
                	  	<%} %>	
                	 
                	  
                	  
                	  
                	  
                	  
                	
                  
                  	<%} %>
                  	<%}%>	
                 	  
             
                  		
                  		
                  		
                  		
                  		
          <div class="clearfix"></div>
                </nav>
                <!-- Sidebar Navigation End -->
                <!-- Shadow Start -->
                <span class="shadows"></span>
                <!-- Shadow End -->
            </div>
        </aside>
        <!-- Sidebar End -->
        <!-- Right Section Start -->
        <div class="right-sec">
            <!-- Right Section Header Start -->
            <header>
                <!-- User Section Start -->
                <div class="user">
                    <figure>
                        <a href="#"><img src="assets/images/avatar1.jpg" alt="Adminise" /></a>
                    </figure>
                    <div class="welcome">
                        <p>Welcome</p>
                        <h5><a href="#"><%=uname %></a></h5>
                    </div>
                </div>
                <!-- User Section End -->
                <!-- Search Section Start -->
                <div class="search-box">
                    <input type="text" placeholder="Search Anything" />
                    <input type="submit" value="go" />
                </div>
                <!-- Search Section End -->
                <!-- Header Top Navigation Start -->
                <nav class="topnav">
                    <ul id="nav1">
                        <li class="tasks">
                        	<a href="#"><i class="glyphicon glyphicon-check"></i>Tasks<span>(04)</span></a>
                            <div class="popdown">
                            	<div class="taskslist">
                                	<ul>
                                    	<li>
                                        	<h6><a href="#">Vel lundium natoque</a><span class="pull-right">25%</span></h6>
                                            <div class="progress">
                                                <div style="width: 15%" class="progress-bar progress-bar-success">
                                                    <span class="sr-only">35% Complete (success)</span>
                                                </div>
                                                <div style="width: 5%" class="progress-bar progress-bar-warning">
                                                    <span class="sr-only">20% Complete (warning)</span>
                                                </div>
                                                <div style="width: 5%" class="progress-bar progress-bar-danger">
                                                    <span class="sr-only">10% Complete (danger)</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a><span class="pull-right">75%</span></h6>
                                            <div class="progress">
                                                <div style="width: 30%" class="progress-bar progress-bar-success">
                                                    <span class="sr-only">35% Complete (success)</span>
                                                </div>
                                                <div style="width: 30%" class="progress-bar progress-bar-warning">
                                                    <span class="sr-only">20% Complete (warning)</span>
                                                </div>
                                                <div style="width: 15%" class="progress-bar progress-bar-danger">
                                                    <span class="sr-only">10% Complete (danger)</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a><span class="pull-right">52%</span></h6>
                                            <div class="progress">
                                                <div style="width: 30%" class="progress-bar progress-bar-success">
                                                    <span class="sr-only">35% Complete (success)</span>
                                                </div>
                                                <div style="width: 15%" class="progress-bar progress-bar-warning">
                                                    <span class="sr-only">20% Complete (warning)</span>
                                                </div>
                                                <div style="width: 7%" class="progress-bar progress-bar-danger">
                                                    <span class="sr-only">10% Complete (danger)</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a><span class="pull-right">90%</span></h6>
                                            <div class="progress">
                                                <div style="width: 30%" class="progress-bar progress-bar-success">
                                                    <span class="sr-only">35% Complete (success)</span>
                                                </div>
                                                <div style="width: 30%" class="progress-bar progress-bar-warning">
                                                    <span class="sr-only">20% Complete (warning)</span>
                                                </div>
                                                <div style="width: 30%" class="progress-bar progress-bar-danger">
                                                    <span class="sr-only">10% Complete (danger)</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="#" class="viewall">View All Tasks</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </li>
                        <li class="notifi">
                        	<a href="#"><i class="glyphicon glyphicon-bell"></i>Notifications</a>
                            <div class="popdown">
                            	<div class="notificationlist">
                                	<ul>
                                    	<li>
                                        	<h6><a href="#">Vel lundium natoque</a></h6>
                                            <p>In parturient! Vel lundium natoque</p>
                                            <span><i class="glyphicon glyphicon-time"></i>2hrs ago</span>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a></h6>
                                            <p>In parturient! Vel lundium natoque</p>
                                            <span><i class="glyphicon glyphicon-time"></i>2hrs ago</span>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a></h6>
                                            <p>In parturient! Vel lundium natoque</p>
                                            <span><i class="glyphicon glyphicon-time"></i>2hrs ago</span>
                                        </li>
                                        <li>
                                        	<h6><a href="#">Vel lundium natoque</a></h6>
                                            <p>In parturient! Vel lundium natoque</p>
                                            <span><i class="glyphicon glyphicon-time"></i>2hrs ago</span>
                                        </li>
                                    </ul>
                                    <a href="#" class="viewall">View All Notifications</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </li>
                        <li class="inbox">
                        	<a href="inbox.html"><i class="glyphicon glyphicon-envelope"></i>Inbox<span>(03)</span></a>
                        </li>
                        <li class="settings">
                        	<a href="#"><i class="glyphicon glyphicon-wrench"></i>Settings</a>
                            <div class="popdown popdown-right settings">
                            	<nav>
                                	<a href="#"><i class="glyphicon glyphicon-user"></i>Your Profile</a>
                                    <a href="#"><i class="glyphicon glyphicon-pencil"></i>Edit Account</a>
                                    <a href="#"><i class="glyphicon glyphicon-question-sign"></i>Get Help</a>
                                    <a href="UserController?action=l"><i class="glyphicon glyphicon-log-out"></i>Log out</a>
                                </nav>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
           
           
           <%
			if (request.getParameter("p") != null) {
					String pages = request.getParameter("p").toString()
							+ ".jsp";
		%>
		<jsp:include page="<%=pages%>" />

		<%
			} else if (request.getParameter("p") == null) {
		%>
		<%@include file="Blank.jsp"%>
		<%} %>
           
                    </div>
        <!-- Right Section End -->
    </div>
</div>
<!-- Wrapper End -->



</body>
</html>
<%	
}
else 
{
	response.sendRedirect("login.jsp");
}
%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
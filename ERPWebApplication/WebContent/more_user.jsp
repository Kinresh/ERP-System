
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<html>
<body>
<%
String g1=request.getParameter("uid"); 
UserModel b=new UserModel();

AddInsertDao aa=new AddInsertDaoImp();
List<UserModel> l=new ArrayList<UserModel>();

	


	l=aa.viewUserDataByUserid(Integer.parseInt(g1));



%>
<form>

    <table class="table table-condensed" id="example">	
 <tr><th>User Name</th>
                                                    <th>Email Id</th>
                                                    <th>Contact</th>
                                                    <th class="center">Status</th>
                                                    <th>Action</th>
													
                                                </tr>
                                                <% int k=1;
for(UserModel u:l)
{
%>			
                                                
                                                <tr>
                                            	<td><%=u.getUsername() %></td>
                                            	<td><%=u.getEmailaddress() %></td>
<td><%=u.getContactno() %></td>
<td>Unblock</td>
<td><input type="button" class="btn btn-primary text-center fsv-expand fsv-image1" style="width: 45px; height: 30px" value="User" id='<%=u.getUserid()%>'></td>								
 
 

</tr>
     <tr>
                                               
                                            
                                                <td colspan="5" class="pad0"><div  id="user-expand<%=u.getUserid()%>"></div></td></tr>
                                            
<%} %>
</table>
</form>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42761673-1', 'extracoding.com');
  ga('send', 'pageview');

</script>

<script>
$(".fsv-expand").click(function(e){
	if($(this).hasClass("fsv-image1"))
	{
	var uid=$(this).attr("id");
	$("#user-expand"+uid).slideDown();
	$(this).removeClass("fsv-image1");
	$(this).addClass("fsv-image2");
	$.ajax({
        url: "more_user.jsp?uid="+uid,
        success: function(data) {	
        $("#user-expand"+uid).html(data);
		$("#user-expand"+uid).slideDown();
                                }
          });
	}
	else
	{
	 $("#user-expand"+uid).css("display","none");
	 $(this).removeClass("fsv-image2");
	 var uid=$(this).attr("id");
	 $("#user-expand"+uid).slideUp();
	 $(this).addClass("fsv-image1");
	}
	});
</script>
         
		

</body>
</html>

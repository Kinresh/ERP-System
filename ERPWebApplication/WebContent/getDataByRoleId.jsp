<%@page import="InterFace.UserManagement.UserRightsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.UserRightsDaoImp"%>
<%@page import="Model.UserManagement.assignPriByRole_model"%>
<%@page import="Model.UserManagement.privilage_model"%>

<%@page import="Model.UserManagement.UserModel"%>


<%
//int deptid=Integer.parseInt(request.getParameter("deptid"));
String deptid=request.getParameter("deptid");
//String deptid="1";
 
System.out.println("pass dept id--------------------------------------------------- : " +deptid);
AddInsertDao userdao=new AddInsertDaoImp();
List<UserModel> userlist=userdao.viewDataByRoleId(Integer.parseInt(deptid));
%>
<table ><tr><td>Select  User</td>
 <td><select name="username"  id="Username" class="form-control">
 <option>--Select User--</option>
 <%

 if(userlist != null)
 {
 	UserModel user=new UserModel();
 	for(int i=0;i<userlist.size();i++)
 	{
 		user=userlist.get(i);
 		%>
 		<option value="<%= user.getUserid() %>"><%= user.getUsername() %></option>
 		<%
 		
 	}
 }
 
 
 %>

 </select></td></tr>

 <tr>
<td class="col-md-4">Select  Privilage</td>
  <td class="col-md-8">
<select name="Userrights" style="color: gray" id="userright" class="form-control" multiple="multiple">

 <%

 System.out.println("pass dept id : " +deptid);
  UserRightsDao rightdao=new UserRightsDaoImp();
 List<assignPriByRole_model> l=rightdao.viewPrivilage(Integer.parseInt(deptid));
 if(l != null)
 {


for(int i=0;i<l.size();i++)
{ 
	assignPriByRole_model ac= new assignPriByRole_model();
	ac=l.get(i);
	
	
	System.out.println("&&&&&&&&&&&&&&&"+l.get(0).getPrivilagename());
	String rightname=ac.getPrivilagename();
	String pri_id=ac.getPri_id();
	String list[]=rightname.split(",");
	String list2[]=pri_id.split(",");
	for(int j=0;j<list.length;j++)
 	{
 		
 		%>	
 		<option value="<%=list2[j] %>"><%=list[j] %></option>
 		<%
 		
 	} 
}

 }
 %>
 </select></td></tr></table>
 
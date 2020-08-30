<%@page import="Dao.UserManagement.UserRightsDaoImp"%>
<%@page import="InterFace.UserManagement.UserRightsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>

<%@page import="Model.UserManagement.privilage_model"%>
<%@page import="Model.UserManagement.citybean"%>
<script type="text/javascript">
function validate()
{
	var st =document.f1.role.selectedIndex;
	if(st == 0){
		alert("Select the Role.");
		document.f1.role.focus();
		return false;
	}
	
	var u_name=document.f1.Userrights;
	if(u_name.value=="")
		{
			alert("Please Select rights");
			document.f1.Userrights.focus();
			return false;
		}
	return true;
}


</script>

		
		<form name="f1" action="UserPrivilageController" method="post"> 

   <div class="content-section" style="width:800px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">Assign Privilage</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table table-condensed">
                                          
                                            <tbody>
												  <tr>
                                                    <td class="col-md-4">Role</td>
                                                    <td class="col-md-8">
                                               
												  <select class="form-control" name="role"  >
                                                           
                                                        	<option>--Select Role--</option>
									<%
		
				Role b1=new Role();
				Generics<Role> g1=new GenericsDaoImp<Role>();
				List<Role> list=g1.viewData(b1);
		
	
								
for(Role u:list)
{
%>
<option value="<%=u.getRoleid()%>"><%=u.getRoleType()%></option>
<%} %>

                                                        </select></td>
                                                       <td>  <input type="button" class="form-control various fsv-update"   href="AddRole.jsp" value="+" data-fancybox-type="iframe"/></td></tr>
                                                        <tr>
                                                    <td class="col-md-4">Privilage</td>
                                                      <td class="col-md-8" colspan="2">
                                                <select name="Userrights" style="color: gray" id="userright" class="form-control" multiple="multiple">

 <%


  UserRightsDao rightdao=new UserRightsDaoImp();
 List<privilage_model> l=rightdao.viewprivilage();
 if(l != null)
 {


for(int i=0;i<l.size();i++)
{ 
	privilage_model ac= new privilage_model();
	ac=l.get(i);
	
	
		
 		%>
 		<option value="<%=ac.getPrivilagename()%>"><%=ac.getPrivilagename() %></option>
 		<%
 		
 	 
}
 }
else
{%>
	<option>No rights assign</option>
	
<%}



 %>
 </select></td>
 
                                                
                                                </tr>                                         	
												
                                                         <tr>
                                                 <td colspan="3"><input type="submit"  value="Assign" name="btnsubmit" onClick="return validate()" class="btn btn-default style3" >
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
								
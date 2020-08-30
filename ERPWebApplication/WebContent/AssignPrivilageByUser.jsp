<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function getUserName(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="getDataByRoleId.jsp";
      url +="?deptid=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("Username").innerHTML=xmlHttp.responseText   
      }   
      }
  
      function validate()
      {
      	var st =document.f1.role.selectedIndex;
      	if(st == 0){
      		alert("Select the Role.");
      		document.f1.role.focus();
      		return false;
      	}
      	var u_name=document.f1.username.selectedIndex;
      	if(u_name == 0)
      		{
      			alert("Please Select User");
      			document.f1.username.focus();
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
		
		<form name="f1" action="UserPrivilageController" method="post" onsubmit="return validate()"> 

   <div class="content-section" style="width:800px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                <a class="closethis"></a>
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
                                               
												 <select id="menu" name="role" class="form-control" onchange="getUserName(this.value)">
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

									
									 
								</select> </td><td><input type="button" class="form-control  various fsv-update"   href="AddRole.jsp" value="+" data-fancybox-type="iframe"/></td></tr>
                          <tr>  <td colspan="3">   <div  id="Username" name="username">
							
							
							
								</div></td></tr>
							
						
						<tr>	<td colspan="3"><div class="form-group">
							
							 <input type="submit" class="btn btn-default style3" value="Assign Rights" name="btnsubmit"></div>
					
							</div></td></tr>
								</div>
			        </div></div></div></div>
							</div>
							</table>
							</form>

                                                       
											</tbody>
								
								</div>
								</div>
								</div>
								</div>
								</div>			
								</div>
								</div>
							
								
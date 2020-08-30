<%@page import="Model.UserManagement.privilage_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<script type="text/javascript">


   function validate()
      {
      	var st =document.f1.privilage.selectedIndex;
      	if(st == 0){
      		alert("Select the Privilage.");
      		document.f1.privilage.focus();
      		return false;
      	}
      	
      
      	var c_name=document.f1.componentname;
      	if(c_name.value=="")
      		{
      			alert("Please Enter Component");
      			document.f1.componentname.focus();
      			return false;
      		}
    		return true;
      }
	function addpri()
	{
		
		var a1=document.f1;
		a1.action="NewHomePage.jsp?p=AddPrivilages";
		a1.submit();

	}
	
   </script>
      

<form name="f1" action="UserPrivilageController" method="post" onsubmit="return validate()" autocomplete='off'> 


   <div class="content-section" style="width:800px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                                
                                <header>
                                    <h2 class="heading">Add Component</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis"></a>
                                    <div class="table-box">
                                        <table class="table table-condensed">
                                           
                                            <tbody>
												  <tr>
                                                    <td class="col-md-4">Privilage</td>
                                                    <td class="col-md-8">
                                               
												  <select class="form-control" name="privilage"  >
                                                           
                                                        	<option>--Select privilage--</option>
									<%
		
				privilage_model pc=new privilage_model();
										
				Generics<privilage_model> g1=new GenericsDaoImp<privilage_model>();
				List<privilage_model> list1=g1.viewData(pc);
		
	
								
for(privilage_model u:list1)
{
%>
<option value="<%=u.getPri_id()%>"><%=u.getPrivilagename()%></option>
<%} %>

                                                        </select></td>
                                                        <td>  <input type="button" class="form-control various fsv-update"   href="AddPrivilages.jsp" value="+" data-fancybox-type="iframe"/></td></tr>
                                                        <tr>
                                                    <td class="col-md-4">Component</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Component" class="form-control" name="componentname"></td>
                                                    <td></td>
                                                </tr>                                         	
												
                                                         <tr>
                                                 <td colspan="3"><input type="submit"  value="Add" class="btn btn-default style3" name="btnsubmit" >
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
								
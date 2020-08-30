
<%@page import="Dao.UserManagement.UpdateDaoImp"%>
<%@page import="InterFace.UserManagement.UpdateDao"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="java.util.List"%>
 <%@page import="Model.UserManagement.countrybean"%>
 <%@page import="Model.UserManagement.Role"%>
 <%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%> 

<%
UserModel b=new UserModel();
UpdateDao a=new UpdateDaoImp();

String id=request.getParameter("hid");
System.out.println("id is===="+id+"");
List<UserModel> l=a.updateitem(Integer.parseInt(id));
%>
     <script>
     $(function() {
    	    $( "#bdate_id" ).datepicker({dateFormat: 'yy-mm-dd',changeMonth:true,changeYear:true, yearRange: '-50y:c+nn'});
    	  });
    	  
     $(function() {
         $( "#datepicker" ).datepicker({
             dateFormat : 'mm/dd/yy',
             changeMonth : true,
             changeYear : true,
             yearRange: '-100y:c+nn',
             maxDate: '-1d'
         });
     });
     

    	  
   </script>



<script type="text/javascript">


var xmlHttp  
var xmlHttp 
function showState(str)
{
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
    var url="stateservlet";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("state").innerHTML=xmlHttp.responseText   
    }   
}

function showCity(str){
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
    var url="cityservlet";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange1;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
  
}
function stateChange1(){   
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("city").innerHTML=xmlHttp.responseText   
    }   
}

</script>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form name="f1"  method="post" action="UserActionController" >
	<input type="hidden" name="hid2" value='<%=id %>'>
   <div class="content-section" style="width:800px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">Add User</h2>
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
                                                    <td class="col-md-8">
                                                        <select class="form-control" name="role">
                                                           <option>--Select Role--</option>
									<%
		
				Role b1=new Role();
				UserModel u1=new UserModel();
				AddInsertDao aa=new AddInsertDaoImp();
				List<Role> r=aa.viewGetRole(l.get(0).getRoleid());
	
								
for(UserModel u:l)
{
%>
<option value="<%=r.get(0).getRoleid()%>"><%=r.get(0).getRoleType()%></option>
<%} %>

									
</select>
                                                         <td>  <input type="button" class="form-control various fsv-update"   href="AddRole.jsp" value="+" data-fancybox-type="iframe"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-4">User Name</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Username" class="form-control" name="username" value='<%=l.get(0).getUsername() %>'></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">First Name</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Firstname" class="form-control" name="firstname" value='<%=l.get(0).getFirstname() %>'></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">Last Name</td>
                                                    <td class="col-md-8"><input type="text" placeholder="lastname" class="form-control" name="lastname" value='<%=l.get(0).getLastname() %>'></td>
                                                </tr>
                                               <tr>
                                                    <td class="col-md-4">Address</td>
                                                    <td class="col-md-8"><textarea rows="3" class="form-control" name="address" value='<%=l.get(0).getAddress() %>'></textarea></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">Emailaddress</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Email" class="form-control" name="emailaddress" value='<%=l.get(0).getEmailaddress() %>'></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">Contact No</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Contact" class="form-control" name="contactno" value='<%=l.get(0).getContactno() %>'></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">Fax No</td>
                                                    <td class="col-md-8"><input type="text" placeholder="Fax" class="form-control" name="faxno" value='<%=l.get(0).getFaxno() %>'></td>
                                                </tr>
                                                 <tr>
                                                    <td class="col-md-4">BirthDate</td>
                                                    <td class="col-md-8"><input type="text" placeholder="BirthDate" class="form-control" name="birth_date" id="bdate_id" value='<%=l.get(0).getBirthdate() %>'></td>
                                                </tr>
                                               
                                                 <tr>
                                                    <td class="col-md-4">Country</td>
                                                    <td class="col-md-8">
                                                        <select class="form-control" name="country" onchange="showState(this.value)" value='<%=l.get(0).getCid() %>' >
                                                           
                                                            <option value="-1">--Select Country--</option>
						
                                    <%

										countrybean bb=new countrybean();
										Generics<countrybean> g=new GenericsDaoImp<countrybean>();
										List<countrybean> list2=g.viewData(bb);
									for(countrybean u:list2)
									{
										%>
											System.out.println("cid========"+<%=u.getCid() %>
									<option value="<%=u.getCid()%>"><%=u.getCname()%></option>
									<%} %>
                                                        </select>
                                                    </td>
                                                     <td>  <input type="button" class="form-control various fsv-update"   href="AddCountry.jsp" value="+" data-fancybox-type="iframe"/></td>
                                                </tr>
                                                <tr>
                                                 <tr>
                                              <tr> <td class="col-md-4">State </td><td><div id='state'>
                                            
                                                   </div> </td>
                                                    
                                                 
                                                     <td>  <input type="button" class="form-control various fsv-update"   href="AddState.jsp" value="+" data-fancybox-type="iframe"/></td>
                                                </tr>
                                                
                                                 <tr> <td class="col-md-4">City </td><td><div id='city'>
                                            
                                                   </div> </td>
                                                    
                                                 
                                                     <td>  <input type="button" class="form-control  various fsv-update" value="+" href="AddCity.jsp" data-fancybox-type="iframe"></td>
                                                </tr>
                                                
                                            
                                                    <tr>
                                                 <td>   <label for="text-input">Upload photo</label></td>
								<td><input type="file" id="text-input" class="form-control" value="upload photo"></td>
							   </tr>
                                               <tr>
                                                 <td><input type="submit"  value="Update" class="btn btn-default style3"  name="btnclick">
                                                <input type="submit"  value="Cancel" class="btn btn-default style3"  name="btnclick"></td>
                                                 </tr>
                                                 </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Content Section End -->
</form>
<script>
		jQuery(document).ready(function() {		
			App.setPage("AddUser");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	
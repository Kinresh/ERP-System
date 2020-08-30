  <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
<%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<%@page import="Model.SalesManagement.ScheduleCall_model"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="java.util.List"%>
<%@page import="Model.SalesManagement.company_model"%>
<%@page import="Model.UserManagement.UserModel"%>

<script type="text/javascript">
function exit()
{
	var a2=document.schedulecall_form;
	a2.action="NewHome.jsp?p=AddScheduleCall";
	a2.submit();
}
function f1()
{
	var ff=document.schedulecall_form;
	ff.action="NewHome.jsp?p=Customer";
	ff.submit();
	
}
</script>
<script type="text/javascript">

function validation(){
	 var summ=document.schedulecall_form.summary;
	 if(summ.value==""){
		 summ.focus();
		 return false;
	 }
	 
	 
	 var con=document.schedulecall_form.contact.selectedIndex;
	 if(con==0){
		 alert("Select the contact");
		 document.schedulecall_form.contact.focus();
		 return false;
	 }
	 
	
	 
	 var res=document.schedulecall_form.responsible.selectedIndex;
	 if(res==0){
		 alert("Select the Responsible Person");
		 document.schedulecall_form.responsible.focus();
		 return false;
	 }
		return (true);
  }
  </script>
  <script type="text/javascript">


var xmlHttp  
var xmlHttp 
function ViewScheduleCalls(str)
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
    var url="ViewScheduleCall";
    url +="?count=" +str;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    go();
   
    
}

function stateChange(){
	
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("view").innerHTML=xmlHttp.responseText   
    }   
}
</script>

  <div class="block">                  
<form name="schedulecall_form" method="post" action="CustomerCallController"
	 autocomplete='off'   >
	<div class="content-section">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2>
							Scheduled.. /New
							</br>
							</br>
								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 120px; height: 30px" value="Schedule Call" onclick="return validation()"/>
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" onclick="exit()" value="Cancel" />
									
								</h2>
							
						</header>
						

<hr />            
	

								<table style="margin-left: 25px;" id="tbl1" cellpadding="10"  class="table table-condensed" cellspacing="10" border="0">
								<tr>
								<% String sum=request.getParameter("summary"); %>
								<% int con=Integer.parseInt(request.getParameter("contact")); %>
								<% int res=Integer.parseInt(request.getParameter("responsible")); %>
							<input type="hidden" name="hid" value="ScheduleOtherCall">
							<input type="hidden" name="v1" value='<%=sum%>'>
							<input type="hidden" name="v2" value=<%=con %>>
							<input type="hidden" name="v3" value=<%=res %>>
								<td colspan="3">
                            					<% String summary=request.getParameter("summary"); %>
                            					<input type="text" class="form-control" name="summary" style="width:400px; height: 45px;" value='<%=summary %>'  placeholder="Call Summary"/></td>
                            				</tr>
								<tr>
								
									<td>
										<table id="tbl2"  class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            						          						
					<td>Action</td>
					<td>
						<select name="action" class="form-control">
						<option disabled selected></option>
						<option value="schedulecall" selected>Schedule a Call</option>
						<option value="loggedcall">Logged Call</option>
						</select></td>
               									
                            						</tr>
                            				
                            					<%  String cont=request.getParameter("contact");
                            					int cid=Integer.parseInt(cont);
                            					AddInsertDao aaa=new AddInsertDaoImp();
                            					List<customer_model>lc=aaa.viewCustomerBycustid(cid);
                            					
                            					
                            				
                            					
                            					%>
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td>
														<a href="UserController?action=ViewCustomer&id=<%=cid %>" name="abc"><%=lc.get(0).getCustomername()%></a>
														</td>
													
														</tr>
														  
                             <tr>
                  	<td>Planned Date</td><td><input type="text" class="form-control" name="scheduledate" id="bdate_id" /></td><td></td>
				</tr>
						<tr>
                            					
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="view" cellpadding="10" cellspacing="10" class="table table-condensed" style="border-spacing: 100px 100px;">
												 <tr>
                            	<td>Assigned To</td>
                            	<td>
                            	<select name="responsible" class="form-control">
                            		
                            		<%
                            		Integer id11 = (Integer) session.getAttribute("id1");
                            			AddInsertDao ua= new AddInsertDaoImp();
                            			List<UserModel> list=ua.viewUserData(id11, 0);
                            		for(int j=0;j<list.size();j++){
																%>
																	<option value=<%=list.get(j).getUserid() %>><%=list.get(j).getUsername() %></option>
																<%} %>
                            	</select>
                            	</td><td></td>
                            </tr>
											
												<tr>
                            					<td></td>
                            					<td></td>
                            				</tr>
                            				<tr>
                            					<td></td>
                            					<td></td>
                            				</tr>
											
                            				<tr>
                            					<td></td>
                            					<td></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
							
								
							</table>
	</form>
			 			</div>
			 			
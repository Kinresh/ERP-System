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
	a2.action="NewHome.jsp?p=ScheduleCalls";
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
	 var dt=document.schedulecall_form.scheduledate;
	 if(dt.value==""){
		 alert("Select the date");
		 dt.focus();
		 return false;
	 }
	 
	 var con=document.schedulecall_form.contact.selectedIndex;
	 if(con==0){
		 alert("Select the contact");
		 document.schedulecall_form.contact.focus();
		 return false;
	 }
	 
	 var cate=document.schedulecall_form.category.selectedIndex;
	 if(cate==0){
		 alert("Select the category");
		 document.schedulecall_form.category.focus();
		 return false;
	 }
	 
	 var prio=document.schedulecall_form.priority.selectedIndex;
	 if(prio==0){
		 alert("Select the Priority");
		 document.schedulecall_form.priority.focus();
		 return false;
	 }
	 
	 var res=document.schedulecall_form.responsible.selectedIndex;
	 if(res==0){
		 alert("Select the Responsible Person");
		 document.schedulecall_form.responsible.focus();
		 return false;
	 }
	 var ds=document.schedulecall_form.description;
	 if(ds.value==""){
		 alert("Enter the Descrption.");
		 ds.focus();
		 return false;
	 }
	 var p=document.schedulecall_form.phone.value;
		var m1=document.schedulecall_form.mobile1.value;
		var m2=document.schedulecall_form.mobile2.value;
		if(m1=="" && m2=="" && p==""){
			alert("Please provide phone no or one Mobile no");
			document.schedulecall_form.mobile1.focus();
			return false;
		}
	var phoneno = /^\d{10}$/;  
	if(m1 != "")
	{
	if(!phoneno.test(m1))
	{
		alert("You have entered an invalid phone number");
		document.schedulecall_form.mobile1.focus();
		return false;
	}
	}
	
	if(m2 !=""){
	if(!phoneno.test(m2))
	{
		alert("You have entered an invalid phone number");
		document.schedulecall_form.mobile2.focus();
		return false;
	}
	}
	if(p !=""){
	   	if(!phoneno.test(p))
	   	{
	   		alert("You have entered an invalid phone number");
	   		document.schedulecall_form.phone.focus();
	   		return false;
	   	}
	   	}
	 
		return (true);
  }
  function btvalidate()
  {
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
		var ac=document.schedulecall_form;
		ac.action="NewHome.jsp?p=ScheduleOtherCall";
		ac.submit();
	  
	  
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
	 autocomplete='off' >
	<div class="content-section" style="width:900px;">
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
									style="width: 56px; height: 30px" value="Save"  onclick="return validation()"  />
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" onClick="exit()" value="Cancel" />
									
								</h2>
							
						</header>
						
<div style="margin-left: 66%;">
<input type="radio" value="Confirmed" class="greenbutns" name="status" checked="checked" />Confirmed
<input type="radio" value="Cancelled" class="btn" name="status" />Cancelled
<input type="radio" value="Pending" class="btn" name="status" />Pending
<input type="radio" value="Held" class="btn" name="status" />Held

</div>
<hr />            
	<div style="margin-left: 66%;">
	<input type="button" class="form-control btn btn-primary text-center" style="width: 140px; height: 30px"    onclick="btvalidate()"  value="Schedule Other Call" data-fancybox-type="iframe"/>
	
											
	</div> 

								<table  id="tbl1" cellpadding="10"  class="table table-condensed" cellspacing="10" border="0">
								<tr><td colspan="3">
                            					
                            					<input type="text" class="form-control" name="summary" style="width:400px; height: 45px;" placeholder="Call Summary"/></td>
                            				</tr>
								<tr>
								
									<td>
										<table id="tbl2"  class="table table-condensed" style="border-spacing: 100px 100px;" cellpadding="10" cellspacing="10">
											
											 <tr>
                            						
               										<td>Date</td><td><input type="date" class="form-control" name="scheduledate" id="bdate_id" /></td><td></td>
                            						</tr>
                            				
                            					
                            							<tr>
														<td>Contact&nbsp;&nbsp;&nbsp;</td>
														<td><select onchange="ViewScheduleCalls(this.value);"  class="form-control" name="contact">
																<option disabled selected></option>
																<%
																	customer_model cust= new customer_model();
																	GenericsDao<customer_model> gg = new GenericsImp<customer_model>();
																	List<customer_model> cust_list=gg.viewData(cust);
																	for(int i=0;i<cust_list.size();i++){
																%>
																	<option value=<%=cust_list.get(i).getCustomerid() %>><%=cust_list.get(i).getCustomername() %></option>
																<%} %>
															</select>
															
														</td>
														<td>   <input type="button" class="form-control text-center"  style="width: 34px; height: 33px" value="+" onClick="f1()"/></td>
														</tr>
														  
                             <tr>
                            						
					<td>Category</td>
					<td>
						<select name="category" class="form-control">
						<option disabled selected></option>
						<option value="inbound">Inbound</option>
						<option value="inbound">outbound</option>
						</select></td>
				</tr>
						<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority" class="form-control">
	                            						<option disabled selected></option>
	                            						
	                            							<option value="Highest">Highest</option>
	                            							<option value="Middle">Middle</option>
	                            							<option value="Lowest">Lowest</option>
	                            					
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>	
													
              
											
                            				
                          
                            	
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="view" cellpadding="10" cellspacing="10" class="table table-condensed" style="border-spacing: 100px 100px;">
												 <tr>
                            	<td>Responsible</td>
                            	<td>
                            	<select name="responsible" class="form-control">
                            		<option disabled selected></option>
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
                            					<td>Phone No</td>
                            					<td><input type="text" class="form-control" name="phone" /></td>
                            				</tr>
                            				<tr>
                            					<td>Mobile (1)</td>
                            					<td><input type="text" class="form-control" name="mobile1" /></td>
                            				</tr>
											
                            				<tr>
                            					<td>Mobile (2)</td>
                            					<td><input type="text"  class="form-control" name="mobile2" /></td>
                            				</tr>
                    				
											
				
                              
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea style="width: 95% !important;" class="form-control" rows="5" name="description" placeholder="Description"></textarea><input type="hidden" name="hid" value="Addschedulecall"/></td>
									
								</tr>
								
							</table>
	</form>
			 			</div>
			 			
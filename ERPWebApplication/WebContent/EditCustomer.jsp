
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.company_model"%>
<%@page import="java.util.List"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Model.SalesManagement.Title_model"%>
<%@page import="java.util.List"%>

 <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
  
  <script type="text/javascript">


function addcompany()
{
	var a2=document.cust_update_form;
	a2.action="NewHome.jsp?p=Company";
	a2.submit();

}

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
</script>



<%
	String cust_id=request.getParameter("id");
	System.out.print("------id--------"+cust_id);
	AddInsertDao aa= new AddInsertDaoImp();
	List<customer_model> cust_e_list=aa.viewCustomerDetail(cust_id);
	String iscompany=cust_e_list.get(0).getIs_company();
	String url="UserController?action=ViewCustomer&id="+cust_id;
	%>
	<div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
  <form action="CustomerUpdateController" method="post" name="cust_update_form" >
 
  						 <div class="table-box" style="width:1000px">
  						     <div class="block">                       
                        		<h1>Customers /<%=cust_e_list.get(0).getCustomername() %></h1>
                       		 </div>
						   <div class="block">
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or<a href="<%=url %>" style="margin-left:10px;" >Cancel</a><hr />   
							<table style="margin-left: 25px;" id="tbl1" cellpadding="10" cellspacing="10" class="table table-condensed">
								<tr>
									<td>
										<table  class="table table-condensed" id="tbl2" style="border-spacing: 100px 100px;" cellpadding="5" cellspacing="5">
											
											 <tr>
                            					<td>Name</td>
                            					<td><input type="text" class="form-control" name="customer" onfocus="this.select();" value="<%=cust_e_list.get(0).getCustomername() %>"></td><td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Email</td>
                            					<td><input type="text" name="email" class="form-control" onfocus="this.select();" value="<%=cust_e_list.get(0).getEmailid() %>"></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text" name="website" class="form-control" onfocus="this.select();" value="<%=cust_e_list.get(0).getWebsite() %>"></td><td></td>
                           						 </tr>
                             					 
                            				
                           					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" name="faxno" onfocus="this.select();" class="form-control"  value="<%=cust_e_list.get(0).getFaxno()%>"></td>
                           		 </tr>
                           		  <tr>
                            					<td></td>
                            					<td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile(1)</td>
                            					<td><input type="text" class="form-control" name="mobile1" onfocus="this.select();" value="<%=cust_e_list.get(0).getMobile1() %>"></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile(2)</td>
                            					<td><input type="text"  class="form-control" name="mobile2" onfocus="this.select();" value="<%=cust_e_list.get(0).getMobile2() %>"></td><td></td>
                           					 </tr>
                           					 	 	
				 						
                           	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8" cellspacing="8" class="table table-condensed">
										<%
											if(iscompany.equals("Y")){
										%>
									<tr>
                            					<td>Company</td>
                            					<td><select  class="form-control" name="company">
                            							<option disabled selected>--select company--</option>
                            							<%
                            								company_model co= new company_model();
                            								GenericsDao<company_model> gc_obj= new GenericsImp<company_model>();
                            							
            												List<company_model> comp_list=aa.viewcompanydetail(cust_e_list.get(0).getCompanyid());

            			                   						
                            								for(int i=0;i<comp_list.size();i++)
                            								{
                            							%>
                            								<option value=<%=comp_list.get(i).getCompanyid() %> <%if(Integer.toString(comp_list.get(i).getCompanyid()).equalsIgnoreCase(Integer.toString(cust_e_list.get(0).getCompanyid()))){ %> selected<%} %>><%=comp_list.get(i).getCompanyname() %></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					<td><input type="button" class="form-control text-center"
											 style="width: 33px; height: 34px"
											value="+" onclick="addcompany()" > </td>
								
                            				</tr>
                            			<%} %>
								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" class="form-control" name="address" onfocus="this.select();"><%=cust_e_list.get(0).getAddress() %></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td>
									<select name="country"  class="form-control" onchange="showState(this.value)" id="country">
										<option disabled selected>---Select Country---</option>
										<%
											countrybean cnty=new countrybean();
											GenericsDao<countrybean> gm=new GenericsImp<countrybean>();
										
											List<countrybean> lst=gm.viewData(cnty);
											for(int i=0;i<lst.size();i++){
										%>
											<option value=<%=lst.get(i).getCid() %><%if(Integer.toString(lst.get(i).getCid()).equalsIgnoreCase(Integer.toString(cust_e_list.get(0).getCid()))){ %> selected<%} %>><%=lst.get(i).getCname() %></option>
										<%
											}
										%>
									</select>
								</td>
						 		<td><input type="button"  class="form-control various fsv-update" href="AddCountry.jsp"  style="width:33px;height:34px;" value="+" data-fancybox-type="iframe"/></td>
								</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" class="form-control" >
						<option>---Select State---</option>
						<%
						AddInsertDao aa1= new AddInsertDaoImp();
						List<statebean> s_list= aa1.viewstate(cust_e_list.get(0).getCid());
						for(int i=0;i<s_list.size();i++){
						%>	
							<option value=<%=s_list.get(i).getSid()%><%if(Integer.toString(s_list.get(i).getSid()).equalsIgnoreCase(Integer.toString(cust_e_list.get(0).getSid()))){ %> selected<%} %>><%=s_list.get(i).getStatename() %></option>
						<%} %>
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" href="AddState.jsp"  style="width:33px;height:34px;" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city" class="form-control" >
							<option>---Select City---</option>
							<%
								List<citybean> city_list= aa1.viewcity(cust_e_list.get(0).getSid());
							for(int i=0;i<city_list.size();i++){
							%>
								<option value=<%=city_list.get(i).getCityid()%><%if(Integer.toString(city_list.get(i).getCityid()).equalsIgnoreCase(Integer.toString(cust_e_list.get(0).getCityid()))){ %> selected<%} %>><%=city_list.get(i).getCityname()%></option>
							<%} %>
						</select></div></td>
						 <td><input type="button"  class="form-control various fsv-update" href="AddCity.jsp" value="+"  style="width:33px;height:34px;" data-fancybox-type="iframe"/></td>
				</tr>
								<% 
									if(iscompany.equals("Y")){
								%>
									<tr>
                           		 	<td>Job Position</td>
                           		 	<td><input type="text"  class="form-control" name="jobposition" onfocus="this.select();" value="<%=cust_e_list.get(0).getJobposition() %>"></td><td></td>
                           		 </tr>
                           		 
                           		<% }
									else{%>
									                            			<tr style="display:none"><td></td><td><br /><br /><br /><br /></td><td></td></tr>
									
									<% }%>
                           					<tr>
                           		 <td>Title</td>
                          			<td>
                          			
                          				<select name="title" class="form-control" >
                          					<option disabled selected>--Select Title--</option>
                          					<%
                          				GenericsDao<Title_model> genn= new GenericsImp<Title_model>();
                          				Title_model t1= new Title_model();
                          				List<Title_model> title_list=genn.viewData(t1);
                          				for(int i=0;i<title_list.size();i++)
                          				{
                          				
                          					%>
                          					<option value=<%=title_list.get(i).getTitleid() %><%if(Integer.toString(title_list.get(i).getTitleid()).equalsIgnoreCase(Integer.toString(cust_e_list.get(0).getTitleid()))){ %> selected<%} %>><%=title_list.get(i).getTitle() %></option>
                          					<%} %>
                          				</select>
                          				<td><input type="button" class="form-control various fsv-update" style="width:33px;height:34px;" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>
                          			</td></tr> 
										</table>
									</td>
									
						 		
								</tr>
							
								<table id="tbl4" cellspacing="5" cellpadding="5" border="0"  class="table" style="border-spacing: 30px 30px;">	
								<tr>
                          			

                          		</tr>
                          	
                          		
									
                          			<tr>
                           	<td>Internal Note
                           <textarea rows="3" cols="20" class="form-control" name="description" onfocus="this.select();"><%=cust_e_list.get(0).getDescription() %></textarea></td>
                           	</tr>
                            
                            	<input type="hidden" value="editcustomer" name="hid" /><input type="hidden" value='<%=cust_id %>' name="custid"/>
                            	
                           
										</table>
									
							</table>
		     	
			 			</form>
			 			</div>     </div>
			 			</div>
			 			</div>
			 			</div>
			 			</div>
			 			
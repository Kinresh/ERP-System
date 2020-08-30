  
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>

<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.SuppTitle_model"%>
<%@page import="Model.PurchaseManagement.SuppCompany_model"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
   <head>
  
  
  <script type="text/javascript">
  var xmlHttp;
  function showState(id){
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
      var url="stateservlet?count="+id;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }

  function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("state").innerHTML=xmlHttp.responseText;   
      }   
  }
  function showCity(s_id){
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
      url +="?count=" +s_id;
      xmlHttp.onreadystatechange = cityChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
  }
  function cityChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("city").innerHTML=xmlHttp.responseText;   
      }   
  }
  
  function showDescription(){
	  var xmlhttp;
	  if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  xmlhttp.onreadystatechange=function()
	    {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	      {
	      document.getElementById("description").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","Ajaxservlet?value=description",true);
	  xmlhttp.send();
  }
  </script>
  <style type="text/css">
  .button11
  {
  margin-bottom: 7px !important;

font-size: 20px;
  }
  </style>
</head>
<%
	String edit_id=request.getParameter("id");
	PurchaseDao pd=new PurchaseDaoImp();
	ArrayList<Supplier_model> s_lst=pd.viewSupplierInfo(Integer.parseInt(edit_id));
	String iscompany=s_lst.get(0).getIs_company();
	String url="NewHome.jsp?p=ViewSupplier&id="+edit_id;
%>
                <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                
                                <div class="contents">
                                    <a class="togglethis"></a>
                      
                        <div class="table-box" style="width:1000px">
  						     <div class="block">                       
                        		<h1>Suppliers /<%=s_lst.get(0).getSuppliername()%></h1>
                       		 </div>
                       		 <form action="PurchaseUpdateController" method="post" name="supplier_edit_form" >
						   <div class="block">
						    <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or<a href="<%=url %>" style="margin-left:10px;" >Cancel</a><hr />
						  
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              
							 <div class="table-box" style="width:1000px">
							<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="10" cellspacing="10">
								<tr>
									<td>
										<table id="tbl2" style="border-spacing: 100px 100px;" cellpadding="5"  class="table table-condensed" cellspacing="5">
											
											 <tr>
                            					<td>Name</td>
                            					<td><input type="text" class="form-control"  name="sup_name" onfocus="this.select();" value="<%=s_lst.get(0).getSuppliername() %>"></td><td></td>
                            				</tr>
                            				
                            				<tr>
                            					<td>Email</td>
                            					<td><input type="text" class="form-control" name="e_name" onfocus="this.select();" value="<%=s_lst.get(0).getEmailid()%>"></td><td></td>
                           						 </tr>
                             
                            				 <tr>
                            				  <tr>
                            					<td>Web Site</td>
                            					<td><input type="text"  class="form-control" name="website" onfocus="this.select();" value="<%=s_lst.get(0).getWebsite() %>"></td><td></td>
                           						 </tr>
                             					 
                            				
                           					 <tr>
                            					<td>Fax</td>
                            					<td><input type="text"  class="form-control" name="fax" onfocus="this.select();" value="<%=s_lst.get(0).getFaxno()%>"></td><td></td>
                           						 </tr>
                           		  <tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phn_no"  class="form-control" onfocus="this.select();" value="<%=s_lst.get(0).getPhone() %>"></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="m_no1"  class="form-control" onfocus="this.select();" value="<%=s_lst.get(0).getMobile1() %>"></td><td></td>
                           					 </tr>
                           					 <tr>
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="m_no2" class="form-control" onfocus="this.select();" value="<%=s_lst.get(0).getMobile2() %>"></td><td></td>
                           					 </tr>
                           					 	 	
				 						
                           	
                           					 
                            				
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="tbl3" cellpadding="8" class="table table-condensed" cellspacing="8">
										<%
											if(iscompany.equals("Y")){
										%>
									<tr>
                            					<td>Company</td>
                            					<td><select name="company_field" id="s2_1"  class="form-control" style="width: 100%;">
                            							<option value="0"></option>
                            							<%
                            								SuppCompany_model co=new SuppCompany_model();
                            								GenericsDao<SuppCompany_model> gc_obj= new GenericsImp<SuppCompany_model>();
                            								List<SuppCompany_model> com_list=gc_obj.viewData(co);
                            								for(int i=0;i<com_list.size();i++)
                            								{
                            							%>
                            								<option value=<%=com_list.get(i).getSuppcompanyid() %> <%if(Integer.toString(com_list.get(i).getSuppcompanyid()).equalsIgnoreCase(Integer.toString(s_lst.get(0).getSuppcompanyid()))){ %> selected<%} %>><%=com_list.get(i).getCompanyname() %></option>
                            							<%} %>
                            						</select>
                            					</td>
                            					<td><input type="button" class="form-control" style="width:34px;height:32px;" onclick="window.location.assign('NewHome.jsp?p=AddSuppCompany');" value="+"/></td>
                            				</tr>
                            			<%} %>
								<tr>
                            		<td>Address</td>
                            		<td><textarea rows="3" cols="20" name="address" class="form-control" onfocus="this.select();"><%=s_lst.get(0).getAddress() %></textarea></td><td></td>
                            	</tr>
								<tr>
									<td>Country</td>
								<td>
									<select name="country" onchange="showState(this.value)" class="form-control" id="country">
										<option disabled selected>---Select Country---</option>
										<%
											countrybean cnt=new countrybean();
											GenericsDao<countrybean> gm=new GenericsImp<countrybean>();
											List<countrybean> lst=new ArrayList<countrybean>();
											lst=gm.viewData(cnt);
											for(int i=0;i<lst.size();i++){
										%>
											<option value=<%=lst.get(i).getCid() %><%if(Integer.toString(lst.get(i).getCid()).equalsIgnoreCase(Integer.toString(s_lst.get(0).getCid()))){ %> selected<%} %>><%=lst.get(i).getCname()%></option>
										<%
											}
										%>
									</select>
								</td>
						 		<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="AddCountry.jsp" value="+" data-fancybox-type="iframe"/></td>
								</tr>
				<tr>
					<td>State</td>
					<td><div id="state">
						<select name="state" id="istate"  class="form-control" onchange="showCity(this.value);">
						<option disabled>---Select State---</option>
						<%
						AddInsertDao d_obj= new AddInsertDaoImp();
						List<statebean> st_list= d_obj.viewstate(s_lst.get(0).getCid());
						for(int i=0;i<st_list.size();i++){
						%>	
							<option value=<%=st_list.get(i).getSid()%><%if(Integer.toString(st_list.get(i).getSid()).equalsIgnoreCase(Integer.toString(s_lst.get(0).getSid()))){ %> selected<%} %>><%=st_list.get(i).getStatename() %></option>
						<%} %>
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="AddState.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><div id="city">
						<select name="city"  class="form-control" id="icity">
							<option disabled>---Select City---</option>
							<%
								List<citybean> city_list= d_obj.viewcity(s_lst.get(0).getSid());
							for(int i=0;i<city_list.size();i++){
							%>
								<option value=<%=city_list.get(i).getCityid() %><%if(Integer.toString(city_list.get(i).getCityid()).equalsIgnoreCase(Integer.toString(s_lst.get(0).getCityid()))){ %> selected<%} %>><%=city_list.get(i).getCityname() %></option>
							<%} %>
						</select></div></td>
						 <td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="AddState.jsp" value="+" data-fancybox-type="iframe"/></td>
				</tr>
								<% 
									if(iscompany.equals("Y")){
								%>
									<tr>
                           		 	<td>Job Position</td>
                           		 	<td><input type="text" class="form-control" name="job_position" onfocus="this.select();" value="<%=s_lst.get(0).getJobposition()%>"></td><td></td>
                           		 </tr>
                           		<% }
									else{%>
									                            			<tr><td></td><td><br /><br /><br /><br /></td><td></td></tr>
									
									<% }%>
                           					 
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="tbl4" class="table table-condensed" cellspacing="5" cellpadding="5" border="0" style="border-spacing: 100px 100px;">
									
									
								<tr>
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="title_field" class="form-control">
                          					<option value="0"></option>
                          					<%
                          				GenericsDao<SuppTitle_model> g_obj= new GenericsImp<SuppTitle_model>();
                          				SuppTitle_model t= new SuppTitle_model();
                          				List<SuppTitle_model> t_list=g_obj.viewData(t);
                          				for(int i=0;i<t_list.size();i++)
                          				{
                          				
                          					%>
                          					<option value=<%=t_list.get(i).getSupptitleid() %><%if(Integer.toString(t_list.get(i).getSupptitleid()).equalsIgnoreCase(Integer.toString(s_lst.get(0).getSupptitleid()))){ %> selected<%} %>><%=t_list.get(i).getTitle() %></option>
                          					<%} %>
                          				</select>
                          			</td>
						 		<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                          		
                          		
                          			
                              <tr>
                            	<td><input type="hidden" value="EditSupplier" name="hid" /><input type="hidden" value="<%=edit_id %>" name="edit_id"/></td>
                            	<td>
                            	</td><td></td>
                            </tr>
										</table>
									</td>
								</tr>
								<tr>
                           
                           	<td colspan="3"><textarea rows="3"  class="form-control" cols="25" name="description" style="width:100%;" placeholder="Internal Note"><%=s_lst.get(0).getDescription() %></textarea></td>
                           	</tr>
								
							</table>
		     	
			 			</form>
			 			</div>
						                      
                        </div>
</div>
               </div>   
                       


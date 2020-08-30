 <%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Model.SalesManagement.Lead_model"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Model.SalesManagement.Title_model"%>
<%@page import="Model.SalesManagement.Categories_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	String edit_id=request.getParameter("id");
	AddInsertDao sd_obj= new AddInsertDaoImp();
	ArrayList<Lead_model> l_list=sd_obj.LeadInfo(Integer.parseInt(edit_id));
	String url="UserController?action=ViewLead&id="+edit_id;
%>
   <head>
   
 
  <script type="text/javascript">
  
  
  
  
  function fillInfo(cu_id){
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
	      document.getElementById("cu_info").innerHTML=xmlhttp.responseText;
	      }
	    };
	  xmlhttp.open("post","Ajaxservlet?value="+cu_id,true);
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
                <div class="row-fluid">

               
                        <div class="span11" >   
                        <div class="head clearfix">
                        <h1>&nbsp;&nbsp;&nbsp;&nbsp;Edit Lead</h1>
                        </div>
                        <div class="block"> 
                                       
						  <form action="CustomerUpdateController" method="post" name="lead_edit_form" onsubmit="return validation();">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="submit" class="form-control btn btn-primary text-center" style="width: 56px; height: 30px" value="Save" />&nbsp;&nbsp;or
						    <a href='<%= url%>'style="margin-left:10px;" >Cancel</a>
							<div style="margin-left: 88%;"><input type="radio" name="stage" value="New" <%if(l_list.get(0).getStage().equalsIgnoreCase("new")){ %> checked="checked"<%} %> />New &nbsp;
							<input type="radio" name="stage" value="Dead" <%if(l_list.get(0).getStage().equalsIgnoreCase("Dead")){ %> checked="checked"<%} %> />Dead</div>
							<hr />             
							
							<table style="margin-left: 25px;" class="table table-condensed" id="tbl1" cellpadding="8" cellspacing="8" >
							 <tr>
                            					
                            					<td colspan="3">Subject<br /><input type="text" name="subject" class="form-control" style="width:310px;height: 30px;" value="<%=l_list.get(0).getSubject()%>" onclick="this.select();"/>
                            				</tr>
								<tr>
									<td>
										<table id="tbl2" class="table table-condensed"  style="border-spacing: 100px 100px;" cellpadding="8" cellspacing="8">
											
											<tr>
                            						<td>Lead Date</td>
               										<td><input type="date" class="form-control" name="lead_date" id="bdate_id" value="<%=l_list.get(0).getLeaddt()%>" /></td><td></td>
                            						</tr>
										<tr>
                            				
                           					<tr>
                            					<td>Customer</td>
                            					<td>
	                            					<select onchange="fillInfo(this.value);" class="form-control" name="customer" id="s2_1" style="width: 100%;">
	            
	                            						<%
	                            							 customer_model cus= new customer_model();
	                            							GenericsDao<customer_model> cug_obj= new GenericsImp<customer_model>();
	                            							List<customer_model> cu_list=cug_obj.viewData(cus);
	                            							for(int i=0;i<cu_list.size();i++){
	                            						%>
	                            						<option value=<%=cu_list.get(i).getCustomerid() %><%if(Integer.toString(cu_list.get(i).getCustomerid()).equals(Integer.toString(l_list.get(0).getCustomerid()))){ %> selected<%} %>><%=cu_list.get(i).getCustomername()%></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>
                            				<tr>
                            					<td>Contact Name</td>
                            					<td>
	                         						<input type="text" class="form-control" name="con_name" value="<%=l_list.get(0).getContactname()%>" onclick="this.select();" />
                            					</td>
                            					<td></td>
                            				</tr>
                            				<tr id="title">
                          			<td>Title</td>
                          			<td>
                          			
                          				<select name="title_field" class="form-control">
                          					<option selected value="0">--Select Title--</option>
                          					<%
                          				GenericsDao<Title_model> genn= new GenericsImp<Title_model>();
                          				Title_model t1= new Title_model();
                          				List<Title_model> title_list=genn.viewData(t1);
                          				for(int i=0;i<title_list.size();i++)
                          				{
                          				
                          					%>
                          					<option value=<%=title_list.get(i).getTitleid() %><%if(Integer.toString(title_list.get(i).getTitleid()).equalsIgnoreCase(Integer.toString(l_list.get(0).getTitleid()))){ %> selected<%} %>><%=title_list.get(i).getTitle() %></option>
                          					<%} %>
                          				</select>
                          			</td>
						 		<td><input type="button" class="form-control various fsv-update" style="width:34px;height:32px;" href="Title.jsp" value="+" data-fancybox-type="iframe"/></td>

                          		</tr>
                            				
                          						
                           						 <tr>
                            					<td>Categories</td>
                            					<td>
	                            					<select name="category" class="form-control">
	                            						<option disabled selected>--Select Category--</option>
	                            						<%
	                            							Categories_model cat= new Categories_model();
	                            						GenericsDao<Categories_model> cg_obj= new GenericsImp<Categories_model>();
	                            						List<Categories_model> cg_list=cg_obj.viewData(cat);
	                            						for(int i=0;i<cg_list.size();i++)
	                            						{
	                            						%>
	                            							<option value=<%=cg_list.get(i).getCategoryid() %><%if(Integer.toString(cg_list.get(i).getCategoryid()).equals(Integer.toString(l_list.get(0).getCategoryid()))){ %> selected<%} %>><%=cg_list.get(i).getCategory() %></option>
	                            						<%} %>
	                            					</select>
                            					</td>
                            					<td><input type="button"  style="width:34px;height:32px;" class="form-control various fsv-update" href="Add Categories.jsp" value="+" data-fancybox-type="iframe"/></td>
                            				</tr>
                            				<tr>
                            					<td>Priority</td>
                            					<td>
	                            					<select name="priority" class="form-control">
	                            						<option disabled selected>--Select priority--</option>
	                            					
	                            							<option value="Highest">Highest</option>
	                            							<option value="Lowest">Lowest</option>
	                            						
	                            					</select>
                            					</td>
                            					<td></td>
                            				</tr>
                            				
                           		  <tr>
										</table>
									</td>
									 <td style="width:50px;"></td>
									<td>
										<table id="cu_info" class="table table-condensed"  cellpadding="5" cellspacing="5" border="0" style="border-spacing: 100px 100px;">
										
									<tr>	
                            		<td>Address</td>
                            		<td><textarea rows="3" class="form-control" cols="20" name="address" onclick="this.select();"><%=l_list.get(0).getAddress()%></textarea></td><td></td>
                            	</tr>
								<tr>
                            					<td>Email</td>
                            					<td><input type="text" class="form-control" name="e_name" value="<%=l_list.get(0).getEmail()%>" onclick="this.select();" /></td><td></td>
                           						 </tr>
				
				
                            					 <tr>
                           		 	<td>Fax</td>
                           		 	<td><input type="text" name="fax" class="form-control" value="<%=l_list.get(0).getFax_no() %>" onclick="this.select();" /></td>
                           		 </tr>				
								<tr>
								<tr>
                            					<td>Phone No</td>
                            					<td><input type="text" name="phn_no" class="form-control" value="<%=l_list.get(0).getPhone()%>" onclick="this.select();" /></td><td></td>
                           					</tr>
                              <tr>
                            					<td>Mobile No(1)</td>
                            					<td><input type="text" name="m_no1" class="form-control" value="<%=l_list.get(0).getMobile1()%>" onclick="this.select();" /></td><td></td>
                           					 </tr>
                           					  <tr>
                           					 
                            					<td>Mobile No(2)</td>
                            					<td><input type="text" name="m_no2" class="form-control" value="<%=l_list.get(0).getMobile2()%>" onclick="this.select();" /></td><td></td>
                           					 </tr>
                           
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3"><textarea style="width: 96% !important;" class="form-control" rows="5" onclick="this.select();" placeholder="Description" name="description"><%=l_list.get(0).getDescription() %></textarea></td>
									
								</tr>
								<tr><td><input type="hidden" name="hid" value="editlead"><input type="hidden" name="edit_id" value="<%=edit_id%>"> </td></tr>
							</table>
		 
			 			</form>
			 			</div>
						                      
                        </div>

               </div>   
                       


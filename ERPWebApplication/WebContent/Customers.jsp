<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--// Javascript //-->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<script type="text/javascript">

function f1()
{
	var ff=document.form1;
	ff.action="NewHome.jsp?p=Customer&id="+1;
	ff.submit();
	
}
function clickrow(id)
{
	window.document.location="UserController?action=ViewCustomer&id="+id;
}
function editCustomer(e_id) {
	window.location.assign("NewHome.jsp?p=EditCustomer&id="+e_id+"");
	var ff=document.form1;
	ff.action="NewHome.jsp?p=EditCustomer&id="+e_id+"";
	ff.submit();
	
}
function deletedata(id)
{
	var f=document.form1;
	f.cid.value=id;
	if(confirm("are you sure want to delete record?"))
		{
             f.action="CustomerUpdateController";
         
				
		}

	
	}
</script>

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<%
Integer id11 = (Integer) session.getAttribute("id1");
System.out.print("***************"+id11);

UserModel b=new UserModel();
//Generics<UserModel> g=new Dao<UserModel>();
AddInsertDao aa=new AddInsertDaoImp();
List<customer_model> l=new ArrayList<customer_model>();
Integer user = (Integer) session.getAttribute("user");
	
//	l=aa.viewUserData(user);

	l=aa.viewCustomerByid(id11);



%>


                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
            <!-- Content Section Start -->
        <form name="form1" method="post" action="CustomerUpdateController">
            <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h1 class="heading">
                                        <div class="block">                       
                        		 <div class="block">                       
                        	Customers
                       		 </div>
                        		
                        		
                       		 </div>
                       		 </br>
                                     <input type="button" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Create" onClick="f1()"/></td>
                                     
                                    </h1>
                                </header>
                                <div class="contents">
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="table table-condensed" id="example">
                                            <thead>
                                                <tr>
                                                    <th>Custome Name</th>
                                                    <th>Description</th>
                                                    <th>Email</th>
                                                    <th class="center">Address</th>
                                                    <th>Action</th>
													
                                                </tr>
                                                
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(customer_model u:l)
{
%>											

                                                <tr class="gradeX"  style="cursor: pointer" onclick="clickrow(<%=u.getCustomerid()%>);" >
                                              
                                                  <td><%=u.getCustomername() %></td>
                                                    <td><%=u.getDescription() %></td>
                                                    <td><%=u.getEmailid() %></td>
                                                    <td class="center"><%=u.getAddress() %></td>
                                                 	<td>
           	 
           	 <input type="submit" class="btn btn-success text-center" style="width: 50px; height: 30px;" value="Edit"  onclick="editCustomer(<%=u.getCustomerid()%>);">
           	 <input type="submit" class="btn btn-danger text-center" style="width: 50px;  height: 30px; " value="Delete" onClick="deletedata(<%=u.getCustomerid()%>);" > 
           	  </td>
              
                                                    
                  
                                                </tr>
                                                <%} %>
                                             </tbody>
                                           
                                            <tfoot>
                                                <tr>
                                                    <th><input type="text" name="search_engine" value="Search Customer" class="search_init" /></th>
                                                    <th><input type="text" name="search_browser" value="Search Email" class="search_init" /></th>
                                                    <th><input type="text" name="search_platform" value="Search Mobile" class="search_init" /></th>
                                                    <th><input type="text" name="search_version" value="Search Address" class="search_init" /></th>
                                                   
                                                </tr>
                                            </tfoot>
                                            <tr><td> <input type="hidden" name="cid">  <input type="hidden" name="hid" value="D"></td></tr>
                                        </table>
                                        <script>
                                        	var asInitVals = new Array();			
											$(document).ready(function() {
												var oTable = $('#example').dataTable( {
													"oLanguage": {
														"sSearch": "Search all columns:"
													}
												} );
												
												$("tfoot input").keyup( function () {
													/* Filter on the column (the index) of this element */
													oTable.fnFilter( this.value, $("tfoot input").index(this) );
												} );
												
												
												
												/*
												 * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
												 * the footer
												 */
												$("tfoot input").each( function (i) {
													asInitVals[i] = this.value;
												} );
												
												$("tfoot input").focus( function () {
													if ( this.className == "search_init" )
													{
														this.className = "";
														this.value = "";
													}
												} );
												
												$("tfoot input").blur( function (i) {
													if ( this.value == "" )
													{
														this.className = "search_init";
														this.value = asInitVals[$("tfoot input").index(this)];
													}
												} );
											} );

                                        </script>
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
        </div>
        <!-- Right Section End -->
    </div>
</div>

</form>
<!-- Wrapper End -->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42761673-1', 'extracoding.com');
  ga('send', 'pageview');

</script>


<%@page import="Dao.PurchaseManagement.PurchaseDaoImp"%>
<%@page import="InterFace.PurchaseManagement.PurchaseDao"%>
<%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--// Javascript //-->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.PurchaseManagement.Supplier_model"%>
<%@page import="Model.PurchaseManagement.SuppCompany_model"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page import="Model.SalesManagement.customer_model"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.SalesManagement.AddInsertDao"%>
<%@page import="Dao.Salesmanagement.ScheduleCallDaoImp"%>
<%@page import="Dao.Salesmanagement.AddInsertDaoImp"%>
<script type="text/javascript">

function f1()
{
	var ff=document.form1;
	ff.action="NewHome.jsp?p=AddSupplier";
	
	ff.submit();
	
	
}
function clickrow(id)
{
	window.document.location="UserController?action=ViewSupplier&id="+id;
}
function editSupplier(e_id) {
	window.location.assign("NewHome.jsp?p=EditSupplier&id="+e_id+"");
	var ff=document.form1;
	ff.action="NewHome.jsp?p=EditSupplier&id="+e_id+"";
	ff.submit();
	
}
function deletedata(id)
{
	var f=document.form1;
	f.cid.value=id;
	if(confirm("are you sure want to delete record?"))
		{
             f.action="PurchaseUpdateController";
         
				
		}
}

</script>

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<%
Integer id11 = (Integer) session.getAttribute("id1");
System.out.print("***************"+id11);

 	PurchaseDao pp=new PurchaseDaoImp();
	
	List<Supplier_model> lll=pp.viewSupplierByid(id11);



%>


                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
            <!-- Content Section Start -->
            <form name="form1" method="post" action="UserActionController">
            <div class="content-section">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">
                                    Suppliers</br>
                                    </br>
                                     <input type="button" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Create" onClick="f1()"/></td>
                                    </h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="table table-condensed" id="example">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>Supplier</th>
                                                     <th>Email</th>
                                                    <th>Address</th>
                                                    <th class="center">Mobile</th>
                                                    <th>Status</th>
													
                                                </tr>
                                                
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(Supplier_model s1:lll)
{
%>											
                                                <tr onclick="clickrow(<%=s1.getSupplierid()%>);"  style="cursor: pointer" class="gradeX">
                                                	  <td><%=s1.getSuppliername() %></td>
                                              		<td><%=s1.getEmailid()%></td>
                                                  
                                                    <td><%=s1.getAddress() %></td>
                                                   
                                                    
                                                    <td class="center"><%=s1.getMobile1()%></td>
                                                    <td class="center"> <input type="submit" class="btn btn-success text-center" style="width: 56px; height: 30px" value="Edit"  onclick="editSupplier(<%=s1.getSupplierid()%>);">
           	  <input type="submit" class="btn btn-danger text-center" style="width: 56px; height: 30px" value="Delete" onClick="deletedata(<%=s1.getSupplierid()%>);" ></td>
              
                                                    </td>
                                                                                                        
                                                    
                                                </tr>
                                                <%} %>
                                             </tbody>
                                           
                                            <tfoot>
                                                <tr>
                                                    <th><input type="text" name="search_engine" value="Search Company" class="search_init" /></th>
                                                    <th><input type="text" name="search_browser" value="Search Supplier" class="search_init" /></th>
                                                    <th><input type="text" name="search_platform" value="Search Address" class="search_init" /></th>
                                                    <th><input type="text" name="search_version" value="Search Mobile" class="search_init" /></th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tr><td> <input type="hidden" name="cid"><input type="hidden" name="hid" value="DeleteSupplier"></td></tr>
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


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
<%@page import="Model.PurchaseManagement.Quatation_model"%>
<%@page import="Model.PurchaseManagement.Supplier_model"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<script type="text/javascript">

function f1()
{
	var ff=document.form1;
	ff.action="NewHome.jsp?p=AddQuatation";
	
	ff.submit();
	
	
}
function editProduct(e_id) {
	window.location.assign("NewHome.jsp?p=EditProduct&id="+e_id+"");
	var ff=document.form1;
	ff.action="NewHome.jsp?p=EditProduct&id="+e_id+"";
	ff.submit();
	
}
function clickrow(id)
{
	window.document.location="UserController?action=ViewQuatation&id="+id;
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

PurchaseDao p=new PurchaseDaoImp();
List<Quatation_model> l=new ArrayList<Quatation_model>();
	l=p.viewQuatationByid(id11);



%>


                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
            <!-- Content Section Start -->
            <form name="form1" method="post" action="UserActionController">
            <div class="content-section" style="
    width: 1000px;
">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">
                                    Quatations</br>
                                    </br>
                                     <input type="button" class="form-control btn btn-primary text-center"  style="width: 65px; height: 30px" value="Create" onClick="f1()"/></td>
                                    </h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="table table-condensed" id="example">
                                            <thead>
                                                <tr>
                                                    <th>Reference</th>
                                                    <th>Supplier</th>
                                                    <th>Order Date</th>
                                                    <th class="center">Expected Date</th>
                                                    <th>Status</th>
													
                                                </tr>
                                                
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(Quatation_model pp:l)
{
%>											<%
													ArrayList<Supplier_model> sa=p.viewSupplierInfo(pp.getSupplier());
%>
                                                <tr onclick="clickrow(<%=pp.getQuotation_id()%>);"  style="cursor: pointer" class="gradeX">
                                             
                                                    <td><%=pp.getPrefix()%><%=pp.getQuotation_id() %></td>
                                                   <td><%=sa.get(0).getSuppliername() %>
                                         			</td>
                                         			<td><%=pp.getOrder_dt() %></td>
                                                    <td class="center"><%=pp.getExpected_dt() %></td>
                                                    <td class="center"><%=pp.getStatus() %>	</td>
                                                                                                        
                                                    
                                                </tr>
                                                <%} %>
                                             </tbody>
                                           
                                            <tfoot>
                                                <tr>
                                                    <th><input type="text" name="search_engine" value="Search Reference" class="search_init" /></th>
                                                    <th><input type="text" name="search_browser" value="Search Supplier " class="search_init" /></th>
                                                    <th><input type="text" name="search_platform" value="Search Order Date" class="search_init" /></th>
                                                    <th><input type="text" name="search_version" value="Search Expected Date" class="search_init" /></th>
                                                    <th><input type="text" name="search_version" value="Search Status" class="search_init" /></th>
                                                </tr>
                                            </tfoot>
                                            <tr><td> <input type="hidden" name="cid"></td></tr>
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


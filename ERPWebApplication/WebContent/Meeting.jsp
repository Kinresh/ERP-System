<%@page import="InterFace.SalesManagement.ScheduleCallDao"%>
<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--// Javascript //-->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Model.SalesManagement.Meeting_model"%>
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
	ff.action="NewHome.jsp?p=AddMeeting";
	
	ff.submit();
	
	
}
function clickrow(id)
{
	window.document.location="UserController?action=ViewMeeting&id="+id;
}
function editMeeting(e_id) {
	window.location.assign("NewHome.jsp?p=EditMeeting&id="+e_id+"");
	var ff=document.form1;
	ff.action="NewHome.jsp?p=EditMeeting&id="+e_id+"";
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
Integer userid = (Integer) session.getAttribute("id1");
System.out.print("***************"+userid);

AddInsertDao aa=new AddInsertDaoImp();
List<Meeting_model> l=new ArrayList<Meeting_model>();
	l=aa.viewMeetingByid(userid);



%>


                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
            <!-- Content Section Start -->
            <form name="form1" method="post" action="CustomerUpdateController">
            <div class="content-section" style="width:1100px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h2 class="heading">
                                    Meeting</br>
                                    </br>
                                     <input type="button" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Create" onClick="f1()"/></td>
                                    </h2>
                                </header>
                                <div class="contents"  >
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="table table-condensed" id="example">
                                            <thead>
                                                <tr>
                                                     <th>Date</th>
                                      				  <th>Subject</th>
                                      				  <th>Attendees</th>
                                    				    <th>Location</th>   
                                             	       <th>Status</th>
													
                                                </tr>
                                                
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(Meeting_model s:l)
{
%>											
                                                <tr onclick="clickrow(<%=s.getMeeting_id()%>);"  style="cursor: pointer" class="gradeX">
                                              
                                                    <td><%=s.getDate() %></td>
                                                    <td><%=s.getSubject() %></td>
                                                   
                                                    <td><%=s.getAttendees_names()%></td>
                                                    <td><%=s.getLocation()%></td>
                                                    <td>
                                                    
              <input type="submit" class="btn btn-success text-center" style="width: 56px; height: 30px" value="Edit"  onclick="editMeeting(<%=s.getMeeting_id()%>);">
           	  <input type="submit" class="btn btn-danger text-center" style="width: 56px; height: 30px" value="Delete" onClick="deletedata(<%=s.getMeeting_id()%>);" ></td>
              
                                                    
                                                    
                                                    </td>
                                                                                                        
                                                    
                                                </tr>
                                                <%} %>
                                             </tbody>
                                           
                                            <tfoot>
                                                <tr>
                                                    <th><input type="text" name="search_engine" value="Search Date" class="search_init" /></th>
                                                    <th><input type="text" name="search_browser" value="Search Summary" class="search_init" /></th>
                                                    <th><input type="text" name="search_platform" value="Search Customer" class="search_init" /></th>
                                                    <th><input type="text" name="search_version" value="Search Mobile" class="search_init" /></th>
                                                    <th><input type="text" name="search_grade" value="Search Status" class="search_init" /></th>
                                                </tr>
                                            </tfoot>
                                            <tr><td> <input type="hidden" name="cid"><input type="hidden" name="hid" value="DeleteMeeting"></td></tr>
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


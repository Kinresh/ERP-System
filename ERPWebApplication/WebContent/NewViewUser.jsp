<link href="assets/css/style.css" rel="stylesheet" media="screen" />
<link href="assets/css/bootstrap.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--// Javascript //-->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserManagement.UserModel"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="InterFace.UserManagement.AddInsertDao"%>
<%@page import="Dao.UserManagement.AddInsertDaoImp"%>

<script type="text/javascript">


function BlockUnblock(id)
{
	var f=document.form1;
	f.hid.value=id;
	 f.action="BlockUnblock";
	f.submit();	
				
		
	
	}


function viewdata(id)
{
	 var f=document.form1;
    	f.hid.value=id;
     f.action="UserActionController";
		
}


</script>

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<%
Integer id11 = (Integer) session.getAttribute("id1");
System.out.print("***************"+id11);

UserModel b=new UserModel();

AddInsertDao aa=new AddInsertDaoImp();
List<UserModel> l=new ArrayList<UserModel>();
Integer user = (Integer) session.getAttribute("user");
	String v="0";
	int s=Integer.parseInt(v);


	l=aa.viewUserData(id11,s);



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
                                <a class="closethis">Close</a>
                                <header>
                                    <h2 class="heading">Users</h2>
                                </header>
                                <div class="contents">
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="display table" id="example">
                                            <thead>
                                                <tr>
                                                    <th>User Name</th>
                                                    <th>Email Id</th>
                                                    <th>Contact</th>
                                                    <th class="center">Status</th>
                                                    <th>Action</th>
													
                                                </tr>
                                                <tr>
                                                </tr>
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(UserModel u:l)
{
%>											
                                                <tr class="gradeX">
                                              
                                                    <td><%=u.getUsername() %></td>
                                                    <td><%=u.getEmailaddress() %></td>
                                                    <td><%=u.getContactno() %></td>
                                                    <td class="center">
                                                    <%String sss=u.getActive_flag();
                                    		String sname;
                                    		if(sss.equals("1"))
                                    			sname="Block";
                                    		else
                                    			sname="Unblock";
                                    		System.out.print("-----------sname"+sname);
                                    %><%=sname %>
                                    		
                                    	</td>
                                               <!--     <td class="center"><input type="submit" class="form-control" value="More" name="btnclick" onClick="viewdata('<%=u.getUserid()%>')" >
                                                    <input type="button" style="margin-left: 30px;"  class="fsv-expand fsv-image1" id='<%=u.getUserid()%>' /> --> 
                                               <td>
                                    	<input type="button" class="btn btn-primary text-center fsv-expand fsv-image1" style="width: 56px; height: 30px" value="User" id='<%=u.getUserid()%>'>   
                                             
                                                <input type="button" class="btn btn-primary text-center fsv-expand fsv-image1" style="width: 65px; height: 30px" value="<%=sname %>" onClick="BlockUnblock(<%=u.getUserid()%>);" name="btnclick">
                                             
                                             
                                               </td>
                                               
                                                    </tr>
                                                    <tr>
                                               
                                            
                                                <td colspan="5" class="pad0"><div  id="user-expand<%=u.getUserid()%>"></div></td></tr>
                                                   
                                                <%} %>
                                             </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th><input type="text" name="search_user" value="Search engines" class="search_init" /></th>
                                                    <th><input type="text" name="search_email" value="Search browsers" class="search_init" /></th>
                                                    <th><input type="text" name="search_contact" value="Search platforms" class="search_init" /></th>
                                                    <th><input type="text" name="search_block" value="Search versions" class="search_init" /></th>
                                                    <th></th>
                                                </tr>
                                                <tr>
                                              
                                                </tr>
                                            </tfoot>
                                            <tr><td> <input type="hidden" name="hid"></td></tr>
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

<script>
$(".fsv-expand").click(function(e){
	if($(this).hasClass("fsv-image1"))
	{
	var uid=$(this).attr("id");
	$("#user-expand"+uid).slideDown();
	$(this).removeClass("fsv-image1");
	$(this).addClass("fsv-image2");
	$.ajax({
        url: "more_user.jsp?uid="+uid,
        success: function(data) {	
        $("#user-expand"+uid).html(data);
		$("#user-expand"+uid).slideDown();
                                }
          });
	}
	else
	{
	 $("#user-expand"+uid).css("display","none");
	 $(this).removeClass("fsv-image2");
	 var uid=$(this).attr("id");
	 $("#user-expand"+uid).slideUp();
	 $(this).addClass("fsv-image1");
	}
	});
</script>
         
		

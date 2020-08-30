
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

function deletedata(id)
{
	var f=document.form1;
	f.hid.value=id;
	if(confirm("are you sure want to delete record?"))
		{
             f.action="UserActionController";
		
				
		}
	
	}
function updatedata(id)
{
	 var f=document.form1;
    	f.hid.value=id;
     f.action="NewHome.jsp?p=update";
     f.submit();
		
}

function viewdata(id)
{
	 var f=document.form1;
    	f.hid.value=id;
     f.action="UserActionController";
		
}

function editUser(e_id) {
	window.location.assign("NewHome.jsp?p=EditUser&id="+e_id+"");
	var ff=document.form1;
	ff.action="NewHome.jsp?p=EditUser&id="+e_id+"";
	ff.submit();
	
}
function deletedata(id)
{
	var f=document.form1;
	f.cid.value=id;
	if(confirm("are you sure want to delete record?"))
		{
             f.action="UserActionController";
         
				
		}

	
	}


function clickrow(id){
	window.document.location="NewHome.jsp?p=ViewUserDetails&id="+id;
}




function createuser(){
	window.location.assign("NewHome.jsp?p=AddUser");
}
function viewdata(id)
{
	 var f=document.form1;
    	f.cid.value=id;
     f.action="UserActionController";
		
}
function viewuser(id)
{
	 var f=document.form1;
    
     f.action="NewHome.jsp?p=ViewUser";
     f.submit();
		
}

</script>


<%
Integer id11 = (Integer) session.getAttribute("id1");
System.out.print("***************"+id11);

UserModel b=new UserModel();
//Generics<UserModel> g=new Dao<UserModel>();
AddInsertDao aa=new AddInsertDaoImp();
List<UserModel> l=new ArrayList<UserModel>();

	
//	l=aa.viewUserData(user);

	l=aa.viewUserData(id11, 0);



%>


                <!-- Header Top Navigation End -->
                <div class="clearfix"></div>
            </header>
            <!-- Right Section Header End -->
            <!-- Content Section Start -->
        <form name="form1" method="post" action="UserActionController">
            <div class="content-section" style="width:1100px;">
                <div class="container-liquid">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="sec-box">
                               
                                <header>
                                    <h1 class="heading">
                                        <div class="block">                       
                        		 <div class="block">                       
                        	Users
                       		 </div>
                        		
                        		
                       		 </div>
                       		 </br>
                                     <input type="button" class="form-control btn btn-primary text-center"  style="width: 56px; height: 30px" value="Create" onClick="createuser()"/></td>
                                     
                                    </h1>
                                </header>
                                <div class="contents">
                                    <a class="togglethis">Toggle</a>
                                    <div class="table-box">
                                    	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
                                        <table class="table table-dark" id="">
                                            <thead>
                                                <tr>
                                                    <th>User Name</th>
                                                    <th>Email</th>
                                                    <th>Contact</th>
                                                    <th class="center">Status</th>
                                                    <th>Action</th>
													
                                                </tr>
                                                
                                            </thead>
                                             
                                            <tbody>
                                            	<% int k=1;
for(UserModel u:l)
{
%>											

                                                <tr class="gradeX"  style="cursor: pointer" onclick="clickrow(<%=u.getUserid()%>);" >
                                              
                                                  <td><%=u.getUsername() %></td>
                                                    <td><%=u.getEmailaddress() %></td>
                                                    <td><%=u.getContactno()%></td>
                                                    <td class="center">   <%String sss=u.getActive_flag();
                                    		String sname;
                                    		if(sss.equals("1"))
                                    			sname="Block";
                                    		else
                                    			sname="Unblock";
                                    		System.out.print("-----------sname"+sname);
                                    %><%=sname %>
                                    		</td>
                                                 	<td class="center">
           	 
           	 <input type="submit" class="btn btn-success text-center" style="width: 50px; height: 30px" value="Edit"  onclick="editUser(<%=u.getUserid()%>);">
           	  <input type="submit" class="btn btn-danger text-center" style="width: 50px; height: 30px" value="Delete" onClick="deletedata(<%=u.getUserid()%>);" name="btnclick" >
           	     <input type="button" class="form-control btn btn-primary text-center" style="width: 50px; height: 30px"  onclick="viewuser(<%=u.getUserid()%>);" value="View"></td>
           	  
              
                                                    
                  
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
                                            <tr><td> <input type="hidden" name="cid">  <input type="hidden" name="hid"></td></tr>
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


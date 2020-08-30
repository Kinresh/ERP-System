<%@page import="Model.SalesManagement.Title_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserManagement.Role"%>
<%@page import="InterFace.UserManagement.Generics"%>
<%@page import="Model.UserManagement.countrybean"%>
<%@page import="Dao.UserManagement.GenericsDaoImp"%>
<%@page import="Model.UserManagement.statebean"%>
<%@page import="Model.UserManagement.citybean"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="Model.SalesManagement.company_model"%>	
<%@page import="InterFace.SalesManagement.GenericsDao"%>
	 <script>
$(document).ready(function(){
    $('#iscompany').change(function(){
        if(this.checked)
        	{
        	$('#company').show();
        	
        	 $('#job').show();
             $('#title').show();
           
           
            	}
        else{
            
            $('#company').hide();
         	 $('#job').hide();
             $('#title').show();
           
          
    	
        }

    });
});
</script>
<script type="text/javascript">
function validation(){
	 var c_name=document.customer_form.customer;
	 if(c_name.value==""){
		 alert("Please Enter the Name");
		 c_name.focus();
		 return false;
	 }
		
		
  	var add_ress=document.customer_form.address;
  	if(add_ress.value=="")
  		{
  			alert("Please Enter Address.");
  			document.customer_form.address.focus();
  			return false;
  		}
		
  	var ctry=document.customer_form.country.selectedIndex;
  	if(ctry==0)
  		{
  			alert("Please Select Country.");
  			document.customer_form.country.focus();
  			return false;
  		}
  	
  	var sta=document.customer_form.state.selectedIndex;
  	if(sta==0)
  		{
  			alert("Please Select State.");
  			document.customer_form.state.focus();
  			return false;
  		}
  	
  	var cty=document.customer_form.city.selectedIndex;
  	if(cty==0)
  		{
  			alert("Please Select City.");
  			document.customer_form.city.focus();
  			return false;
  		}
  	
  	var phn=document.customer_form.phone.value;
		var m1=document.customer_form.mobile1.value;
		var m2=document.customer_form.mobile2.value;
		if(phn=="" && m1=="" && m2==""){
			alert("Please provide phone no or one Mobile no");
			document.customer_form.mobile1.focus();
			return false;
		}
  	var phoneno = /^\d{10}$/;  
  	if(m1 != ""){
  	if(!phoneno.test(m1))
  	{
  		alert("You have entered an invalid phone number");
  		document.customer_form.mobile1.focus();
  		return false;
  	}
  	}
  	
  	if(m2 !=""){
  	if(!phoneno.test(m2))
  	{
  		alert("You have entered an invalid phone number");
  		document.customer_form.mobile2.focus();
  		return false;
  	}
  	}
  	
	var email=document.customer_form.email;
if(email.value=="")
		{
			alert("Please Enter Email-ID.");
			document.customer_form.email.focus();
			return false;
		}
	
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	if (!filter.test(email.value)) 
		{
			alert('Please provide a valid email address');
		 		document.customer_form.email.focus();
		 	return false;
		}
var cty=document.customer_form.title.selectedIndex;
  	if(cty==0)
  		{
  			alert("Please Select Title.");
  			document.customer_form.title.focus();
  			return false;
  		}
	return(true);
  }
function addcompany()
{
	var a2=document.customer_form;
	a2.action="NewHome.jsp?p=Company";
	a2.submit();

}

</script>   
<script type="text/javascript">


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
function stateChange1(){   
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        document.getElementById("city").innerHTML=xmlHttp.responseText   
    }   
}
</script>
<script type="text/javascript">
function addcountry()
{
	
	var a=document.f1;
	a.action="NewHomePage.jsp?p=AddCountry";
	a.submit();
}
function addstate()
{
	
	var a1=document.f1;
	a1.action="NewHomePage.jsp?p=AddState";
	a1.submit();

}
function addcity()
{
	
	var a2=document.f1;
	a2.action="NewHomePage.jsp?p=AddCity";
	a2.submit();
}
function addrole()
{
	
	var a2=document.f1;
	a2.action="NewHomePage.jsp?p=AddRole";
	a2.submit();
	
}
function addCall()
{
	
	var a2=document.customer_form;
	a2.action="NewHome.jsp?p=ScheduleCalls";
	a2.submit();
}


</script>
    

  
<form name="customer_form" method="post" action="CustomerActionController"
	 autocomplete='off'onsubmit="return validation()"  >
	<div class="content-section">
		<div class="container-liquid">
			<div class="row">
				<div class="col-xs-12">
					<div class="sec-box">

						<header>
							<h2 class="heading">

								<input type="submit"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Save" />
								<input type="button"
									class="form-control btn btn-primary text-center"
									style="width: 56px; height: 30px" value="Cancel" />
								
							</h2>
						</header>
						<div class="contents">
							<a class="togglethis"></a>
							<div class="table-box">

								<table class="table" >
									<input type="hidden" name="hid" value="customerSave">
									<input type="hidden" name="hid2" value="customerSave">
									<tr>
									<td colspan="3" class="col-md-4"><label>Name</label>(<input
											type="checkbox" id="iscompany" name="check">Is a Company?)
										</td>
										<td></td>
										<td><input type="button"
											class="form-control btn btn-warning text-center"
											 style="width: 45px; height: 30px"
											value="Calls" onClick="addCall()" > <input
											type="button"
											class="form-control btn btn-success text-center various fsv-update"
											href="AddMeetings.jsp" style="width: 65px; height: 30px"
											value="Meetings" data-fancybox-type="iframe"> 
										
										</td>
									</tr>
									
									</table>
									</div>
									</div>
									</div>
									</div>
									</div>
									</div>
									</div>
									</form>
								
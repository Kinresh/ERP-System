
<%@page import="Model.PurchaseManagement.Product_model"%>
<%@page import="Dao.Salesmanagement.GenericsImp"%>
<%@page import="InterFace.SalesManagement.GenericsDao"%>
<%@page import="java.util.List"%>

<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="description" content="The dynamic table input jQuery plugin">
    <meta name="keywords" content="appendGrid, jQuery, JavaScript, header detail, edit grid">
    <meta name="author" content="Albert L.">
    <link rel="shortcut icon" href="http://appendgrid.apphb.com/Content/img/icon.gif" type="image/x-icon">
    <title>appendGrid - Demo: Basic</title>
    <link href="Demo_data/Site.css" rel="stylesheet">
<link href="Demo_data/jquery-ui-1.css" rel="stylesheet">

    <script src="Demo_data/analytics.js" async=""></script><script src="Demo_data/jquery-1.js"></script>
<script src="Demo_data/jquery-ui-1.js"></script>

    
    <link href="Demo_data/shCore.css" rel="stylesheet">
<link href="Demo_data/shThemeDefault.css" rel="stylesheet">

    <link href="Demo_data/jquery.css" rel="stylesheet">

    <script src="Demo_data/shCore.js"></script>
<script src="Demo_data/shBrushJScript.js"></script>
<script src="Demo_data/shBrushXml.js"></script>
<script src="Demo_data/shBrushCss.js"></script>
<script type="text/javascript">
 function getItem(id){
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
	      document.getElementById("itm").innerHTML=xmlhttp.responseText;
	      }
	    }
	  xmlhttp.open("post","AjaxItem?value="+id,true);
	  xmlhttp.send();
}
 </script>
    <script src="Demo_data/jquery_002.js"></script>
<script src="Demo_data/jquery.js"></script>

    

</head>
<body>
    <form id="frmMain" name="frmMain" action="/Demo" method="post">

    <div style="text-align: center;">
        <div class="viewable main-body">
            

<script id="jsSource" type="text/javascript">
    $(function () {
        // Initialize appendGrid
        $('#tblAppendGrid').appendGrid({
            caption: 'My CD Collections',
            initRows: 1,
            columns: [
                    { name: 'Album', display: 'Album', type: 'text', ctrlAttr: { maxlength: 100 }, ctrlCss: { width: '160px'} },
                    { name: 'Artist', display: 'Artist', type: 'text', ctrlAttr: { maxlength: 100 }, ctrlCss: { width: '100px'} },
                    { name: 'Year', display: 'Year', type: 'text', ctrlAttr: { maxlength: 4 }, ctrlCss: { width: '40px'} },
                    { name: 'Origin', display: 'Origin', type: 'select', ctrlOptions: { 0: '{Choose}', 1: 'Hong Kong', 2: 'Taiwan', 3: 'Japan', 4: 'Korea', 5: 'US', 6: 'Others'} },
                    { name: 'Poster', display: 'With Poster?', type: 'checkbox' },
                    { name: 'Price', display: 'Price', type: 'text', ctrlAttr: { maxlength: 10 }, ctrlCss: { width: '50px', 'text-align': 'right' }, value: 0 },
                    { name: 'RecordId', type: 'hidden', value: 0 }
                ]
        });
       
        // Handle `Serialize` button click
        $('#btnSerialize').button().click(function () {
            alert('Here is the serialized data!!\n' + $(document.forms[0]).serialize());
        });
    });
</script>

<div id="divSource">
    <table class="appendGrid ui-widget" id="tblAppendGrid">
	<thead class="ui-widget-header">
		<tr style="background-color: #DDD;" >
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Product</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Item</th>
                               			<th width="146px" style="border-right: 1px solid #ffffff;">Description</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Schedule Date</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Quantity</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Unit price</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Taxes</th>
                               			<th width="138px" style="border-right: 1px solid #ffffff;">Subtotal</th>
                               			<th></th>
                               			
                               		</tr>
                               		
                               		
                              		<tr style="border-bottom:1px solid #cdcdcd;">
                               			<td>
                               				<select name="product" onchange="getItem(this.value);" style="width: 100%;margin-top: 5px;" class="form-control" id="pro">
                            							
                            							<option value="0">--Select product--</option>
                            							<%
                            							Product_model pr=new Product_model();
                            							GenericsDao<Product_model> gp_obj=new GenericsImp<Product_model>();
                            							List<Product_model> p_list=gp_obj.viewData(pr);
                            							for(int i=0;i<p_list.size();i++){
                            							%>
                            							<option value=<%=p_list.get(i).getProductid() %>><%=p_list.get(i).getProduct() %></option>
                            							<%} %>
                            						</select>
                               			</td>
                               		                        			<td id="itm">
                  
                               			</td>
                               			<td><input type="text" style="width:100%; margin-top: 5px;" class="form-control" name="description" id="desc"/></td>
                               			<td><input type="text" id="sdate" style="width: 100%; margin-top: 5px;" class="form-control" name="s_date" /></td>
                               			<td><input type="text" style="width:100%; text-align: right;margin-top: 5px;" class="form-control" value="1.000" name="quantity" id="qty" /></td>
                               			<td><input type="text" style="width:100%; text-align: right; margin-top: 5px;"  class="form-control" value="0.00" name="u_price" id="u_pri" /></td>
                               			<td><input type="text" style="width:100%; text-align: right; margin-top: 5px;"  class="form-control" name="tax" value="0.00" id="tx"/></td>
                               			<td></td><td></td>
                               	
                               	
	<td class="ui-widget-content last">
	<button tabindex="-1" id="tblAppendGrid_Insert_1" title="Insert Row Above" aria-disabled="false" class="form-control" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only insert" type="button">
	<span class="ui-button-icon-primary ui-icon ui-icon-arrowreturnthick-1-w"></span>
	<span class="ui-button-text"></span></button><button tabindex="-1" id="tblAppendGrid_Delete_1" title="Remove Current Row" aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only remove" type="button">
	</td></tr></tfoot></table>
   
    <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="btnSerialize" type="button"><span class="ui-button-text">
        Demo: jQuery Serialize</span></button>
</div>

<script type="text/javascript">
    // Copy related javascript code and highlight them for demo
    var CssSource = document.getElementById('cssSource') == null ? null : document.getElementById('cssSource').innerHTML;
    var HtmlSource = document.getElementById('divSource') == null ? null : document.getElementById('divSource').innerHTML;
    $(function () {
        var jsSource = document.getElementById('jsSource');
        if (jsSource != null) {
            // Add CSS source
            var preCode = null;
            if (CssSource) {
                preCode = document.createElement('pre');
                preCode.className = 'brush: css';
                $(preCode).text(CssSource);
                $('#divDemoCode').append($('<div></div>').text('CSS:')).append(preCode);
            }
            // Add HTML source
            preCode = document.createElement('pre');
            preCode.className = 'brush: xml';
            $(preCode).text(HtmlSource);
            $('#divDemoCode').append($('<div></div>').text('HTML:')).append(preCode);
            // Add JavaScript source
            preCode = document.createElement('pre');
            preCode.className = 'brush: js';
            preCode.innerHTML = jsSource.innerHTML;
            $('#divDemoCode').append($('<div></div>').text('JavaScript:')).append(preCode);

        }
        $('#anShowSource').click(function () {
            $('#divDemoCode').css('display', '');
            $(this).css('display', 'none');
        });
        SyntaxHighlighter.all();
    });
</script>

        </div>
    </div>
    </form>
    
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-39900280-1', 'apphb.com');
  ga('send', 'pageview');
</script>
        <script type="text/javascript">
        $(function () {
            $.get('/Ajax/StartSession', {}, function (data) { });
        });
    </script>


</body></html>
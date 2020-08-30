<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
session.removeAttribute("username1");
session.invalidate();
%>
<jsp:forward page="index.jsp"></jsp:forward>
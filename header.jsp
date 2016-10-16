<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
</head>
<body>
<%
String image=request.getParameter("img");
%>
<div id="id1" name="div" style="top:0%;left:15%;height:30%;width:70%;position:absolute;">
<img src="/ehealthcare/images/<%=image%>" style="height:100%; width:100%;">
</div>
<div id="id2" name="div" style="top:30%;left:0%;height:10%;width:100%;position:absolute;background-image:url('/ehealthcare/images/e.jpg');">
</div> 
</body>
</html>
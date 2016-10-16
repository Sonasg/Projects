<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Pic</title>
</head>
<body>
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:0%;width:100%;height:120%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<%
String uid=request.getParameter("id");
String type=request.getParameter("type");
%>
<div style="top:50%;left:35%;height:10%;width:30%;position: absolute;background-color: silver;">
<form action="/ehealthcare/UploadPic4?uid=<%=uid%>&type=<%=type%>" method="post" enctype="multipart/form-data">
<table align="center">
<tr align="center"><td colspan="2">
<input type="file" name="upload">
</td>
</tr>
<tr align="center"><td colspan="2">
<input type="submit" value="submit">
</td>
</tr>
</table>
</form>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
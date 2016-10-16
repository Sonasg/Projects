<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Tips</title>
</head>
<body>
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:0%;width:100%;height:75%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<div id="id3" name="div" style="top:30%;left:40%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-weight: bold;background:linear-gradient(#cc66ff,pink);font-size:x-large;">CREATE TIPS</p>
</div>
<%
String id=request.getParameter("userid"); 
String file=request.getParameter("file");
%>
<div style="top:45%;left:35%;position:absolute;height:30%;width:30%;text-align:center;">
<form action="/ehealthcare/CreateTips" method="post" style="color:#9900cc;font-size:large;font-family:cursive;">
<table  align="center" bgcolor="silver">
<tr><th>User id</th>
<td><input type="text" name="txtid" value="<%=id%>" readonly></td></tr>
<tr align="center"><td colspan="2"><a href="/ehealthcare/jsp/uploadpic1.jsp?userid=<%=id%>">upload pic</a></td></tr>
<tr><td><input type="hidden" name="txtnm" value=<%=file%>></td></tr>
<tr><th>Tips</th>
<td><textarea rows=5 cols=51 name="txttip"></textarea></td></tr>
<tr align="center"><td colspan="2"><input type="submit" value="SUBMIT"></td></tr></table>
</form>
</div>
<div style="top:90%;left:35%;height:5%;width:38%;position: absolute;text-align: center;">
<a href="/ehealthcare/jsp/profile.jsp"  style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:96%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
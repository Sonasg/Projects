<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator</title>
<link rel="stylesheet" type="text/css" href="/ehealthcare/css/style.css">
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
<div id="id2" style="top:30%;left:30%;height:5%;width:39%;position:absolute;text-align: center;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);text-align: center;">ADMINISTRATOR</p>
</div>
<div id="id1" style="top:40%;left:35%;width:30%;height:40%;position:absolute;background-color: silver;text-align: center;font-family: cursive;font-size:large; ">
<a href="/ehealthcare/jsp/admin-confirmregis.jsp">New users</a><br>
<a href="/ehealthcare/jsp/admin-allusers.jsp">View all users</a><br>
<a href="/ehealthcare/jsp/viewall.jsp?type=nutritionist">View all nutritionists</a><br>
<a href="/ehealthcare/jsp/viewall.jsp?type=dietitian">View all dietitians</a><br>
<a href="/ehealthcare/jsp/viewall.jsp?type=yoga expert">View all yoga experts</a><br>
<a href="/ehealthcare/jsp/dailynews.jsp">Daily News</a>
</div>
<div style="top:25%;left:0%;height:75%;width:20%;position:absolute;background-color:silver;font-family:cursive;font-size:large;">
<h5 style="background:linear-gradient(#cc66ff,pink);width:100%;text-align:center;">DO-</h5>
<ul><li><a href="/ehealthcare/LogOutSer">Logout</a></li></ul>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
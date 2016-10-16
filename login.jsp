<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ehealthcare.ser.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/ehealthcare/css/style.css">
<script src="/ehealthcare/js/validation.js">
</script>
<script>
function Main()
{
	var ui=document.getElementById("txtuserid").value;
	
	if(checkEmpty(ui)==false)
		{
		alert("enter user ID");
		document.getElementById("txtuserid").focus();
		return false;
	
		}
	
	var upass=document.getElementById("txtpass").value;
	if(checkEmpty(upass)==false)
	  {
	alert("enter user password");
	document.getElementById("txtpass").focus();
	return false;
	  }
	
	if(checkLength(upass)==false)
	   {
	   
	  alert("Password greater than 10");
	  document.getElementById("txtpass").focus();
	  return false;
	   }
	
	var cmb=document.getElementById("designation");
	var designame=cmb.options[cmb.selectedIndex].value;
	if(checkCombo(designame)==false)
		{
		alert("Select your designation");
		return false;
		}
	
	var arrstatus=document.getElementsByName("status");
	if(checkChk(arrstatus)==false)
	{
		alert("Select the status");
		return false;
	}
}
</script>
</head>
<body>
<%
String msginfo=request.getParameter("msg");
%>
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:0%;height:75%;width:20%;position:absolute;background-color:silver;font-family:cursive;font-size:large;">
<h5 style="background:linear-gradient(#cc66ff,pink);width:100%;text-align:center;">REGISTER YOURSELF AS-</h5>
<img src="/ehealthcare/images/join.png" width="100%">
<ul>
<li><a href="/ehealthcare/jsp/register.jsp?type=nutritionist" style="text-decoration:none;">nutritionist</a><br>
<li><a href="/ehealthcare/jsp/register.jsp?type=dietitian" style="text-decoration:none;">deititian</a><br>
<li><a href="/ehealthcare/jsp/register.jsp?type=yoga expert" style="text-decoration:none;">yoga expert</a><br>
<li><a href="/ehealthcare/jsp/user-register.jsp" style="text-decoration: none;">user</a><br>
</li>
</ul>
</div> 
<div style="top:25%;left:20%;width:80%;height:75%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<%if(msginfo!=null)
	{%>
	<div style="top:45%;left:80%;height:5%;width:20%;position:absolute;color:aqua;border-radius:25px;background:linear-gradient(purple,pink);text-align:center;font-size:x-large;">
	<%=msginfo%>	
	</div>
	<%} %>
	<!-- <img src="/ehealthcare/images/l.gif" style="top:30%;left:35%;height:4%;width:5%;position:absolute;"> -->
<div id="id3" name="div" style="top:40%;left:45%;height:30%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);">LOGIN IF ALREADY REGISTERED</p>
<form style="color:#9900cc;font-size:x-large;font-family:cursive;" onsubmit="return Main()" action="/ehealthcare/Login" method="post">
<table align="center" bgcolor="silver">
<tr align="center">
<th>UserId</th>
<td><input type="text" id="txtuserid" name="txtuserid" size="20">
</td>
</tr>
<tr align="center">
<th>Password</th>
<td><input type="password" id="txtpass" name="txtpass" size="20"></td>
</tr>
<tr>
<td><a href="/ehealthcare/jsp/forget.jsp">Forget Password?</a></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="Submit" style="border-radius:25px;border-style:none;color:white;font-family:aharoni;font-size:large;background-color:#6600ff;">
</td>
</tr>
</table>
</form>
<br>
<a href="/ehealthcare/welcome.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:95%;left:20%;width:80%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
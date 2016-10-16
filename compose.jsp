<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose</title>
<script src="/ehealthcare/js/validation.js"></script>
<script>
function Main()
{
	var ui=document.getElementById("txtuserid").value;
	if(checkEmpty(ui)==false)
	{
		alert("Empty receiver id");
		document.getElementById("txtuserid").focus();
		return false;
	}
	var sub=document.getElementById("txtsub").value;
		if(checkEmpty(sub)==false)
		{
			alert("Empty subject");
			document.getElementById("txtsub").focus();
			return false;
		}
var msg=document.getElementById("txtmsg").value;
			if(checkEmpty(msg)==false)
			{
				alert("Empty message box");
				document.getElementById("txtmsg").focus();
				return false;
			}
			
		
}	
function checkUserId(recid)
{
	var senid=document.getElementById("txtsen").value;
	var x;
	if(XMLHttpRequest)
		{
		x=new XMLHttpRequest();
		}
	else
		{
		x=new ActiveXObject("Microsoft.XMLHTTP");
		}
	x.onreadystatechange=function()
	{
		if(x.readyState==4 && x.status==200)
			{
			var info=x.responseText;
			if(info!="")
			alert(info);
			}
	}
	x.open("GET","/ehealthcare/CheckRegId?sui="+senid+","+recid,"true");
	x.send();
}</script>
</head>
<body>
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:0%;width:100%;height:100%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<div id="id3" name="div" style="top:30%;left:40%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-weight: bold;background:linear-gradient(#cc66ff,pink);font-size:x-large;">COMPOSE MAIL</p>
</div>
<%
String id=request.getParameter("userid"); %>
<div style="top:45%;left:35%;position:absolute;height:30%;width:30%;text-align:center;">
<form action="/ehealthcare/ComposeMail" method="post" style="color:#9900cc;font-size:large;font-family:cursive;" onsubmit="return Main()">
<table  align="center" bgcolor="silver">
<tr><th>Sender id</th>
<td><input type="text" id="txtsen" name="txtsen" value="<%=id%>" readonly>
</td>
</tr>
<tr><th>Receiver id </th>
<td><input type="text" name="txtrec" id="txtuserid" onblur="checkUserId(this.value)" ></td></tr>
<tr><th>Subject</th>
<td><input type="text" name="txtsub" id="txtsub"/></td></tr>
<tr><th>Message</th>
<td><textarea rows=10 cols=50 name="txtmsg" id="txtmsg"></textarea></td></tr>
<tr align="center"><td colspan="2"><input type="submit" value="SUBMIT"></td></tr></table>
</form>
</div>
<div style="top:100%;left:35%;height:5%;width:38%;position: absolute;text-align: center;">
<%
String sql="select usertype from logindetails where userid=?";
Connection con=CrudOperation.establishConnection();
PreparedStatement ps=null;
ResultSet rs=null;
String type="";
try
{
	ps=con.prepareStatement(sql);
	ps.setString(1,id);
	rs=ps.executeQuery();
	if(rs.next())
	{
		type=rs.getString("usertype");
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
if(type.equals("user"))
{
%>
<a href="/ehealthcare/jsp/userprofile.jsp"  style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
<%
}
else
{
%>
<a href="/ehealthcare/jsp/profile.jsp"  style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
<%} %>
</div>
<div style="top:30%;left:70%;height:5%;width:5%;position:absolute;" id="msgtxt">
</div>  
<div id="foot" style="top:110%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
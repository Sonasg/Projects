<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily News</title>
<script src="/ehealthcare/js/validation.js"></script>
<script>
function Main()
{
	var ui=document.getElementById("txtnews").value;
	if(checkEmpty(ui)==false)
	{
		alert("Empty news");
		document.getElementById("txtnews").focus();
		return false;
	}
	var sub=document.getElementById("txthead").value;
		if(checkEmpty(sub)==false)
		{
			alert("Empty headline");
			document.getElementById("txthead").focus();
			return false;
		}
	var pic=document.getElementById("nm").value;
	if(checkEmpty(pic)==false)
		{
		alert("Upload pic");
		document.getElementById("upload").focus();
		return false;
		
		}
	
}	
</script>
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
<%
String file=request.getParameter("file");

%>
<div id="id3" name="div" style="top:30%;left:35%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-weight: bold;background:linear-gradient(#cc66ff,pink);font-size:x-large;">DAILY NEWS</p>
</div>
<div style="top:45%;left:35%;position:absolute;height:30%;width:30%;text-align:center;">
<form action="/ehealthcare/DailyNews" method="post" style="color:#9900cc;font-size:large;font-family:cursive;" onsubmit="return Main()">
<table  align="center" bgcolor="silver">
<tr align="center"><td colspan="2"><a href="/ehealthcare/jsp/uploadpic2.jsp" id="upload" >upload pic</a></td></tr>
<tr><td><input type="hidden" name="txtnm" value=<%=file%> id="nm"></td></tr>
<tr><th>HeadLine</th>
<td><input type="text" name="txthead" size="40"></td></tr>
<tr><th>News</th>
<td><textarea rows="5" cols="20" name="txtnews"></textarea></td></tr>
<tr align="center"><td colspan="2"><input type="submit" value="submit"></td></tr>
</table>
</form>
</div>
<div style="top:80%;left:35%;height:5%;width:30%;position: absolute;text-align: center;">
<a href="/ehealthcare/jsp/admin.jsp" style="font-size: xx-large;">BACK</a>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
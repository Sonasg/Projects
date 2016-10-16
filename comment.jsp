<%@page import="java.sql.SQLException"%>
<%@page import="com.db.CrudOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comment</title>
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
<div style="top:30%;left:5%;width:35%;height:65%;position:absolute;overflow:auto;background-color:silver;">
<marquee direction="down" height="100%" width="100%" onmouseover="this.stop()" onmouseout="this.start()">
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String bid=request.getParameter("blog");
con=CrudOperation.establishConnection();
String strsql="select * from blog where blogid=?";
String blog="";
String topic="";
HttpSession hs=request.getSession(false);
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,bid);
	rs=ps.executeQuery();
	while(rs.next())
	{
		topic=rs.getString("topic");
		blog=blog+rs.getString("blog")+"#";
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
	String data[]=blog.split("#");
%>
<ul>
<%
for(int i=0;i<data.length;i++)
{
	%>
<li><%=data[i]%></li>
<%
}
%></ul>
</marquee>
</div>
<div style="top:45%;left:80%;height:20%;width:15%;position: absolute;">
<img src="/ehealthcare/images/comment.jpg" height="100%" width="100%" align="middle">
</div>
<div id="id3" name="div" style="top:30%;left:50%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-weight: bold;background:linear-gradient(#cc66ff,pink);font-size:x-large;">COMMENT</p></div>
<div style="top:45%;left:45%;position:absolute;height:40%;width:30%;text-align:center;">
<form action="/ehealthcare/Comment" method="post" style="color:#9900cc;font-size:large;font-family:cursive;">
<table  align="center" bgcolor="silver">
<tr><td><input type="hidden" name="txtid" value=<%=bid%>></td></tr>
<tr><td><input type="hidden" name="txttopic" value=<%=topic%>></td></tr>
<tr><th>Comment:</th>
<td><textarea rows=5 cols=51 name="txtblog"></textarea></td></tr>
<tr align="center"><td colspan="2"><input type="submit" value="SUBMIT"></td></tr></table>
</form>
</div>
<div style="top:90%;left:45%;height:5%;width:40%;position: absolute;text-align: center;">
<a href="/ehealthcare/jsp/profile.jsp"  style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:96%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
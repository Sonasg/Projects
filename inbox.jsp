<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.db.*,java.util.*,com.db.*,com.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inbox</title>
<link rel="stylesheet" type="text/css" href="/ehealthcare/css/style.css">
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
<div id="id3" name="div" style="top:30%;left:35%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);">INBOX</p>
</div>
<%
CrudOperation cr=new CrudOperation();
String reid=request.getParameter("userid");
String strsql="select * from message where receiverid=? and rstatus=?";
ArrayList<Message> infolist=cr.showMessage(strsql,reid);
%>
<div style="top:45%;left:35%;height:30%;width:30%;position:absolute;text-align: center;">
<form action="/ehealthcare/Inbox" method="post">
<table border="1" bgcolor="#9966ff" height="100%" width="100%">
<tr>
<th>Select</th>
<th>Subject</th>
<th>Sender id</th>
<th>Date</th>
<td><input type="hidden" value="<%=reid %>" name="txthidden">
</tr>
<%

for(int i=0;i<infolist.size();i++)
{ 
	Message r=infolist.get(i);
%>
<tr>
<td><input type="checkbox" name="chkdelete" value=<%=r.getMsgid()%>>
<td><a href="/ehealthcare/jsp/showmsg.jsp?ms=<%=r.getMsgid()%>" style="color:black;"><%=r.getSub()%></a></td>
<td><%=r.getSenid()%></td>
<td><%=r.getDate()%></td>
</tr>
<%
}
%>
<tr><td colspan="4" align="center">
<input type="submit" value="DELETE"/>
</td>
</tr>
</table>
</form>
<br>
<%
String sql="select usertype from logindetails where userid=?";
Connection con=CrudOperation.establishConnection();
PreparedStatement ps=null;
ResultSet rs=null;
String type="";
try
{
	ps=con.prepareStatement(sql);
	ps.setString(1,reid);
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
<a href="/ehealthcare/jsp/userprofile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
<%
}
else
{
%>
<a href="/ehealthcare/jsp/profile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
<%
}%>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
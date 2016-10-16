<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show messages</title>
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
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);">MESSAGE</p>
</div>
<%
String id=request.getParameter("ms");
Connection con=CrudOperation.establishConnection();
PreparedStatement ps=null;
ResultSet rs=null;
String uid="";
String strsql="select * from message where messageid=?";
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,id);
	rs=ps.executeQuery();
	if(rs.next())
	{
		uid=rs.getString("receiverid");
%>
<div style="top:45%;left:35%;height:30%;width:30%;position:absolute;color:purple;font-size:large;background-color: silver;color:#9900cc;font-size:large;font-family:cursive;" id="div1">
<table>
<tr>
<th>Subject-</th>
<td><%=rs.getString("subject")%></td></tr>
<tr><th>Message-</th><td><%=rs.getString("messagetext")%></td>
</tr>
</table>
</div>
<% 
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
%>
<div style="top:80%;left:35%;height:10%;width:30%;position: absolute;text-align: center;">
<a href="/ehealthcare/jsp/inbox.jsp?userid=<%=uid%>" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a></div>
</body>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</html>
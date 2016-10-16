<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All users</title>
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
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);text-align: center;">ALL USERS</p>
</div>
<div id="id1" style="overflow:auto;top:40%;left:35%;width:30%;height:40%;position:absolute;text-align: center;font-family: cursive;font-size:large; ">
<table border="1" bgcolor="#9966ff" height="100%" width="100%">
<tr>
<th>User id</th>
<th>Password</th>
</tr>
<%
Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
String strsql="select * from logindetails";
con=CrudOperation.establishConnection();
try
{
	ps=con.prepareStatement(strsql);
	
	rs=ps.executeQuery();
	while(rs.next())
	{
		String data=rs.getString("userid")+","+rs.getString("usertype");
		if(rs.getString("userid").equals("admin"))
		{
		continue;
       }
%>
<tr>
<td><a href="/ehealthcare/jsp/viewdetails.jsp?data=<%=data%>"><%=rs.getString("userid")%></a> 
</td>
<td><%=rs.getString("userpass")%></td>
</tr>
<% 
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
%>
</table>
</div>
<div style="top:90%;left:35%;height:5%;width:30%;position:absolute;text-align: center;">
<a href="/ehealthcare/jsp/admin.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:96%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
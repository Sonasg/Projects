<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.db.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<div id="id2" style="top:30%;left:30%;height:5%;width:35%;position:absolute;text-align: center;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);text-align: center;">DETAILS OF SELECTED USER</p>
</div>
<div id="id1" style="top:40%;left:25%;width:50%;height:40%;position:absolute;text-align: center;font-family: cursive;font-size:large;">
<table border="1" bgcolor="#9966ff" height="100%" width="100%">
<% String id=request.getParameter("view");
String user=request.getParameter("id");
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String strsql="select * from experts where userid=?";
String value="";
String pic="";
String sql="select * from picdetail where userid=?";
PrintWriter p=response.getWriter();
con=CrudOperation.establishConnection();
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,id);
	rs=ps.executeQuery();
	if(rs.next())
	{
	%>
		<tr><td><%=rs.getString("Name")%></td></tr>
		<tr><td><%=rs.getString("skills")%></td></tr>
   <%
	}
}
	catch(SQLException se)
	{
		System.out.println(se);
	}
String nm="/ehealthcare/"+id+"/";
String xy="";
try
{
	ps=con.prepareStatement(sql);
	ps.setString(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		xy=rs.getString("name");
		nm=nm+xy;	
	}
		%>
		
		<tr><td><img src="<%=nm%>" height="20%" width="20%"></td></tr>
<%
	}
catch(SQLException se)
{
	System.out.println(se);
}
%>
</table>
</div>
<div style="top:80%;left:35%;height:5%;width:30%;position:absolute;text-align: center;">
<a href="/ehealthcare/jsp/userprofile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</body>
</html>
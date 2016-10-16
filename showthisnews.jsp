<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>News</title>
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
<div style="top:30%;left:30%;height:50%;width:40%;position:absolute;text-align:center;overflow: auto;">
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String id=request.getParameter("id");
String strsql="select * from dailynews where newsid=?";
con=CrudOperation.establishConnection();
String news="";
try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,id);
	rs=ps.executeQuery();
    if(rs.next())
	{
%>
<img src="/ehealthcare/admin/<%=rs.getString("name")%>" height="50%" width="80%"><br>
<p><%=rs.getString("news")%></p>
<% 
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
%>
</div>
<div style="top:90%;left:35%;height:5%;width:30%;position: absolute;text-align: center;">
<a href="/ehealthcare/welcome.jsp" style="font-size: xx-large;">BACK</a>
</div>
<div id="foot" style="top:96%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
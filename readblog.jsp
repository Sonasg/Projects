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
<title>Read Blog</title>
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
<div id="id3" name="div" style="top:30%;left:35%;height:10%;width:30%;position:absolute;text-align: center;border-radius:25px;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);">READ BLOG</p>
</div>
<div style="top:45%;left:25%;height:45%;width:50%;position: absolute;overflow:scroll;background-color:silver;">
<!-- <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()" height="100%" width="100%"> -->
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql3="select * from blog where date=?";
java.util.Date d1=new java.util.Date();
java.sql.Date sd=new java.sql.Date(d1.getTime());
String blog="";
String topic="";
con=CrudOperation.establishConnection();
 try
{
ps=con.prepareStatement(sql3);
ps.setDate(1,sd);
rs=ps.executeQuery(); 
 while(rs.next())
{
topic=rs.getString("topic");
%>
<ol><li><%=topic%></li></ol>
<%
blog=rs.getString("blog");
String info[]=blog.split("#");
for(int i=0;i<info.length;i++)
{
%>
<ul><li><%=info[i] %></li></ul>
<%
}
}
 if(topic.equals(""))
 {
	 %>
	 <h1 style="text-align:center;">No topics to display</h1>
	 <% 
 }
}
 catch(SQLException se)
 {
	 System.out.println(se);
}
%>
</div>
<div style="top:90%;left:45%;height:5%;width:10%;text-align: center;position: absolute;">
<a href="/ehealthcare/jsp/userprofile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:96%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
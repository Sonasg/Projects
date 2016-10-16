<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="/ehealthcare/css/style.css">
</head>
<body>
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:20%;width:80%;height:75%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<%
Connection con=null;
ResultSet rs=null;
PreparedStatement ps=null;
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userdetail");
String strsql="select * from picdetail where userid=?";
con=CrudOperation.establishConnection();
String filename="";
try
{
ps=con.prepareStatement(strsql);
ps.setString(1,uid);
rs=ps.executeQuery();
while(rs.next())
{
	filename=rs.getString("name");
}
}
catch(SQLException se)
{
	System.out.println(se);
}
String pic="\\ehealthcare\\"+uid+"\\"+filename;
if(!filename.equals(""))
{
	%>
<div style="top:30%;left:75%;height:20%;width:20%;position:absolute;">
<img src=<%=pic%> height="100%" width="100%">
</div>
<%} %>
<div style="top:82.5%;left:80%;height:10%;width:15%;position:absolute;">
<a href="/ehealthcare/jsp/writeblog.jsp?userid=<%=uid%>"><img src="/ehealthcare/images/blog.jpg" height="100%" width="100%"></a>
</div>
<div style="top:80%;left:25%;height:15%;width:50%;position: absolute;overflow:auto;background-color:silver;">
<!-- <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()" height="100%" width="100%"> -->
<ol>
<%
String sql3="select * from blog where date=?";
java.util.Date d1=new java.util.Date();
java.sql.Date sd=new java.sql.Date(d1.getTime());
String blog="";
String topic="";
java.util.Date d2=new java.util.Date();
int i=0;
 try
{
ps=con.prepareStatement(sql3);
ps.setDate(1,sd);
rs=ps.executeQuery();
while(rs.next())
{
topic=rs.getString("topic");
%>
<li><a href="/ehealthcare/jsp/comment.jsp?blog=<%=rs.getString("blogid")%>"><%=topic%></a></li>
<%
} 
if(topic.equals(""))
{
	String sql4="select * from blog";
	ps=con.prepareStatement(sql4);
	rs=ps.executeQuery();
	while(rs.next())
	{
	d2=rs.getDate("date");
	}
	java.sql.Date d=new java.sql.Date(d2.getTime());
String sql5="select * from blog where date=?";
ps=con.prepareStatement(sql5);
ps.setDate(1,d);
rs=ps.executeQuery(); 
while(rs.next())
{
topic=rs.getString("topic");
	%>
	<li><a href="/ehealthcare/jsp/comment.jsp?blog=<%=rs.getString("blogid")%>"><%=topic%></a></li>
<%
}
}
}
 catch(SQLException se)
 {
	 System.out.println(se);
	 }

%>
</ol>
</div>
<div style="top:55%;left:75%;height:5%;width:20%;position:absolute;text-align: center;">
<a href="/ehealthcare/jsp/uploadpic.jsp?userid=<%=uid%>">Change profile picture</a>
</div>
<div id="id1" style="text-align:center;top:26%;left:30%;height:10%;width:40%;position:absolute;" >
<%
if(uid==null)
{
	response.sendRedirect("/ehealthcare/jsp/login.jsp");
}
else
{
	String sql1="select Name from experts where userid=?";
	try
	{
	ps=con.prepareStatement(sql1);
	ps.setString(1,uid);
	rs=ps.executeQuery();
	if(rs.next())
	{
%>
<h2 style="background:linear-gradient(#cc66ff,pink);text-align:center;font-family:cursive;font-size:xx-large;">Hello&nbsp;<%=rs.getString("Name")%></h2>
<% 
}
}
	catch(SQLException se)
	{
		System.out.println(se);
	}
}
	%>
</div>
<div style="top:25%;left:0%;height:75%;width:20%;position:absolute;background-color:silver;font-family:cursive;font-size:large;">
<h5 style="background:linear-gradient(#cc66ff,pink);width:100%;text-align:center;">DO-</h5>
<ul>
<li><a href="tmp.jsp?data=up">update profile</a>
<br>
<li><a href="inbox.jsp?userid=<%=uid%>">Inbox</a>
<br>
<li><a href="compose.jsp?userid=<%=uid %>">Compose</a>
<br>
<li><a href="showsentmail.jsp?userid=<%=uid%>">Sent mail</a><br></li>
<li><a href="createtips.jsp?userid=<%=uid%>">Create Tips</a><br></li>
<li><a href="/ehealthcare/LogOutSer">Logout</a></li>
</ul>
</div>
<%
String name=request.getParameter("info");
con=CrudOperation.establishConnection();
try
{
	String sql="select * from experts where userid=?";
	ps=con.prepareStatement(sql);
	ps.setString(1,uid);
	rs=ps.executeQuery();
	if(rs.next())
{
%>
<div id="id1" style="top:40%;left:35%;height:30%;width:30%;position:absolute;text-align:center;">
<table border="1" bgcolor="#9966ff" align="center">
<tr><th>Name</th>
<td><%=rs.getString("Name")%></td></tr>
<tr><th>Address</th>
<td><%=rs.getString("Address")%></td></tr>
<tr><th>Email</th>
<td><%=rs.getString("email")%></td></tr>
<tr><th>Phone no.</th>
<td><%=rs.getLong("PhoneNo")%></td></tr>
<tr><th>Gender</th>
<td><%=rs.getString("Gender")%></td></tr>
<tr><th>Experience
<td><%=rs.getString("experience")%></td></tr>
<tr><th>Skills</th>
<td><%=rs.getString("skills")%></td></tr>
</table>
</div>
<%
if(name!=null&&name.equals("up"))
{
%>
<div id="id1" style="top:40%;left:35%;height:30%;width:30%;position:absolute;text-align: center;">
<form action="/ehealthcare/UpdateSerByUser" method="post">
<table bgcolor="#9966ff" border="1" align="center">
<tr>
<th>Userid</th>
<td><%=rs.getString("userid")%></td>
</tr>
<tr>
<th>Name</th>
<td><input type="text" size="20" value="<%=rs.getString("Name")%>" readonly></td>
</tr>
<tr>
<tr>
<th>Address</th>
<td><input type="text" size="20" value="<%=rs.getString("Address")%>" name="txtadd"></td>
</tr>
<tr>
<th>
Email
</th>
<td><input type="text" size="20" value="<%=rs.getString("email")%>" name="txtemail"></td>
</tr>
<tr>
<th>
Phone no</th>
<td><input type="text" size="20" value="<%=rs.getLong("PhoneNo")%>" name="txtphone"></td>
</tr>
<tr>
<td><input type="hidden" name="txthidden" value="<%=rs.getString("userid")%>"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="SUBMIT">
</td>
</tr>
</table>
</form>
</div>
<% 
}
}
}
catch(SQLException se)
{
	System.out.println(se);
} 
%> 
<div id="foot" style="top:95%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*"%>
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
<div style="top:90%;left:40%;height:5%;width:20%;position: absolute;background-color:orange;text-align: center;">
<a href="/ehealthcare/jsp/readblog.jsp" style="text-decoration: none;font-size: xx-large;">READ BLOG</a>
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
<%
} 
%>
<div style="top:55%;left:75%;height:5%;width:20%;position:absolute;text-align: center;">
<a href="/ehealthcare/jsp/uploadpic3.jsp?userid=<%=uid%>">Change profile picture</a>
</div>
<div id="id1" style="text-align:center;top:26%;left:30%;height:10%;width:40%;position:absolute;" >
<%
if(uid==null)
{
	response.sendRedirect("/ehealthcare/jsp/login.jsp");
}
	
   String sql1="select Name from userdetails where userid=?";
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
%>
</div>
<div style="top:25%;left:0%;height:75%;width:20%;position:absolute;background-color:silver;font-family:cursive;font-size:large;">
<h5 style="background:linear-gradient(#cc66ff,pink);width:100%;text-align:center;">DO-</h5>
<ul>
<li><a href="tmp1.jsp?data=up">update profile</a>
<br>
<li><a href="inbox.jsp?userid=<%=uid%>">Inbox</a>
<br>
<li><a href="compose.jsp?userid=<%=uid %>">Compose</a>
<br>
<li><a href="showsentmail.jsp?userid=<%=uid%>">Sent mail</a><br></li>
<li><a href="tmp1.jsp?data=nutritionist">View all nutritionists</a><br></li>
<li><a href="tmp1.jsp?data=dietitian">View all dietitians</a><br></li>
<li><a href="tmp1.jsp?data=yoga expert">View all yoga experts</a><br></li> 
<li>
<a href="/ehealthcare/LogOutSer">Logout</a></li>
</ul>
</div>
<div id="id1" style="top:40%;left:35%;height:30%;width:30%;position:absolute;">
<%
con=CrudOperation.establishConnection();
try
{
	String sql="select * from userdetails where userid=?";
	ps=con.prepareStatement(sql);
	ps.setString(1,uid);
	rs=ps.executeQuery();
	if(rs.next())
{
%>
<table border="1" bgcolor="#9966ff" height="100%" width="100%">
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
<tr><th>Date of Registration
<td><%=rs.getString("Dor")%></td></tr>
<tr><th>Date of Birth</th>
<td><%=rs.getString("DOB")%></td></tr>
</table>
<%
}
}
catch(SQLException se)
{
	System.out.println(se);
}
%>
</div>
<%
String name=request.getParameter("info");
String xy="";
if(name!=null)
{
%>
<div id="id1" style="top:40%;left:35%;height:30%;width:30%;position:absolute;">
<%	
if((name.equals("nutritionist")||name.equals("dietitian")||name.equals("yoga expert")))
{
	%>
	<table border="1" bgcolor="#9966ff" width="100%" height="100%">
	<%
	String sql2="select * from logindetails where usertype=? and status=?";
	try
	{
	ps=con.prepareStatement(sql2);
	ps.setString(1,name);
	ps.setString(2,"true");
	rs=ps.executeQuery();
	while(rs.next())
	{
		xy=rs.getString("userid");
		%>
		<tr><th>Id</th><td><a href="/ehealthcare/jsp/ViewNut.jsp?view=<%=xy%>&id=<%=uid%>" id="<%=rs.getString("userid")%>"><%=rs.getString("userid")%></a></td></tr>
		<% 
	}
    }
catch(SQLException se)
	{
	System.out.println(se);
	}
}
}
%>
</table>
<%
if(name!=null)
{
if(name.equals("up"))
{
	%>
<form action="/ehealthcare/UpdateOfUser" method="post">
<table bgcolor="#9966ff" border="1" height="100%" width="100%">
<%
	String sq="select * from userdetails where userid=?";
	try
	{
		ps=con.prepareStatement(sq);
		ps.setString(1,uid);
		rs=ps.executeQuery();
		if(rs.next())
		{
%>
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
<% 
}
		%>
		</table>
</form>
<%
}
catch(SQLException se)
{
	System.out.println(se);
}
}
}
%>
</div>
<div style="top:60%;left:70%;position:absolute;color:#ff3399;font-family:cursive;overflow:auto;display:none;background-color:yellow;width:25%;" id="divi">
<table>
<tr>
<td>
<img id="img1" height="10%" width="90%">
</td>
<th>NAME:</th>
<td><p id="val"></p></td></tr>
<tr><td colspan="3"><hr></td>
</tr>
<tr>
<th>SKILLS:</th>
<td>
<p id="msgtxt"></p>
</td>
</tr>
</table>
</div>
<div id="foot" style="top:95%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
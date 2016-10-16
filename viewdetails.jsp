<%@page import="java.sql.SQLException"%>
<%@page import="com.db.CrudOperation"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Details</title>
<script type="text/javascript">
function changesize()
{
document.getElementById("divn").style.height="50%";
document.getElementById("divn").style.width="50%";
}
function zoomout()
{
document.getElementById("divn").style.height="30%";
document.getElementById("divn").style.width="30%";
}
</script>
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
<%
String data=request.getParameter("data");
String info[]=data.split(",");
String ui=info[0];
String type=info[1];
String strsql="";
Connection con=null;
String name="";
ResultSet rs=null;
PreparedStatement ps=null;
if(type.equals("user"))
{
strsql=strsql+"select * from userdetails where userid=?";
con=CrudOperation.establishConnection();%>
<div id="id1" style="top:40%;left:25%;width:50%;height:40%;position:absolute;text-align: center;font-family: cursive;font-size:large;">
<table border="1" bgcolor="#9966ff" height="70%" width="100%">
<tr>
<td>User id</td>
<td>Name</td>
<td>Address</td>
<td>Email</td>
<td>Gender</td>
<td>PhoneNo</td>
<td>DOR</td>
<td>DOB</td>
</tr>
<% try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,ui);
	rs=ps.executeQuery();
	while(rs.next())
	{	
%>
<tr>
<td><%=rs.getString("userid")%></td>
<td><%=rs.getString("Name")%></td>
<td><%=rs.getString("Address")%></td>
<td><%=rs.getString("Email")%></td>
<td><%=rs.getString("Gender")%></td>
<td><%=rs.getString("PhoneNo")%></td>
<td><%=rs.getDate("Dor")%></td>
<td><%=rs.getDate("DOB") %></td>
</tr>
<%
	}
}
catch(SQLException se)
{
	System.out.println(se);
}
%>

</table></div>
<%
}
else
{
strsql="select * from experts where userid=?";
con=CrudOperation.establishConnection();%>
<div id="id1" style="top:40%;left:35%;width:60%;height:40%;position:absolute;text-align: center;font-family: cursive;font-size:large;">
<table border="1" bgcolor="#9966ff" height="70%" width="100%">
<tr>
<td>User id</td>
<td>user pass</td>
<td>Name</td>
<td>designation</td>
<td>Address</td>
<td>Email</td>
<td>Gender</td>
<td>PhoneNo</td>
<td>experience</td>
<td>skills</td>
</tr>
<% try
{
	ps=con.prepareStatement(strsql);
	ps.setString(1,ui);
	rs=ps.executeQuery();
	while(rs.next())
	{	
%>
<tr>
<td><%=rs.getString("userid")%></td>
<td><%=rs.getString("userpass")%></td>
<td><%=rs.getString("Name")%></td>
<td><%=rs.getString("designation")%></td>
<td><%=rs.getString("Address")%></td>
<td><%=rs.getString("Email")%></td>
<td><%=rs.getString("Gender")%></td>
<td><%=rs.getString("PhoneNo")%></td>
<td><%=rs.getString("experience")%></td>
<td><%=rs.getString("skills") %></td>
</tr>
<%

name="/ehealthcare/"+rs.getString("userid")+"/"+rs.getString("pic");
}
}
catch(SQLException se)
{
	System.out.println(se);
}
}
%>

</table></div>
<div id="divn" style="top:40%;left:5%;height:30%;width:30%;position: absolute;">
<%if(!(name.equals("")))
{
%>
<img  src=<%=name%> height="100%" width="100%" onmouseover="changesize()" onmouseout="zoomout()">
<%
}
%>
</div>



<div style="top:80%;left:35%;height:5%;width:30%;position:absolute;text-align: center;">
<a href="/ehealthcare/jsp/admin-allusers.jsp" style="color:purple ;font-weight: bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:90%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
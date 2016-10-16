<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.*,com.beans.*,java.util.*,ehealthcare.ser.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sent Mail</title>
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
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);">SENT MAILS</p>
</div>
<%
CrudOperation cr=new CrudOperation();
String seid=request.getParameter("userid");
String strsql="select * from message where senderid=? and sstatus=?";
ArrayList<Message> infolist=cr.showsentMessage(strsql,seid);
%>
<div  style="top:45%;left:35%;height:30%;width:30%;position:absolute;text-align: center;overflow:auto;">
<form action="/ehealthcare/SentMail" method="post">
<table border="1" bgcolor="#9966ff" height="100%" width="100%">
<tr>
<th>Select</th>
<th>Subject</th>
<th>Receiver id</th>
<th>Date</th>
<td><input type="hidden" value="<%=seid%>" name="txthidden"></td></tr>
<%
for(int i=0;i<infolist.size();i++)
{ 
	Message r=infolist.get(i);
%>
<tr>
<td><input type="checkbox" name="chkdelete" value=<%=r.getMsgid()%>>
<td><a href="/ehealthcare/jsp/showmsg1.jsp?ms=<%=r.getMsgid()%>" style="color:black;"><%=r.getSub()%></a></td>
<td><%=r.getRecid()%></td>
<td><%=r.getDate()%></td>
</tr>
<tr>
<%
}
%>
<tr><td colspan="4" align="center">
<input type="submit" value="DELETE"/>
</td>
</tr>
</table>
</form>
</div>
<div style="top:80%;left:35%;height:5%;width:5%;position:absolute;text-align:center;">
<%
String sql="select usertype from logindetails where userid=?";
Connection con=CrudOperation.establishConnection();
PreparedStatement ps=null;
ResultSet rs=null;
String type="";
try
{
	ps=con.prepareStatement(sql);
	ps.setString(1,seid);
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
<a href="/ehealthcare/jsp/userprofile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;text-align: center;">BACK</a>
<%
}
else
{
%>
<a href="/ehealthcare/jsp/profile.jsp" style="color:purple ;font-weight: bold;font-size: x-large;text-align: center;">BACK</a>
<%
}
%>
</div>
<div id="foot" style="top:100%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
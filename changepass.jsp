<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div style="top:25%;left:0%;width:100%;height:120%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<%
try{
HttpSession hs=request.getSession(false);
String info=(String)hs.getAttribute("detail");
String [] info1=info.split(",");
String uid=info1[0];
String utype=info1[1];
if(uid!=null){
%>
<div style="top:0%;left:40%;height:30%;width:40%;position:absolute;">
<p style="font-size: 200%;text-align: center;text-decoration: underline;color: red;font-weight: bold;">Change your password</p>
</div>

<div style="top:20%;left:40%;height:30%;width:40%;position:absolute;background-color: orange">
<form onsubmit="return main4()" action="/ehealthcare/ChangePass" method="post">
<table>
<tr><th> Old Password:</th><td><input type="text" name="txtpass" id="txtpass" onblur="chckpass(this.value)"></td></tr>
<tr><th> New Password:</th><td><input type="password" name="txtpass1" id="txtpass1"></td></tr>
<tr><th> Confirm New Password:</th><td><input type="password" name="txtpass2" id="txtpass2"></td></tr>
<tr><td></td><td><input type="submit" value="submit"></td></tr>
</table>
</form>
</div>
<div  style="top:45%;left: 40%;height:10%;width:30%;position: absolute;">
<p id="correctpass" style="color: orange;font-size: large;font-family: cursive;"></p>
</div>
<%
}
}catch(NullPointerException p) {
	response.sendRedirect("/ehealthcare/jsp/changepass.jsp");
} %>
</body>

</html>
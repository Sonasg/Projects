<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ehealthcare.ser.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User registration</title>
<script src="/ehealthcare/js/validation.js"></script>
<script>
function Main()
{
/* var ui=document.getElementById("txtuserid").value;
	
	if(checkEmpty(ui)==false)
		{
		alert("enter user ID");
		document.getElementById("txtuserid").focus();
		return false;
	
		} */
	
	var upass=document.getElementById("txtpass").value;
	if(checkEmpty(upass)==false)
	  {
	alert("enter user password");
	document.getElementById("txtpass").focus();
	return false;
	  }
	
	if(checkLength(upass)==false)
	   {
	   
	  alert("Password less than 8");
	  document.getElementById("txtpass").focus();
	  return false;
	   }
	var nm=document.getElementById("txtname").value;
	if(checkEmpty(nm)==false)
		{
		alert("enter name");
		document.getElementById("txtname").focus();
		return false;
		}
	
	var add=document.getElementById("txtaddress").value;
	if(checkEmpty(add)==false)
		{
		alert("enter the address");
		document.getElementById("txtaddress").focus();
		return false;
		}
	
	var email=document.getElementById("emailname").value;
	if(checkEmpty(email)==false)
		{
		alert("enter email");
		document.getElementById("emailname").focus();
		return false;
		}
	var gender=document.getElementsByName("gender");
	if(checkChk(gender)==false)

		{
		alert("select gender");
		return false;
		}

	var phone=document.getElementById("txtphone").value;
	if(checkEmpty(phone)==false)
		{
		alert("enter phone no");
		document.getElementById("txtphone").focus();
		return false;
		}
	var reg=document.getElementById("txtreg").value;
	if(checkEmpty(reg)==false)
		{
		alert("enter dor");
		document.getElementById("txtreg").focus();
		return false;
		}
	var dob=document.getElementById("txtdob").value;
	if(checkEmpty(dob)==false)
		{
		alert("enter dob");
		document.getElementById("txtdob").focus();
		return false;
		}
	
}
/* function checkUserid(userid)
{
	var x;
	if(XMLHttpRequest)
		{
		x=new XMLHttpRequest();
		}
	else
		{
		x=new ActiveXObject("Microsoft.XMLHTTP");
		}
	
	x.onreadystatechange=function()
	{
		if(x.readyState==4&&x.status==200)
			{
			var info=x.responseText;
			document.getElementById("msgtext").innerHTML=info;
			}
	}
	x.open("GET","/ehealthcare/UserRegister?ui="+userid,"true");
	x.send();
	} */
	function chkph(ph) {
		var x;
		if(XMLHttpRequest)
			x=new XMLHttpRequest();
		else 
			x=new ActiveXObject("Microsoft.XMLHTTP");
		x.onreadystatechange=function() {
			if(x.readyState==4 && x.status==200) {
				var info=x.responseText;
				if(info!="")
				alert(info);
			}
		}
		x.open("get", "/ehealthcare/Register?ph="+ph, "true");
		x.send();
	}

	
	
	function chkmail(mail) {
		var x;
		if(XMLHttpRequest)
			x=new XMLHttpRequest();
		else 
			x=new ActiveXObject("Microsoft.XMLHTTP");
		x.onreadystatechange=function() {
			if(x.readyState==4 && x.status==200) {
				var info=x.responseText;
				document.getElementById("ml").innerHTML=info;
			}
		}
		x.open("get", "/ehealthcare/Register?mail="+mail, "true");
		x.send();
	}

	
	function calcid()
	{
		var x;
		if(XMLHttpRequest)
			{
			x=new XMLHttpRequest();
			}
		else
			{
			x=new ActiveXObject("Microsoft.XMLHTTP");
			}
		x.onreadystatechange=function()
		{
			if(x.readyState==4&&x.status==200)
				{
				var info=x.responseText;
				l=info.split("_");
				if(l[1]=="")
				{
				val="user_1";
				}
				else
					{
				    z=Number(l[1])+1;
				    val="user_"+z;
					}
				document.getElementById("txtuserid").value=val;
				}
		}
		x.open("GET","/ehealthcare/CalcId?type=user","true");
		x.send();
		}
	
</script>
</head>
<body onload="calcid()">
<div id="id1" style="top:5%;left:0%;height:50%;width:100%;position:absolute;">
<jsp:include page="/jsp/header.jsp">
<jsp:param value="b.jpg" name="img"/>
</jsp:include>
</div>
<div style="top:25%;left:0%;width:100%;height:100%;position:absolute;">
<img src="/ehealthcare/images/wall1.jpg" height="100%" width="100%">
</div>
<div id="msgtext" style="top:40%;left:75%;height:5%;width:5%;position:absolute;color:teal ;font-family: cursive;font-size: large;"></div>
<div id="id2" style="top:30%;left:30%;height:5%;width:39%;position:absolute;text-align: center;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);text-align: center;">ENTER DETAILS FOR REGISTRATION</p>
</div>
<div style="top:40%;left:35%;height:30%;width:30%;position: absolute;text-align: center;">
<form onsubmit="return Main()" action="/ehealthcare/UserRegister" method="post" style="color:#9900cc;font-family: cursive;" >
<table bgcolor="silver">
<tr>
<th align="left">UserId</th>
<td><input type="text" size="20" name="txtuserid" id="txtuserid" readonly>
</td>
<tr>
<th align="left">Password</th>
<td><input type="password" id="txtpass" size="20" name="txtpass"></td>
</tr>
<tr>
<th align="left">Name</th>
<td><input type="text" id="txtname" size="20" name="txtname">
</tr>
<tr>
<th align="left">Address</th>
<td><input type="text" id="txtaddress" size="20" name="txtaddress">
</td>
<tr>
<tr>
<th align="left">Email</th>
<td><input type="email" id="emailname" size="20" name="txtemail">
</td>
</tr>

<tr>
<th align="left">Gender</th>
<td style="color:black;font-family: times new roman;">
<input type="radio" value="male" name="gender" id="gender">Male
<input type="radio" value="female" name="gender" id="gender">Female
</td>
</tr>
<tr>
<th align="left">Phone no</th>
<td><input type="text" size="20" name="txtphone" id="txtphone"  onblur="chkph(this.value)">
</td>
</tr>
<tr>
<th align="left">Date of Registration</th>
<%
java.util.Date d=new java.util.Date();
java.sql.Date sd=new java.sql.Date(d.getTime());
%>
<td><input type="text" size="20" name="txtreg" id="txtreg" value=<%=sd%> readonly>
</td>
<tr>
<tr>
<th align="left">Date Of Birth(yyyy-mm-dd)</th>
<td><input type="text" size="10" name="txtdob" id="txtdob">
</td>
</tr>
<tr>
<th align="left">Security question</th>
<td>
<select name="security">
<option value="select">Select any one</option>
<option value="What is your birthplace?">What is your birthplace?</option>
<option value="What is your favourite book?">What is your favourite book?</option>
</select>
</td>
<td>
<input type="text" size="20" name="val">
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="submit" style="border-radius:25px;border-style:none;color:white;font-family:aharoni;font-size:large;background-color:#6600ff;">
</td>
</tr>
</table>
</form>
<br>
<a href="/ehealthcare/jsp/login.jsp" style="color:purple;font-weight:bold;font-size: x-large;">BACK</a>
</div>
<div id="foot" style="top:110%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
</body>
</html>
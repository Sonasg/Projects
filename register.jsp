<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script src="/ehealthcare/js/validation.js"></script>
<script>
function Main()
{
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
	var gender=document.getElementsByName("gender");
	if(checkChk(gender)==false)

		{
		alert("select gender");
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
	var phone=document.getElementById("txtphone").value;
	if(checkEmpty(phone)==false)
		{
		alert("enter phone no");
		document.getElementById("txtphone").focus();
		return false;
		}
	
	var exp=document.getElementById("txtexp").value;
	if(checkEmpty(exp)==false)
		{
		alert("enter exp");
		document.getElementById("txtexp").focus();
		return false;
		}
	var skills=document.getElementById("txtskills").value;
	if(checkEmpty(skills)==false)
		{
		alert("enter skills");
		document.getElementById("txtskills").focus();
		return false;
		}
	var cmb=document.getElementById("security");
	var quesname=cmb.options[cmb.getselectedIndex].value;
	if(checkCombo1(quesname)==false)
		{
		alert("select any one question");
		return false;
		}
	/* if(chkPh(ph)==false) {
		alert("Incorrect phone number. Please check it.(10 digits)");
		document.getElementById("pno").focus();
		return false;
	}
if(chkPh(ph)==true && (ph.charAt(0)!='8'&& ph.charAt(0)!='9'&& ph.charAt(0)!='7')) {
	alert("Phone number should begin with 7,8 or 9");
	document.getElementById("pno").focus();
	return false;
}
	 */
}
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
	y=document.getElementById("a").value;
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
			l=info.split("$");
			arr=l[0].split("_");
			if(arr[1]=="")
				{
				val="expert_1";
				}
			else
				{
			     z=Number(arr[1])+1;
			     val="expert_"+z;
				}
			
			document.getElementById("txtuserid").value=val;
			document.getElementById("upload").href="/ehealthcare/jsp/uploadpic4.jsp?id="+val+"&type="+l[1];
			document.getElementById("a").value=l[1];
			}
	}
	x.open("GET","/ehealthcare/CalcId?type="+y,"true");
	x.send();
	}
</script>
<%
String utype=request.getParameter("type");
String file=request.getParameter("file");
%>
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
<div id="msgtext" style="top:35%;left:75%;height:5%;width:5%;position:absolute;color:teal ;font-family: cursive;font-size: large;"></div>
<div id="id2" style="top:30%;left:30%;height:40%;width:39%;position:absolute;text-align: center;">
<p style="text-decoration:underline;font-family:monotype corsiva;font-size: x-large;font-weight: bold;background:linear-gradient(#cc66ff,pink);text-align: center;">ENTER DETAILS FOR REGISTRATION</p>
<form onsubmit="return Main()" action="/ehealthcare/Register?file=<%=file%>" method="post" style="color:#9900cc;" >
<table bgcolor="silver" style="font-family:cursive;">
<tr>
<th align="left">UserId</th>
<td><input type="text" size="20" name="txtuserid" id="txtuserid" readonly >
</td>
<tr align="center"><td colspan="2"><a id="upload">upload certificate</a>
</td>
</tr>
<tr>
<th align="left">Password</th>
<td><input type="password" id="txtpass" size="20" name="txtpass"></td>
</tr>
<tr>
<th align="left">Name</th>
<td><input type="text" id="txtname" size="20" name="txtname">
</td>
<tr>
<th align="left">Designation</th> 
<td><input type="text" id="a" value="<%=utype%>" readonly name="designation">
</td>
</tr>
<tr>
<th align="left">Gender</th>
<td style="color:black;font-family:times new roman;">
<input type="radio" value="male" name="gender" id="gender">Male
<input type="radio" value="female" name="gender" id="gender">Female
</td>
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
<tr>
<tr>
<th align="left">Phone no</th>
<td><input type="text" size="20" name="txtphone" id="txtphone" onblur="chkph(this.value)">
</td>
<tr>
<tr>
<th align="left">Experience</th>
<td><input type="text" size="20" name="txtexp" id="txtexp">
</td>
<tr>
<tr>
<th align="left">Skills</th>
<td>
<textarea rows="5" cols="51" name="txtskills" id="txtskills">
</textarea>
</td>
</tr>
<tr>
<th align="left">Security question</th>
<td>
<select name="security" id="security">
<option value="select">select any one</option>
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
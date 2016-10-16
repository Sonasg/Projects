<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function ques()
{
	var x;
	id=document.getElementById("b").value;
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
			arr=info.split("$");
			arr1=arr[1].split("*");
			document.getElementById("a").innerHTML=arr[0];
			document.getElementById("c").value=arr1[0];
			document.getElementById("d").value=arr1[1];
		}
		
		
	}
		x.open("GET","/ehealthcare/Ques?id="+id,"true");
		x.send();
	
}

function ans()
{
	if(document.getElementById("c").value==document.getElementById("s").value)
	{
		alert("Your password is-"+document.getElementById("d").value);
	}	
} 
</script>
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
<div style="top:30%;left:35%;height:20%;width:30%;position:absolute;">
<input type="hidden" id="c">
<input type="hidden" id="d">
Enter your id
<input type="text" size="20" id="b">
<input type="button" value="submit" onclick="ques()">
<p id="a"></p>
<br>
Enter your answer
<input type="text" size="20" id="s">
<input type="button" value="submit" onclick="ans()">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<script type="text/javascript">
function showCtrl()
{
	document.getElementById("vision1").style.display="none";
	document.getElementById("history1").style.display="none"; 
	document.getElementById("team1").style.display="block";
}
function showHis()
{
	document.getElementById("vision1").style.display="none";
		document.getElementById("history1").style.display="block";
		}
function showVis()
		{
		document.getElementById("vision1").style.display="block";
		}
</script>
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
<!-- 
<div id="image" style="top: 0%;left: 0%;width: 100%;height: 100%;position: absolute;">
<img src="/e-healthcare/images/featured47@wdd2x.jpg" height="100%" width="100%"></div>
<div id="id1" name="div" style="top:0%;left:0%;height:15%;width:50%;position:absolute;">
<img src="/e-healthcare/images/b.jpg" style="height:100%; width:100%;"></div>
<div id="blank" style="top:0%;left: 50%;height: 15%;width: 50%;position: absolute;background-color: white;;">
<img src="/e-healthcare/images/11.jpg" height="100%" width="100%"></div>- </div>
<div id="id2" name="div" style="top:15%;left:0%;height:4%;width:100%;position:absolute;background-image:url('/e-healthcare/images/e.jpg');">
</div>
 -->
<div id="team" style="top:30%;left:10%;width:20%;height:15%;position: absolute;background-color: orange;text-align: center;">
<a style="color: white;text-decoration: none;font-size: xx-large;" href="javascript:showCtrl()">Our Yoga<br>Experts</a></div>

<div id="history" style="top:50%;left: 10%;width:20%;height:15%;position: absolute;background-color: orange;text-align: center;">
<a style="color: white;text-decoration: none;font-size: xx-large;" href="javascript:showHis()">Our Dieticians</a></div>

<div id="vision" style="top:70%;left:10%;width:20%;height:15%;position: absolute;background-color: orange;text-align: center;">
<a style="color: white;text-decoration: none;font-size: xx-large;" href="javascript:showVis()">Our Nutritionists</a></div>

<div id="team1" style="top:30%;left: 33%;width: 30%;height:60%;position: absolute;background-color: white;display:none;">
<h2 style="color: black;font-family: Palatino Linotype;text-align: center;">Contact Yoga Experts
</h2><h3 style="text-align: justify;font-family: Times New Roman;">
<ul>
<li>Mr. H.K. Dass(MSc. Biology)  - 9792000888</li>
<li>Mr. S.Gupta(PhD. Ayurveda) - 9838281555</li>
<li>Ms.Swati(Msc. Biology) - 8960111222</li>
<li>Ms. Deswal(Trainer) - 7876222444</li>
</ul></h3></div>
<div id="history1" style="top:30%;left: 33%;width: 30%;height:60%;position: absolute;background-color: white;display:none;">
<h2 style="color: black;font-family: Palatino Linotype;text-align: center;">Contact Dietitians
</h2>
<h3 style="font-family: Times New Roman;text-align: justify;">
<ul>
<li>Mr.R. Bali(PhD. Chemistry) - 7372709022</li><br>
<li>Ms.S. Arora(MBBS,MDS) - 8960222522</li><br>
<li>Ms. Goel(MSc. Medicine) - 9415098765</li><br>
<li>Mr.J. Korth(MSc. Chemistry)- 9026777222</li>
</ul></h3></div>
<div id="vision1" style="top:30%;left: 33%;width: 30%;height:60%;position: absolute;background-color: white;display:none;">
<h2 style="color: black;font-family: Palatino Linotype;text-align: center;">Contact Nutritionists
</h2><h3 style="font-family: Times New Roman;text-align: justify;">
<ul>
<li>Ms.D. Taneja(PhD. Chemistry) - 73725670982</li><br>
<li>Mr.S.K. Dayanand(MBBS) - 8960222125</li><br>
<li>Ms. Sachdeva(MSc. Medicine) - 9898765567</li><br>
<li>Mr. Grover(Msc. Ayurveda)- 9025521222</li>
</ul></h3></div>
<div id="contimg" style="top:30%;left: 64.8%;width:35%;height:50%;position: absolute;background-color: white; ">
<img src="/ehealthcare/images/templatemo_contact1.jpg" height="100%" width="100%"></div>
<a href="/ehealthcare/welcome.jsp" style="color:purple ;font-weight: bold;font-size: x-large;top:100%;left:35%;height:5%;width:30%;position: absolute;text-align: center;">BACK</a><div id="foot" style="top:110%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>

</body>
</html>
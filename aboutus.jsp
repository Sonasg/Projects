<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About us</title>
</head>
<body>
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
<img src="/e-healthcare/images/11.jpg" height="100%" width="100%"></div></div>
<div id="id2" name="div" style="top:15%;left:0%;height:4%;width:100%;position:absolute;background-image:url('/e-healthcare/images/e.jpg');">
</div> -->
<div id="team" style="top:30%;left:20%;width:20%;height:15%;position:absolute;background-color: orange;text-align: center;"><a style="color: white;text-decoration:none;font-size:xx-large;" href="javascript:showCtrl()">Our Team</a></div>
<div id="history" style="top:50%;left: 20%;width:20%;height:15%;position: absolute;background-color: orange;text-align: center;" ><a style="color: white;text-decoration:none;font-size:xx-large;" href="javascript:showHis()">Our History</a></div>
<div id="vision" style="top:70%;left:20%;width:20%;height:15%;position: absolute;background-color: orange;text-align: center;" ><a style="color: white;text-decoration:none;font-size:xx-large;" href="javascript:showVis()">Our Vision</a></div>
<div id="team1" style="top:30%;left:45%;width: 35%;height:60%;position: absolute;background-color: white;text-align: justify;overflow:auto;display: none;"><h2 style="color: black;font-family: Palatino Linotype;text-align: center;">Our Team
</h2> Our Team Consists Of Highly Qualified Yoga Experts,Dieticians And Nutritionists From Every Corner Of The Globe. Consisiting Of About More Than 150 Panel Members,Our Team Has The Brightest Youth And The Most Experienced Experts. Board Of Directors Include :
<h3 style="font-family: Times New Roman;text-align: justify;">
<ul>
<li>Ms.S. Chawla(CEO)</li><br>
<li>Mr. Mandhyan(CFO)</li><br>
<li>Ms.S. Gupta(G.M.)</li><br>
<li>Mr.Kumar(Chief Advisor)</li><br>
<li>Ms. Arora(Tech. Head)</li><br>
<li>Mr. Tiwari(HR Head)</li>
</ul></h3></div>
<div id="history1" style="top:30%;left:45%;width: 35%;height:60%;position: absolute;background-color: white;text-align: left;display:none;overflow:auto;"><h2 style="color: black; font-family: Palatino Linotype;text-align: center;">Our History
</h2>
The Enterprise UNITY HEALTHCARE Is Basically A Comapny,Established In The Year 2012(India).It Was Founded By Three Of It's Members Namely,Ms.Chawla(CEO),Mr. Mandhyan(CFO) & Ms. Gupta(G.M.).<br>The Company Has Soared And Achieved Great Heights In Just 2 Years Since It's Establishment. The Company Assets Are Worth 20,000 Crores Making It A Million Dollar Company Presently.
<br>
The Company Presently Has Around 1325 Offices Around The World,Providing Employement To About 13,20,513 Families WorldWide.<br><br></div>
<div id="vision1" style="top:30%;left:45%;width: 35%;height:60%;position: absolute;background-color: white;text-align: justify;display: none;overflow: auto;"><h2 style="color: black;font-family: Palatino Linotype;text-align: center;">Our Vision
</h2>Our Vision Is To Guide The People Of The World Towards A Healthy LifeStyle.<br><br> To Provide All The Necessary Assistance,Advices,Consults,Awareness,Plans; So That People Around The Globe Lead A better Life;Free From All Types Of Health Problems<br><br> UNITY HEALTHCARE Aims At Providing All Such Solutions Which Can Make The World HEALTHY,WEALTHY & WISE. . .
</div>
<a href="/ehealthcare/welcome.jsp" style="color:purple ;font-weight: bold;font-size: x-large;top:100%;left:35%;height:5%;width:30%;position: absolute;text-align: center;">BACK</a>
<div id="foot" style="top:110%;left:37%;width:26%;height:3%;position:absolute;background-color: white;text-align: center;">Copyright © 2014 Company Name - Unity Healthcare</div>
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
</body>
</html>
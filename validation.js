function checkEmpty(data)
{
if(data.length==0)
	return false;
return true;
}

function checkLength(data)
{
if(data.length>10)
	return false;
return true;
}

function checkCombo(info)
{
if(info=="select designation")
	{
     return false;	
	}
else
	{     return true;

	}
}
function checkCombo1(info)
{
	if(info=="select any one")
		{
		return false;
		}
	else
		{
		return true;
		}
}


function checkChk(chkarr)
{
	var flag=0;
for(i=0;i<chkarr.length;i++)
	{
	if(chkarr[i].checked)
		{
		flag=1;
		break;
		}
	}
   if(flag==0)
	   {
	   return false;
	   }
   else
	   {
	   return true;
	   }

}

function chkPh(ph){
	//alert(ph+"  "+ph.length);
	if(ph.length!=10){
		return false;
	}
	
	return true;
}

function checkPLen(data){
	if(data.length>10) {
		document.getElementById("pass").innerHTML="Password should not be of more than 10 characters";
		return false;
	}
	return true;	
}
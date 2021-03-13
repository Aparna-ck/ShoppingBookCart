<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
 <script>  
function validateform(){  
var userId=document.myform.userId.value;  
var password=document.myform.password.value;
var email=document.myform.email.value;  
var atposition=email.indexOf("@");  
var dotposition=email.lastIndexOf("."); 
var address=document.myform.address.value;
var city=document.myform.city.value;
var pincode=document.myform.pincode.value;


if (userId==null || userId=="" || userId.trim()==""){  
  alert("UserId can't be blank");  
  return false;  
}else if(isNaN(userId) || userId.length != 10){
	alert("UserId should be 10 digit number");
	return false;
}else if(password.length<6 || password.trim()==""){  
  alert("Password must be at least 6 characters long.");  
  return false;  
}else if(atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length || email.trim()==""){  
    alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
    return false;  
 }else if(address==null || address=="" || address.trim()==""){
	 alert("Please Enter Your Address Here");
	 return false;
 }else if(city==null || city=="" || city.trim()==""){  
	  alert("city can't be blank");  
	  return false; 
 }else if(!isNaN(city) || city.length < 2){
		alert("Invalid city");
		return false;
 }else if(pincode==null || pincode=="" || pincode.trim()==""){
	 alert("Pincode can't be blank");
	 return false;
 }else if(isNaN(pincode) || pincode.length != 6){
	 alert("Pincode should be 6 digits ");
	 return false;
 }
}
</script>  
</head>

<body>
<h1>Register Form</h1>
<form:form name="myform"  action="newUser" method="POST" modelAttribute="users" onsubmit="return validateform()">

<table>
<tbody>
<tr>
<td><label>UserID </label></td>
<td><form:input path="userId" name="userId"/></td>
</tr>

<tr>
<td><label>Password</label></td>
<td><form:input path="password" name="password"/></td>
</tr>

<tr>
<td><label>Email Address</label></td>
<td><form:input path="email" name="email"/></td>
</tr>

<tr>
<td><label>Address</label></td>
<td><form:input path="address" name="address"/></td>
</tr>

<tr>
<td><label>City</label></td>
<td><form:input path="city" name="city"/></td>
</tr>

<tr>
<td><label>Pincode</label></td>
<td><form:input path="pincode" name="pincode"/></td>
</tr>


<tr>
<td><label></label></td>
<td><input type="submit" value="Register"></td>
</tr>

</tbody>

</table>
</form:form>


</body >
</html>
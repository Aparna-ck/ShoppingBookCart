<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script>  
function validateform(){  
var userId=document.myform.userId.value;  
var email=document.myform.email.value;  
var atposition=email.indexOf("@");  
var dotposition=email.lastIndexOf("."); 
var pincode=document.myform.pincode.value;


if (userId==null || userId=="" || userId.trim()==""){  
  alert("UserId can't be blank");  
  return false;  
}else if(isNaN(userId) || userId.length != 10){
	alert("UserId should be 10 digit number");
	return false;
}else if(atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length || email.trim()==""){  
    alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
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
<form:form  name="myform" action="forgetPasswordDetails" method="POST" modelAttribute="users" onsubmit="return validateform()">

<table border="1" width="100%">
<tbody>
<tr>
<td><label>UserID</label></td>
<td><form:input path="userId" name="userId"/></td>
</tr>

<tr>
<td><label>Email ID</label></td>
<td><form:input path="email" name="email"/></td>
</tr>

<tr>
<td><label>PINCODE</label></td>
<td><form:input path="pincode" name="pincode"/></td>
</tr>

<tr>
<td><input type="submit" value="Confirm" >
</tr>
</tbody>
</table>
<br><br>
</form:form>

<c:out value="${message}"></c:out>
</body>
</html>
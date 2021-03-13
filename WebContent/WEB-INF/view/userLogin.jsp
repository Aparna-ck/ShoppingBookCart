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
var password=document.myform.password.value;  
  
if (userId==null || userId=="" || userId.trim()==""){  
  alert("UserId can't be blank");  
  return false; 
}else if(isNaN(userId) || userId.length != 10){
	alert("UserId should be 10 digit number");
	return false;
}else if(password.length<6 || password.trim()==""){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
}  
</script>  
</head> 
<body>
<h1>Login Form</h1>
<form:form name="myform" action="showBooks" method="POST" modelAttribute="users" onsubmit="return validateform()">

<table>
<tbody>
<tr>
<td><label>UserID</label></td>
<td><form:input path="userId" name="userId"/></td>
</tr>

<tr>
<td><label>Password</label></td>
<td><form:input path="password" name="password"/></td>
</tr>

<tr>
<td><input type="button" value="Register" 
	onclick="window.location.href='showForm';  return false;" /></td>
<td><input type="submit" value="Login"></td>
</tr>
</tbody>
</table>
<br><br>
<c:url var="forgetpasswordLink" value="/books/forgetPassword">
</c:url>

<a href="${forgetpasswordLink}">Forget Password</a>
</form:form>
<c:out value="${message}"></c:out>
</body>
</html>
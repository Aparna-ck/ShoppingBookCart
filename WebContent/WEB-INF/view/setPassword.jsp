<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script >
function validateform(){  
	var city=document.myform.city.value;
	var password=document.myform.password.value;
	
	if(city.length<6 || city.trim()=="" || city==null || city==""){  
		  alert("Password must be at least 6 characters long.");  
		  return false;
	} else if(password.length<6 || password.trim()=="" || password==null || password==""){  
			  alert("Password must be at least 6 characters long.");  
			  return false;
	} else if(city != password){
		alert("password dosen't match");
		return false;
	
	}
}	  
</script>
</head>
<body>
<form:form name="myform" action="newPassword" method="POST" modelAttribute="users" onsubmit="return validateform()" >
<form:hidden path="userId"/>
<table border="1" width="100%">
<tbody>
<tr>
<td><label>Set Password:</label></td>
<td><form:input path="city" name="city"/></td>
</tr>

<tr>
<td><label>Confirm New Password:</label></td>
<td><form:input path="password" name="password"/></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Ok"></td>
</tr>
</tbody>
</table>
</form:form>
<c:out value="${message}"></c:out>
</body>
</html>
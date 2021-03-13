<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
</head>
<body>

<h3>User Details</h3>

<table border="1" width="100%">
<tr>
<th>UserId</th>
<th>Password</th>
<th>Email Address</th>
<th>Address</th>
<th>City</th>
<th>Pincode</th>
</tr>



<tr>
<td>${userss.userId}</td>
<td>${userss.password}</td>
<td>${userss.email}</td>
<td>${userss.address}</td>
<td>${userss.city}</td>
<td>${userss.pincode}</td>
</tr>

</table>

<input type="button" value="Confirm" 
onclick="window.location.href='loginUser';  return false;" />


</body>
</html>
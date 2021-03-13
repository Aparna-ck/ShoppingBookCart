<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function validateform(){  
	var quantity=document.myform.quantity.value;
	
	if (quantity==null || quantity=="" || quantity.trim()==""){  
		  alert("Quantity can't be blank");  
		  return false;  
		}else if(isNaN(quantity) || quantity<1){
			alert("Quantity should be number");
			return false;
		}
}
</script>
</head>
<body>
<h1>Shopping Cart for Book Store</h1>
<h3>Book Details</h3>
<table >
<tr>
</tr>
<tr>
<td>Books_Id</td>
<td>:</td>
<td>${books.book_id}</td>
</tr>

<tr>
<td>Books_Name</td>
<td>:</td>
<td>${books.book_name}</td>
</tr>

<tr>
<td>Author</td>
<td>:</td>
<td>${books.author}</td>
</tr>

<tr>
<td>Price</td>
<td>:</td>
<td>${books.price}</td>
</tr>
<form:form  name="myform" action="getQuantity" method="POST" modelAttribute="order" onsubmit="return validateform()">
<form:hidden path="book_id"/>
<tr>
<td><label>Quantity</label></td>
<td><label>:</label></td>
<td><form:input path="quantity" name="quantity"/></td>
<td>
</table>
<input type="submit" value="Purchase">
<input type="button" value="Cancel" 
onclick="window.location.href='showBooks';  return false;" />
</form:form>
</body>
</html>
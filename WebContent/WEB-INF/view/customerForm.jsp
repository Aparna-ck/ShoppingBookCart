<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Customer</title>
 <script>  
function validateform(){  
var cust_name=document.myform.cust_name.value;
var address=document.myform.address.value;
var phone_no=document.myform.phone_no.value;

if(cust_name==null || cust_name=="" || cust_name.trim()==""){  
	  alert("Name can't be blank");  
	  return false; 
	}else if (phone_no==null || phone_no=="" || phone_no.trim()==""){  
	  alert("phone_no can't be blank");  
	  return false;  
	}else if(isNaN(phone_no) || phone_no.length != 10){
		alert("phone_no should be 10 digit number");
		return false;
	}else if(address==null || address=="" || address.trim()==""){
		 alert("Please Enter Your Address Here");
		 return false;
	}
}
</script>
</head>
<body>
<h1>Shopping Cart for Book Store</h1>
<h3>User Details</h3>

<form:form name="myform" action="confirmPurchase" method="POST" modelAttribute="order" onsubmit="return validateform()">
<form:hidden path="book_id"/>
<form:hidden path="quantity"/>
<table>
<tbody>


<tr>
<td><label>Customer Name</label></td>
<td><form:input path="cust_name" name="cust_name"/></td>
</tr>

<tr>
<td><label>Phone Number</label></td>
<td><form:input path="phone_no" name="phone_no"/></td>
</tr>

<tr>
<td><label>Address</label></td>
<td><form:input path="address" name="address"/></td>
</tr>


</tbody>
</table>
<br><br>
<table border="1" width="100%">
<tr>
<th>Book Name</th>
<th>Author</th>
<th>Price</th>
<th>Quantity</th>
</tr>

<tr>
<td>${books.book_name}</td>
<td>${books.author}</td>
<td>${books.price}</td>
<td>${order.quantity}</td>
</tr>


</table>
<table>
<tr>
<td><input type="submit" value="Confirm"></td>
<td><input type="button" value="Cancel" 
onclick="window.location.href='showBooks';  return false;" /></td>
</tr>
</table>
</form:form>
</body>
</html>
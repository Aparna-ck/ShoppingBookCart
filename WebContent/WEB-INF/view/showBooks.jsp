<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome page</title>
</head>
<body>
<h1>Shopping Cart for Book Store</h1>
<h3>Books List</h3>
<table border="1" width="100%">

<tr>
<th>Books_Id</th>
<th>Books_Name</th>
<th>Author</th>
<th>Price</th>
</tr>
<c:forEach var="books" items="${books}">

<c:url var="chooseBook" value="/books/chooseBook">
<c:param name="book_id" value="${books.book_id }"></c:param>
</c:url>
<br><br>
<tr>
<td>${books.book_id}</td>
<td><a href="${chooseBook}">${books.book_name}</a></td>
<td>${books.author}</td>
<td>${books.price}</td>
</tr>

</c:forEach>
</table>
</body>
</html>